return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require("astronvim.utils.status")
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
        status.component.git_branch(),
        status.component.file_info {
          -- we only want filename to be used and we can change the fname
          -- function to get the current working directory name
          filename = { fname = function(nr) return vim.fn.getcwd(nr) end --[[ , padding = { left = 1, right = 1 } ]] },
          -- disable all other elements of the file_info component
          file_icon = false,
          file_modified = false,
          file_read_only = false,
          -- use no separator for this part but define a background color
          -- surround = { separator = "none", color = "file_info_bg", condition = false },
        },
        status.component.file_info { filetype = {}, filename = false, file_modified = false },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        -- status.component.macro_recording(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        -- remove the 2nd mode indicator on the right
      }

      -- return the final configuration table
      return opts
    end,
  },
}
