-- https://docs.astronvim.com/configuration/customizing_plugins/#configure-astronvim-plugins
-- override blink.nvim plugin

---@type LazySpec
return {
  "Saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        -- https://docs.astronvim.com/configuration/v5_migration/#plugin-changes
        -- https://cmp.saghen.dev/configuration/completion.html#menu-draw
        draw = {
          columns = {
            -- rearrange these as necessary to match desired look
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
            { "source_name" },
          },
        },
      },
    },
  },
}
