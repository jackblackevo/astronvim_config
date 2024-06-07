-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  -- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack/typescript-all-in-one
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.git.gitlinker-nvim" },
}
