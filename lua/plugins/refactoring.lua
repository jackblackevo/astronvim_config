return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  config = function() require("refactoring").setup() end,
  keys = {
    -- Extract function supports only visual mode
    {
      "<leader>re",
      function() require("refactoring").refactor "Extract Function" end,
      mode = { "x" },
      desc = "Refactoring - Extract Function",
    },
    {
      "<leader>rf",
      function() require("refactoring").refactor "Extract Function To File" end,
      mode = { "x" },
      desc = "Refactoring - Extract Function To File",
    },

    -- Extract variable supports only visual mode
    {
      "<leader>rv",
      function() require("refactoring").refactor "Extract Variable" end,
      mode = { "x" },
      desc = "Refactoring - Extract Variable",
    },

    -- Inline var supports both normal and visual mode
    {
      "<leader>ri",
      function() require("refactoring").refactor "Inline Variable" end,
      mode = { "n", "x" },
      desc = "Refactoring - Inline Variable",
    },

    -- Inline func supports only normal
    {
      "<leader>rI",
      mode = { "n" },
      function() require("refactoring").refactor "Inline Function" end,
      desc = "Refactoring - Inline Function",
    },

    -- Extract block supports only normal mode
    {
      "<leader>rbb",
      function() require("refactoring").refactor "Extract Block" end,
      mode = { "n" },
      desc = "Refactoring - Extract Block",
    },
    {
      "<leader>rbf",
      function() require("refactoring").refactor "Extract Block To File" end,
      mode = { "n" },
      desc = "Refactoring - Extract Block To File",
    },

    -- prompt for a refactor to apply when the remap is triggered
    -- Note that not all refactor support both normal and visual mode
    {
      "<leader>rr",
      function() require("refactoring").select_refactor() end,
      mode = { "n", "x" },
      desc = "Refactoring - Select Refactor",
    },

    -- You can also use below = true here to to change the position of the printf
    -- statement (or set two remaps for either one). This remap must be made in normal mode.
    {
      "<leader>rpp",
      function() require("refactoring").debug.printf { below = false } end,
      mode = { "n" },
      desc = "Debug - Printf",
    },

    -- Print var
    -- Supports both visual and normal mode
    {
      "<leader>rpv",
      function() require("refactoring").debug.print_var() end,
      mode = { "x", "n" },
      desc = "Debug - Print Var",
    },

    -- Supports only normal mode
    {
      "<leader>rc",
      function() require("refactoring").debug.cleanup {} end,
      mode = { "n" },
      desc = "Debug - Cleanup",
    },
  },
}
