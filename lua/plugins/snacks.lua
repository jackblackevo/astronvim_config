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
  specs = {
    -- override neo-tree.nvim plugin
    -- https://github.com/AstroNvim/AstroNvim/blob/0079d7bcce221bbed3ecd32833f4e79c0a1979fe/lua/astronvim/plugins/snacks.lua#L209-L222
    {
      "nvim-neo-tree/neo-tree.nvim",
      optional = true,
      opts = {
        commands = {
          -- https://github.com/AstroNvim/AstroNvim/blob/0079d7bcce221bbed3ecd32833f4e79c0a1979fe/lua/astronvim/plugins/snacks.lua#L214-L218
          find_files_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node.type == "file" and node:get_parent_id() or node:get_id()
            require("snacks").picker.files { cwd = path }
          end,
          -- https://github.com/AstroNvim/AstroNvim/blob/0079d7bcce221bbed3ecd32833f4e79c0a1979fe/lua/astronvim/plugins/snacks.lua#L169-L172
          find_all_files_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node.type == "file" and node:get_parent_id() or node:get_id()
            require("snacks").picker.files { cwd = path, hidden = true, ignored = true }
          end,
          -- https://github.com/AstroNvim/AstroNvim/blob/0079d7bcce221bbed3ecd32833f4e79c0a1979fe/lua/astronvim/plugins/snacks.lua#L186
          find_words_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node.type == "file" and node:get_parent_id() or node:get_id()
            require("snacks").picker.grep { cwd = path }
          end,
          -- https://github.com/AstroNvim/AstroNvim/blob/0079d7bcce221bbed3ecd32833f4e79c0a1979fe/lua/astronvim/plugins/snacks.lua#L187-L190
          find_all_words_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node.type == "file" and node:get_parent_id() or node:get_id()
            require("snacks").picker.grep { cwd = path, hidden = true, ignored = true }
          end,
        },
        window = {
          mappings = {
            ff = "find_files_in_dir",
            fF = "find_all_files_in_dir",
            fw = vim.fn.executable "rg" == 1 and "find_words_in_dir" or nil,
            fW = vim.fn.executable "rg" == 1 and "find_all_words_in_dir" or nil,
          },
        },
      },
    },
  },
}
