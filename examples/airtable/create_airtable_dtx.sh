#!/bin/bash

# Airtable MCP DTX Builder - Working Example
echo "🗂️ Creating Airtable MCP DTX extension..."

# Configuration
WORKSPACE="$(pwd)/DTX_Workspace"
AIRTABLE_DIR="$WORKSPACE/airtable-mcp"

# Clean start
rm -rf "$AIRTABLE_DIR"
mkdir -p "$AIRTABLE_DIR/server"
cd "$AIRTABLE_DIR"

echo "📦 Installing Airtable MCP server..."
cd server

# Package configuration
cat > package.json << 'EOF'
{
  "name": "airtable-mcp-server",
  "version": "1.0.0",
  "type": "module",
  "main": "index.js",
  "dependencies": {
    "@felores/airtable-mcp-server": "latest"
  }
}
EOF

# Install dependencies (CRITICAL for DTX success)
npm install

# Universal wrapper - auto-detects server location
cat > index.js << 'EOF'
#!/usr/bin/env node

import { spawn } from 'child_process';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Auto-detect Airtable server path
const airtableServerPath = join(__dirname, 'node_modules', '@felores', 'airtable-mcp-server', 'dist', 'index.js');

// Launch server
const child = spawn('node', [airtableServerPath], {
  stdio: 'inherit',
  cwd: __dirname
});

child.on('error', (error) => {
  console.error('Failed to start Airtable server:', error);
  process.exit(1);
});

child.on('exit', (code) => {
  process.exit(code);
});
EOF

chmod +x index.js
cd ..

# DTX manifest with complete tool documentation
cat > manifest.json << 'EOF'
{
  "dxt_version": "0.1",
  "name": "airtable-mcp",
  "display_name": "Airtable MCP",
  "version": "1.0.0",
  "description": "Complete Airtable database management for Claude Desktop",
  "long_description": "Professional Airtable MCP server enabling full database operations. Create, read, update, and delete bases, tables, fields, and records through natural conversation. Perfect for job hunt automation, CRM, project management, and data organization.",
  "author": {
    "name": "felores",
    "url": "https://github.com/felores/airtable-mcp"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/felores/airtable-mcp"
  },
  "server": {
    "type": "node",
    "entry_point": "server/index.js",
    "mcp_config": {
      "command": "node",
      "args": ["${__dirname}/server/index.js"],
      "env": {
        "AIRTABLE_API_KEY": "${user_config.airtable_api_key}"
      }
    }
  },
  "tools": [
    {
      "name": "list_bases",
      "description": "List all accessible Airtable bases with permissions"
    },
    {
      "name": "list_tables",
      "description": "List all tables in a specific base with metadata"
    },
    {
      "name": "describe_table",
      "description": "Get detailed table schema including all fields and types"
    },
    {
      "name": "list_records",
      "description": "Retrieve records with filtering, sorting, and pagination"
    },
    {
      "name": "search_records",
      "description": "Search for records containing specific text across fields"
    },
    {
      "name": "get_record",
      "description": "Get a specific record by its unique ID"
    },
    {
      "name": "create_record",
      "description": "Create a new record with field values"
    },
    {
      "name": "update_records",
      "description": "Update multiple records with new field values"
    },
    {
      "name": "delete_records",
      "description": "Delete one or more records by their IDs"
    },
    {
      "name": "create_table",
      "description": "Create a new table with custom fields in a base"
    },
    {
      "name": "update_table",
      "description": "Update table name, description, or properties"
    },
    {
      "name": "create_field",
      "description": "Add a new field to an existing table"
    },
    {
      "name": "update_field",
      "description": "Modify field name, description, or configuration"
    }
  ],
  "keywords": ["airtable", "database", "records", "tables", "automation", "crm", "job-hunt"],
  "license": "MIT",
  "compatibility": {
    "claude_desktop": ">=0.11.0",
    "platforms": ["darwin", "win32", "linux"],
    "runtimes": {
      "node": ">=18.0.0"
    }
  },
  "user_config": {
    "airtable_api_key": {
      "type": "string",
      "title": "Airtable API Key",
      "description": "Your Airtable Personal Access Token (starts with 'pat'). Get it from https://airtable.com/create/tokens",
      "default": "pat...",
      "required": true,
      "sensitive": true
    }
  }
}
EOF

# Package DTX
echo "📦 Packaging Airtable DTX..."
dxt pack

# Organize output
mkdir -p "$WORKSPACE/packages"
if [ -f "airtable-mcp.dxt" ]; then
    mv airtable-mcp.dxt "$WORKSPACE/packages/airtable-mcp.dxt"
    FILE_SIZE=$(ls -lh "$WORKSPACE/packages/airtable-mcp.dxt" | awk '{print $5}')
    echo "✅ airtable-mcp.dxt created successfully!"
    echo "📏 File size: $FILE_SIZE"
    echo "📂 Location: $WORKSPACE/packages/airtable-mcp.dxt"
else
    echo "❌ Failed to create DTX package"
    exit 1
fi

echo ""
echo "🎉 Airtable MCP DTX ready for installation!"
echo ""
echo "🚀 Features:"
echo "• Complete base and table management"
echo "• Full CRUD operations on records"
echo "• Advanced search and filtering"
echo "• Field and schema management"
echo "• Bulk operations support"
echo ""
echo "🎯 Perfect for:"
echo "• Job application tracking"
echo "• Contact and CRM management"
echo "• Project and task organization"
echo "• Content and inventory management"
echo ""
echo "📋 Installation:"
echo "1. Add your Airtable API key to the DTX config"
echo "2. Drag airtable-mcp.dxt to Claude Desktop → Extensions"
echo "3. Click Install → Enable"
echo "4. Test: 'Show me all my Airtable bases'"
echo ""
echo "⚡ Ready to supercharge your Airtable with AI!"