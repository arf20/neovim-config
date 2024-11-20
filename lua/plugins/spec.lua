return {
  -- the colorscheme should be available when starting Neovim
  {
    "joshdick/onedark.vim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme onedark]])
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- setup
      require("nvim-tree").setup()
      vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<cr>')
    end,
  },
  {
    "lualine.nvim"
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup{}
    end,
  },
  {
    "wesQ3/vim-windowswap"
  },
  {
    "neovim/nvim-lspconfig"
  },
  {
    "ranjithshegde/ccls.nvim",
    config = function()
      require("ccls").setup({lsp = {use_defaults = true}})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = 'buffer' },
        })
      })
    end,
  },
  {
    "sakhnik/nvim-gdb"
  }
}

