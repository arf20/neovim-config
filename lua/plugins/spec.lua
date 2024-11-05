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
    "neoclide/coc.nvim"
  }
}

