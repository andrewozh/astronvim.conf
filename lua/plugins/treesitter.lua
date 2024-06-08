if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "regex",
      "awk",
      "python",
      "javascript",
      "go",
      "yaml",
      "json",
      "terraform",
      "dockerfile",
      "hcl",
      "lua",
      "vim",
      "markdown"
    },
  },
}
