-- override mcphub.nvim plugin

---@type LazySpec
return {
  "ravitemer/mcphub.nvim",
  build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
}
