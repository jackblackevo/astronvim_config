---@type LazySpec
return {
  "echasnovski/mini.surround",
  version = false,
  config = function()
    require("mini.surround").setup {
      mappings = {
        add = "<c-s>a", -- Add surrounding in Normal and Visual modes
        delete = "<c-s>d", -- Delete surrounding
        find = "<c-s>f", -- Find surrounding (to the right)
        find_left = "<c-s>F", -- Find surrounding (to the left)
        highlight = "<c-s>h", -- Highlight surrounding
        replace = "<c-s>r", -- Replace surrounding
        update_n_lines = "<c-s>n", -- Update `n_lines`
      },
    }
  end,
}
