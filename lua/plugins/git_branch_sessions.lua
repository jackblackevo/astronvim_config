-- https://docs.astronvim.com/recipes/sessions/#git-branch-specific-directory-sessions
-- function for calculating the current session name
local get_session_name = function()
  local name = vim.fn.getcwd()
  local branch = vim.fn.system "git branch --show-current"
  if vim.v.shell_error == 0 then
    return name .. vim.trim(branch --[[@as string]])
  else
    return name
  end
end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    sessions = {
      -- disable the auto-saving of directory sessions
      autosave = { cwd = false },
    },
    mappings = {
      n = {
        -- update save dirsession mapping to get the correct session name
        ["<Leader>SS"] = {
          function() require("resession").save(get_session_name(), { dir = "dirsession" }) end,
          desc = "Save this dirsession",
        },
        -- update load dirsession mapping to get the correct session name
        ["<Leader>S."] = {
          function() require("resession").load(get_session_name(), { dir = "dirsession" }) end,
          desc = "Load current dirsession",
        },
      },
    },
    autocmds = {
      -- disable alpha autostart
      alpha_autostart = false,
      git_branch_sessions = {
        -- auto save directory sessions on leaving
        {
          event = "VimLeavePre",
          desc = "Save git branch directory sessions on close",
          callback = vim.schedule_wrap(function()
            if require("astrocore.buffer").is_valid_session() then
              require("resession").save(get_session_name(), { dir = "dirsession", notify = false })
            end
          end),
        },
        -- auto restore previous previous directory session, remove if necessary
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            -- Only load the session if nvim was started with no args
            if vim.fn.argc(-1) == 0 then
              -- try to load a directory session using the current working directory
              -- https://github.com/stevearc/resession.nvim/blob/4463a78e1783c99466d5f5fb79516d06a5d6f3f8/lua/resession/init.lua#L485-L490
              xpcall(require("resession").load, function()
                -- https://github.com/AstroNvim/AstroNvim/blob/e2edcc7e197d577912d29305f67d7c995ae47353/lua/astronvim/plugins/alpha.lua#L68-L70
                require("lazy").load { plugins = { "alpha-nvim" } }
                require("alpha").start(true)
                vim.schedule(function() vim.cmd.doautocmd "FileType" end)
              end, get_session_name(), { dir = "dirsession" })
            end
          end,
        },
      },
    },
  },
}
