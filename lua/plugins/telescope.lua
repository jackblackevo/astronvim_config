-- https://docs.astronvim.com/configuration/customizing_plugins/#configure-astronvim-plugins
-- override telescope.nvim plugin

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#file-and-text-search-in-hidden-files-and-directories
    local telescopeConfig = require "telescope.config"

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    -- `hidden = true` is not supported in text grep commands.
    opts.defaults.vimgrep_arguments = vimgrep_arguments
    -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
    opts.pickers = {
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
    }
  end,
}
