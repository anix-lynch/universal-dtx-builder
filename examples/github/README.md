# 🚀 GitHub MCP DTX Example

**Template for building GitHub DTX extension**

## 🎯 Configuration

```bash
PACKAGE_NAME="@github/mcp-server"
SERVICE_NAME="github"
DISPLAY_NAME="GitHub MCP"
API_KEY_NAME="GITHUB_TOKEN"
DESCRIPTION="Complete GitHub repository and issue management"
```

## 🚀 Build Instructions

1. **Get GitHub Token:**
   - Go to GitHub Settings → Developer settings → Personal access tokens
   - Generate new token with repo permissions
   - Copy the token

2. **Edit Universal Generator:**
   ```bash
   # Use the configuration above in instant_dtx_generator.sh
   ./instant_dtx_generator.sh
   ```

3. **Install:**
   - Drag `github-mcp.dxt` to Claude Desktop
   - Enter your GitHub token
   - Enable the extension

## 📋 Features

✅ **Repository Management** - Create, clone, and manage repos  
✅ **Issue Tracking** - Create and manage GitHub issues  
✅ **Pull Requests** - Review and merge code changes  
✅ **File Operations** - Read and modify repository files  

## 🎯 Use Cases

- **Code Management** - Organize and track development work
- **Project Planning** - Use issues and milestones for planning
- **Code Review** - Collaborate on pull requests
- **Documentation** - Maintain project documentation

*Note: Actual GitHub MCP server package name may vary. Check npm for current packages.*