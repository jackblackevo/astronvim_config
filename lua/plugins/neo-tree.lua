-- https://docs.astronvim.com/configuration/customizing_plugins/#configure-astronvim-plugins
-- override neo-tree.nvim plugin

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    local astro = require "astrocore"

    -- https://github.com/AstroNvim/AstroNvim/blob/b505f4ff41f851fa4a008586995f79408daf72bc/lua/astronvim/plugins/neo-tree.lua#L199-L206
    if astro.is_available "telescope.nvim" then
      -- https://github.com/AstroNvim/AstroNvim/blob/b505f4ff41f851fa4a008586995f79408daf72bc/lua/astronvim/plugins/telescope.lua#L54
      opts.commands.find_files_in_dir = function(state)
        local node = state.tree:get_node()
        local path = node.type == "file" and node:get_parent_id() or node:get_id()
        require("telescope.builtin").find_files { cwd = path }
      end
      opts.window.mappings.ff = "find_files_in_dir"

      -- https://github.com/AstroNvim/AstroNvim/blob/b505f4ff41f851fa4a008586995f79408daf72bc/lua/astronvim/plugins/telescope.lua#L55-L58
      opts.commands.find_all_files_in_dir = function(state)
        local node = state.tree:get_node()
        local path = node.type == "file" and node:get_parent_id() or node:get_id()
        require("telescope.builtin").find_files { cwd = path, hidden = true, no_ignore = true }
      end
      opts.window.mappings.fF = "find_all_files_in_dir"

      -- https://github.com/AstroNvim/AstroNvim/blob/b505f4ff41f851fa4a008586995f79408daf72bc/lua/astronvim/plugins/telescope.lua#L70
      opts.commands.find_words_in_dir = function(state)
        local node = state.tree:get_node()
        local path = node.type == "file" and node:get_parent_id() or node:get_id()
        require("telescope.builtin").live_grep { cwd = path }
      end
      opts.window.mappings.fw = "find_words_in_dir"

      -- https://github.com/AstroNvim/AstroNvim/blob/b505f4ff41f851fa4a008586995f79408daf72bc/lua/astronvim/plugins/telescope.lua#L71-L78
      opts.commands.find_all_words_in_dir = function(state)
        local node = state.tree:get_node()
        local path = node.type == "file" and node:get_parent_id() or node:get_id()
        require("telescope.builtin").live_grep {
          cwd = path,
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
      end
      opts.window.mappings.fW = "find_all_words_in_dir"
    end
  end,
}
