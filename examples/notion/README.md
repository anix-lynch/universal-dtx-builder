# 📝 Notion MCP DTX Example

**Template for building Notion DTX extension**

## 🎯 Configuration

```bash
PACKAGE_NAME="@notion/mcp-server"
SERVICE_NAME="notion"
DISPLAY_NAME="Notion MCP"
API_KEY_NAME="NOTION_API_KEY"
DESCRIPTION="Complete Notion workspace management"
```

## 🚀 Build Instructions

1. **Get Notion API Key:**
   - Go to https://www.notion.so/my-integrations
   - Create new integration
   - Copy the API key

2. **Edit Universal Generator:**
   ```bash
   # Use the configuration above in instant_dtx_generator.sh
   ./instant_dtx_generator.sh
   ```

3. **Install:**
   - Drag `notion-mcp.dxt` to Claude Desktop
   - Enter your Notion API key
   - Enable the extension

## 📋 Features

✅ **Database Operations** - Query and update Notion databases  
✅ **Page Management** - Create, read, and modify pages  
✅ **Block Operations** - Work with Notion blocks and content  
✅ **Search** - Find content across your Notion workspace  

## 🎯 Use Cases

- **Knowledge Management** - Organize notes and documentation
- **Project Planning** - Track tasks and milestones
- **Content Creation** - Draft and organize written content
- **Team Collaboration** - Manage shared workspaces

*Note: Actual Notion MCP server package name may vary. Check npm for current packages.*