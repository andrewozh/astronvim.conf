return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
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
        "markdown",
        "help"
    })
  end,
}
