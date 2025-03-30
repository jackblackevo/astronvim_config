-- https://docs.astronvim.com/configuration/customizing_plugins/#configure-astronvim-plugins
-- override lsp_signature.nvim plugin

---@type LazySpec
return {
  "ray-x/lsp_signature.nvim",
  opts = {
    -- https://github.com/AstroNvim/astrocommunity/blob/64331a3294aef0993d5bac69e28cc851b7a916e9/lua/astrocommunity/lsp/lsp-signature-nvim/init.lua#L7
    hint_enable = true,
  },
}
