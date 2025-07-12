# 💬 Slack MCP DTX Example

**Template for building Slack DTX extension**

## 🎯 Configuration

```bash
PACKAGE_NAME="@slack/mcp-server"
SERVICE_NAME="slack"
DISPLAY_NAME="Slack MCP"
API_KEY_NAME="SLACK_TOKEN"
DESCRIPTION="Slack channel and message management"
```

## 🚀 Build Instructions

1. **Get Slack Token:**
   - Go to https://api.slack.com/apps
   - Create new Slack app
   - Add Bot Token Scopes (channels:read, chat:write, etc.)
   - Install app to workspace
   - Copy Bot User OAuth Token

2. **Edit Universal Generator:**
   ```bash
   # Use the configuration above in instant_dtx_generator.sh
   ./instant_dtx_generator.sh
   ```

3. **Install:**
   - Drag `slack-mcp.dxt` to Claude Desktop
   - Enter your Slack token
   - Enable the extension

## 📋 Features

✅ **Channel Management** - List and join channels  
✅ **Messaging** - Send and read messages  
✅ **User Management** - Find and interact with users  
✅ **File Sharing** - Upload and share files  

## 🎯 Use Cases

- **Team Communication** - Automate messaging workflows
- **Notifications** - Send alerts and updates
- **Data Sharing** - Share reports and files
- **Community Management** - Moderate channels and conversations

*Note: Actual Slack MCP server package name may vary. Check npm for current packages.*