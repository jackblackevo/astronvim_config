-- override avante.nvim plugin

---@type LazySpec
return {
  "yetone/avante.nvim",
  opts = function(_, opts)
    opts.provider = "openai"
    -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    opts.system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end
    -- Using function prevents requiring mcphub before it's loaded
    opts.custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end
  end,
}
