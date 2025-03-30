-- https://docs.astronvim.com/configuration/customizing_plugins/#configure-astronvim-plugins
-- override snacks.nvim plugin

---@type LazySpec
return {
  "folke/snacks.nvim",
  -- https://github.com/HiPhish/rainbow-delimiters.nvim/blob/de39919a57e1a40a4c7dc5bae0de276f9c616ef3/plugin/rainbow-delimiters.lua#L29-L35
  dependencies = { "HiPhish/rainbow-delimiters.nvim" },
  opts = {
    -- https://github.com/folke/snacks.nvim/blob/main/docs/indent.md#%EF%B8%8F-config
    indent = {
      scope = {
        -- https://github.com/lukas-reineke/indent-blankline.nvim#rainbow-delimitersnvim-integration
        -- https://github.com/AstroNvim/astrocommunity/blob/64331a3294aef0993d5bac69e28cc851b7a916e9/lua/astrocommunity/pack/rainbow-delimiter-indent-blankline/init.lua#L11-L20
        hl = vim.tbl_get(vim.g, "rainbow_delimiters", "highlight") or {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      },
    },
  },
}
