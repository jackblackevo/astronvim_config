-- https://docs.astronvim.com/recipes/cmp/#add-nvim-cmp-sources
-- https://github.com/Saghen/blink.compat

---@type LazySpec
return {
  "Saghen/blink.cmp",
  optional = true,
  dependencies = {
    -- add the legacy cmp source as a dependency for `blink.cmp`
    { "tzachar/cmp-tabnine", build = "./install.sh" },
  },
  specs = {
    -- install the blink, nvim-cmp compatibility layer
    { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      -- enable the provider by default
      default = { "tabnine" },
      -- configure the provider for your new source
      providers = {
        tabnine = {
          name = "Tabnine",
          module = "blink.compat.source",
          -- https://cmp.saghen.dev/recipes#set-source-kind-icon-and-name
          transform_items = function(_, items)
            for _, item in ipairs(items) do
              item.kind_icon = ""
              item.kind_name = "AI"
            end
            return items
          end,
          score_offset = -1,
          opts = {
            cmp_name = "cmp_tabnine",
          },
        },
      },
    },
    -- https://cmp.saghen.dev/recipes.html#fuzzy-sorting-filtering
    fuzzy = {
      sorts = {
        -- https://github.com/Saghen/blink.cmp/issues/1098#issuecomment-2679295335
        function(a, b)
          local source_priority = {
            tabnine = 5,
            lsp = 4,
            snippets = 3,
            buffer = 2,
            path = 1,
          }

          local a_priority = source_priority[a.source_id]
          local b_priority = source_priority[b.source_id]
          if a_priority ~= nil and b_priority ~= nil and a_priority ~= b_priority then
            return a_priority > b_priority
          end
        end,
        -- default sorts
        "score",
        "sort_text",
      },
    },
  },
}
