return {
  {
    "ellisonleao/gruvbox.nvim",
    as = "gruvbox",
    config = function()
      require("gruvbox").setup({
          undercurl = true,
          underline = true,
          bold = true,
          italic = true,
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
