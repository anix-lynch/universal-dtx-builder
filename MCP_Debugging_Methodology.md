# 🎓 MCP Debugging Methodology 

**Learn the systematic approach to diagnose and fix any MCP server issues**

*Based on successful real-world troubleshooting session*

---

## 🧠 **The VERIFY Method**

### **V** - Visualize the Problem
- Check Claude Desktop settings for warning triangles ⚠️
- Note exact error messages ("Server disconnected", "Failed", etc.)
- Identify which specific services are failing

### **E** - Examine Package Status  
```bash
npm view PACKAGE_NAME
```
Look for:
- ❌ "DEPRECATED" warnings
- ❌ "404 Not Found" errors  
- ✅ Recent publication dates
- ✅ Active maintainers

### **R** - Research Alternatives
```bash
npm search "service-name mcp"
npm search "functionality-type mcp"
```
Filter by:
- Recent updates (last 3 months)
- Good descriptions
- Multiple versions (shows maintenance)

### **I** - Install & Test Individually
```bash
# Test package before adding to config
npx PACKAGE_NAME --help
npx PACKAGE_NAME --version
```

### **F** - Fix Configuration
- Update package names in config
- Add required environment variables
- Remove conflicting DTX extensions

### **Y** - Verify Success
- Restart Claude Desktop
- Check for warning triangles
- Test actual functionality

---

## 🔍 **Common Diagnostic Patterns**

### Pattern 1: **Deprecated Official Packages**
```
Problem: @modelcontextprotocol/server-* packages failing
Cause: Many official packages deprecated/unsupported  
Solution: Find community alternatives with recent updates
```

### Pattern 2: **DTX + MCP Conflicts**
```
Problem: Same service appears twice, one failing
Cause: Both DTX extension and MCP config running
Solution: Remove DTX extension, keep MCP config only
```

### Pattern 3: **Authentication Issues**
```
Problem: Valid API keys not working
Cause: Wrong environment variable names
Solution: Check package docs for correct env var names
```

### Pattern 4: **Package Not Found**
```
Problem: npm 404 errors
Cause: Package name changed or doesn't exist
Solution: Search for correct package name
```

---

## 🛠️ **Debugging Commands Reference**

### **Package Verification:**
```bash
# Check if package exists and status
npm view PACKAGE_NAME

# Search for alternatives
npm search "keyword mcp"

# Test package functionality  
npx PACKAGE_NAME --help
```

### **Configuration Testing:**
```bash
# Validate JSON syntax
cat "claude_desktop_config.json" | jq .

# Check specific package installation
npx PACKAGE_NAME --version
```

### **API Testing:**
```bash
# Test GitHub token
curl -H "Authorization: token TOKEN" https://api.github.com/user

# Test any REST API
curl -H "Authorization: Bearer TOKEN" API_ENDPOINT
```

---

## 📊 **Success Metrics**

### **Before Fix:**
- ⚠️ Warning triangles in settings
- ❌ "Server disconnected" errors
- 🚫 No functionality from MCP services

### **After Fix:**
- ✅ Clean settings (no warning triangles)
- ✅ All services responding
- ✅ Full functionality available

---

## 🎯 **Troubleshooting Decision Tree**

```
MCP Service Not Working?
├── Warning Triangle Visible?
│   ├── Yes → Check package existence (npm view)
│   │   ├── 404 Error → Find alternative package
│   │   ├── DEPRECATED → Find alternative package  
│   │   └── Valid → Check config syntax
│   └── No → Check for duplicate services
│       ├── DTX + MCP Conflict → Remove DTX extension
│       └── Multiple configs → Remove duplicates
├── Authentication Errors?
│   ├── API Key → Test with curl/direct API call
│   ├── Wrong env var → Check package documentation
│   └── Permissions → Verify token scopes
└── Package Installs but No Tools?
    ├── Check package documentation
    ├── Verify environment variables
    └── Test package directly with npx
```

---

## 💡 **Pro Tips from Real Debugging**

### 1. **Package Name Gotchas**
- `@modelcontextprotocol/server-desktop-commander` ❌ (doesn't exist)
- `@wonderwhy-er/desktop-commander` ✅ (correct)

### 2. **Conflict Detection**
- If you see same service twice in settings → conflict
- DTX extensions + MCP configs often conflict
- Always choose one approach per service

### 3. **Quick Package Health Check**
```bash
# Good signs:
npm view PACKAGE_NAME | grep "published.*ago"
# Recent: "published 2 days ago" ✅
# Old: "published 6 months ago" ⚠️
# Very old: "published 2 years ago" ❌
```

### 4. **Testing Hierarchy**
1. Test package exists: `npm view PACKAGE_NAME`
2. Test package installs: `npx PACKAGE_NAME --version`  
3. Test in isolated config with just that package
4. Add to full config only after individual testing

---

## 🚀 **Quick Recovery Template**

Save this as your emergency MCP config:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-filesystem", "/Users/YOUR_USER"]
    },
    "memory": {
      "command": "npx", 
      "args": ["@modelcontextprotocol/server-memory"]
    }
  }
}
```

*Minimal config that usually works - build from here*

---

## 📚 **Lesson Learned: Real Case Study**

### **Initial Problem:**
- Desktop Commander completely broken
- GitHub MCP not working
- Multiple warning triangles

### **Root Causes Found:**
1. Wrong package name for Desktop Commander
2. Deprecated GitHub MCP package
3. DTX + MCP config conflict

### **Systematic Resolution:**
1. ✅ Verified each package with `npm view`
2. ✅ Found working alternatives  
3. ✅ Removed conflicts
4. ✅ Tested individually
5. ✅ Clean configuration achieved

### **Result:**
- 100% working MCP setup
- All services functional
- Zero warning triangles
- Full terminal + GitHub access

---

**This methodology works for ANY MCP service issues!**

*Apply the VERIFY method systematically and you'll resolve 95%+ of MCP problems.*
