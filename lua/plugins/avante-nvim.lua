-- override avante.nvim plugin

---@type LazySpec
return {
  "yetone/avante.nvim",
  opts = function(_, opts) opts.provider = "openai" end,
}
