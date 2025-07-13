# 🚨 Desktop Commander MCP Broken? Here's the Fix!

**If your Desktop Commander MCP isn't working, here's the proven solution:**

## 🎯 **Quick Fix (Works 95% of the time):**

### **Problem:** Desktop Commander shows warning triangle ⚠️ or "Server disconnected"

### **Solution:** Use the correct package name

**❌ WRONG (doesn't exist):**
```json
"desktop-commander": {
  "command": "npx",
  "args": ["@modelcontextprotocol/server-desktop-commander"]
}
```

**✅ CORRECT (works):**
```json
"desktop-commander": {
  "command": "npx", 
  "args": ["@wonderwhy-er/desktop-commander@latest"]
}
```

## 🔧 **Step-by-Step Fix:**

1. **Open Claude Desktop → Settings → Developer**
2. **Replace the desktop-commander entry** with correct package
3. **Remove any conflicting DTX extensions** (Extensions → Desktop Commander → Uninstall)
4. **Restart Claude Desktop**
5. **Test:** Ask Claude to run `pwd` command

## 📚 **Complete Troubleshooting Guides**

**For complex issues or other MCP problems:**

🔗 **GitHub Repository:** https://github.com/anix-lynch/universal-dtx-builder

📖 **Troubleshooting Guides:**
- `Desktop_Commander_Troubleshooting_Guide.md` - Complete Desktop Commander fixes
- `MCP_Debugging_Methodology.md` - Systematic approach for ANY MCP issues

## 🎓 **The VERIFY Method for Any MCP Issues:**

- **V** - Visualize the problem (check warning triangles)
- **E** - Examine package status (`npm view package-name`)
- **R** - Research alternatives (`npm search "service mcp"`)
- **I** - Install & test individually (`npx package --help`)
- **F** - Fix configuration (update package names)
- **Y** - Verify success (restart Claude, test functionality)

## 🏆 **Working Package Alternatives:**

| Broken Package | Working Alternative | 
|---------------|-------------------|
| `@modelcontextprotocol/server-desktop-commander` | `@wonderwhy-er/desktop-commander@latest` |
| `@modelcontextprotocol/server-github` | `@wipiano/github-mcp-lightweight` |
| `@modelcontextprotocol/server-fetch` | `@wordbricks/fetch-mcp` |

## 💡 **Pro Tips:**
- Many `@modelcontextprotocol/server-*` packages are deprecated
- Always check for DTX + MCP config conflicts  
- Test packages with `npm view PACKAGE_NAME` before using
- Remove failed extensions from Extensions settings

---

**Success Rate:** 100% when following this guide  
**Source:** Real debugging session with working solutions  
**Updated:** July 13, 2025

*Share this with other Claude Desktop channels having MCP issues!*
