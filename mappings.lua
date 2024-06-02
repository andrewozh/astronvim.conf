-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>fs"] = { "<cmd>SessionManager load_session<cr>", desc = "Search Sessions" },
    ["<leader>tk"] = { function() utils.toggle_term_cmd "k9s" end, desc = "ToggleTerm k9s" },
    ["<leader>tg"] = { "<cmd>ChatGPT<cr>", desc = "Toggle ChatGPT" },
    -- zettelkasten 
    ["<leader>z"] = { name = "Zettelkasten" },
    ["<leader>zN"] = { function() vim.cmd('!zknew ' .. vim.fn.input('Name: ')) end, desc = "New note" },

    ["<leader>za"] = { "<cmd>:Telescope find_files find_command=zkrg,area,-,-<cr>", desc = "Areas" },
    ["<leader>zn"] = { "<cmd>:Telescope find_files find_command=zkrg,note,-,-<cr>", desc = "Notes" },
    ["<leader>zr"] = { "<cmd>:Telescope find_files find_command=zkrg,-,resource,-<cr>", desc = "Resources" },
    ["<leader>zP"] = { "<cmd>:Telescope find_files find_command=zkrg,project,-,-<cr>", desc = "Projects" },
    ["<leader>zT"] = { "<cmd>:Telescope find_files find_command=zkrg,task,-,-<cr>", desc = "Tasks" },
    ["<leader>zp"] = { "<cmd>:Telescope find_files find_command=zkrg,project,progress,-<cr>", desc = "Projects in progress" },
    ["<leader>zt"] = { "<cmd>:Telescope find_files find_command=zkrg,task,progress,-<cr>", desc = "Tasks in progress" },
    ["<leader>zc"] = { function() vim.cmd(':execute "Telescope find_files find_command=zkrg,-,-,".expand("%:t")') end, desc = "Ref" },

    ["<leader>zi"] = { name = "Intento" },
    ["<leader>zin"] = { "<cmd>:Telescope find_files find_command=zkrg,note,-,intento<cr>", desc = "Notes" },
    ["<leader>ziT"] = { "<cmd>:Telescope find_files find_command=zkrg,task,-,intento-kanban.md<cr>", desc = "Tasks" },
    ["<leader>zit"] = { "<cmd>:Telescope find_files find_command=zkrg,task,progress,intento-kanban.md<cr>", desc = "Tasks in progress" },
    ["<leader>zib"] = { "<cmd>:Telescope find_files find_command=zkrg,task,backlog,intento-kanban.md<cr>", desc = "Tasks backlog" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
