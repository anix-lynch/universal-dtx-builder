#!/bin/bash

# 🚀 UNIVERSAL DTX GENERATOR
# Edit these 5 variables for any MCP server:

PACKAGE_NAME="@your/mcp-package"           # npm package name
SERVICE_NAME="yourservice"                 # lowercase name
DISPLAY_NAME="Your Service MCP"            # human readable
API_KEY_NAME="YOUR_API_KEY"               # environment variable
DESCRIPTION="Your service description"     # what it does

# Optional: Your API key (saves manual entry later)
DEFAULT_API_KEY=""                         # leave empty or add your key

#######################################################
# DON'T EDIT BELOW - UNIVERSAL PATTERN
#######################################################

WORKSPACE="$(pwd)/DTX_Workspace"
PROJECT_DIR="$WORKSPACE/${SERVICE_NAME}-mcp"

echo "🚀 Creating ${DISPLAY_NAME} DTX..."

# Clean & setup
rm -rf "$PROJECT_DIR"
mkdir -p "$PROJECT_DIR/server"
cd "$PROJECT_DIR"

# Server setup
cd server
cat > package.json << EOF
{
  "name": "${SERVICE_NAME}-mcp-server",
  "version": "1.0.0",
  "type": "module", 
  "main": "index.js",
  "dependencies": {
    "${PACKAGE_NAME}": "latest"
  }
}
EOF

npm install

# Universal wrapper - auto-detects server paths
cat > index.js << 'EOF'
#!/usr/bin/env node
import { spawn } from 'child_process';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Try common server paths
const possiblePaths = [
  'dist/index.js', 'build/index.js', 'lib/index.js', 
  'src/index.js', 'index.js', 'server.js'
];

// Get package name from package.json
const pkg = JSON.parse(require('fs').readFileSync(join(__dirname, 'package.json')));
const packageName = Object.keys(pkg.dependencies)[0];

let serverPath;
for (const path of possiblePaths) {
  const fullPath = join(__dirname, 'node_modules', packageName, path);
  try { 
    require.resolve(fullPath);
    serverPath = fullPath;
    break;
  } catch {}
}

if (!serverPath) {
  console.error('❌ Could not find server entry point');
  console.error('Tried paths:', possiblePaths.map(p => `node_modules/${packageName}/${p}`));
  process.exit(1);
}

const child = spawn('node', [serverPath], {
  stdio: 'inherit', cwd: __dirname
});

child.on('error', (error) => {
  console.error('Failed to start server:', error);
  process.exit(1);
});

child.on('exit', (code) => process.exit(code));
EOF

chmod +x index.js
cd ..

# DTX manifest
cat > manifest.json << EOF
{
  "dxt_version": "0.1",
  "name": "${SERVICE_NAME}-mcp",
  "display_name": "${DISPLAY_NAME}",
  "version": "1.0.0",
  "description": "${DESCRIPTION}",
  "server": {
    "type": "node",
    "entry_point": "server/index.js",
    "mcp_config": {
      "command": "node",
      "args": ["\${__dirname}/server/index.js"],
      "env": {
        "${API_KEY_NAME}": "\${user_config.api_key}"
      }
    }
  },
  "keywords": ["mcp", "${SERVICE_NAME}", "claude-desktop"],
  "license": "MIT",
  "compatibility": {
    "claude_desktop": ">=0.11.0",
    "platforms": ["darwin", "win32", "linux"],
    "runtimes": {"node": ">=18.0.0"}
  },
  "user_config": {
    "api_key": {
      "type": "string",
      "title": "API Key",
      "description": "Your ${SERVICE_NAME} API key",
      "default": "${DEFAULT_API_KEY}",
      "required": true,
      "sensitive": true
    }
  }
}
EOF

# Package & finish
echo "📦 Packaging DTX..."
dxt pack
mkdir -p "$WORKSPACE/packages"

if [ -f "${SERVICE_NAME}-mcp.dxt" ]; then
    mv "${SERVICE_NAME}-mcp.dxt" "$WORKSPACE/packages/${SERVICE_NAME}-mcp.dxt"
    echo "✅ ${SERVICE_NAME}-mcp.dxt created!"
    echo "📂 Location: $WORKSPACE/packages/${SERVICE_NAME}-mcp.dxt"
    echo "🚀 Drag to Claude Desktop → Extensions → Install"
else
    echo "❌ Build failed - check npm install output above"
fi