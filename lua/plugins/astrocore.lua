if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },
        ["<leader>b"] = { name = "Buffers" },
        ["<leader>fs"] = { "<cmd>SessionManager load_session<cr>", desc = "Search Sessions" },

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

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
