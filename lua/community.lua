-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
-- return {
--   "AstroNvim/astrocommunity",
--   { import = "astrocommunity.pack.lua" },
--   -- import/override with your plugins folder
-- }

return {
  {
    "ellisonleao/gruvbox.nvim",
    as = "gruvbox",
    config = function()
      require("gruvbox").setup({
          undercurl = true,
          underline = true,
          bold = true,
          italic = {},
          strikethrough = true,
          invert_selection = false,
          invert_signs = false,
          invert_tabline = true,
          invert_intend_guides = false,
          inverse = false, -- invert background for search, diffs, statuslines and errors
          contrast = "soft", -- can be "hard", "soft" or empty string
          palette_overrides = {},
          overrides = {},
          dim_inactive = false,
          transparent_mode = false,
      })
    end,
  },
}
