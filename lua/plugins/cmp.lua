-- https://docs.astronvim.com/recipes/cmp/
-- override nvim-cmp plugin

---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- https://github.com/onsails/lspkind.nvim
    { "onsails/lspkind.nvim" },
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

    -- https://github.com/tzachar/cmp-tabnine#pretty-printing-menu-items
    local lspkind = require "lspkind"

    local source_mapping = {
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[Lua]",
      cmp_tabnine = "[TN]",
      path = "[Path]",
    }

    opts.formatting = {
      format = function(entry, vim_item)
        -- if you have lspkind installed, you can use it like
        -- in the following line:
        vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
        vim_item.menu = source_mapping[entry.source.name]
        if entry.source.name == "cmp_tabnine" then
          local detail = (entry.completion_item.labelDetails or {}).detail
          vim_item.kind = ""
          if detail and detail:find ".*%%.*" then vim_item.kind = vim_item.kind .. " " .. detail end

          if (entry.completion_item.data or {}).multiline then vim_item.kind = vim_item.kind .. " " .. "[ML]" end
        end
        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        return vim_item
      end,
    }
  end,
}
