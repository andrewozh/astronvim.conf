return {
  {
    'numToStr/Comment.nvim',
    lazy = false,
    opts = function()
      local ft = require('Comment.ft')
      ft.set('hcl', '#%s')
      return { pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() }
    end,
  }
}
