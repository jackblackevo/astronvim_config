-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/lsp/lsp-signature-nvim/init.lua

---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "ray-x/lsp_signature.nvim",
    opts = {},
  },
}
