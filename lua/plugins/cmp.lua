-- https://docs.astronvim.com/recipes/cmp/
-- override nvim-cmp plugin
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- add cmp source as dependency of cmp
    { "tzachar/cmp-tabnine", build = "./install.sh" },
  },
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    -- modify the sources part of the options table
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
      -- add new source
      { name = "cmp_tabnine", priority = 1500 },
    }

    -- https://github.com/tzachar/cmp-tabnine#sorting
    opts.sorting = {
      priority_weight = 2,
      comparators = {
        require "cmp_tabnine.compare",
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    }
  end,
}
