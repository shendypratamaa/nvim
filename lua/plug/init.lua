return {
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    keys = {
      { "]gd", "<cmd>Gvdiffsplit!<cr>", desc = "Open Fugitive Git" },
      { "]ga", "<cmd>Git<cr>",          desc = "Open Fugitive Git" },
      { "]gq", "<cmd>diffget //2<cr>",  desc = "Diff Get //2" },
      { "]gp", "<cmd>diffget //3<cr>",  desc = "Diff Get //3" },
      { "]gb", "<cmd>Flogsplit<cr>",    desc = "Preview Branch" }
    }
  },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- motion
  { 'tpope/vim-surround' },

  -- icons
  { "nvim-tree/nvim-web-devicons" },

  -- indent
  { 'lukas-reineke/indent-blankline.nvim' },

  -- file explorer
  { "nvim-tree/nvim-tree.lua" },

  -- status line
  { 'nvim-lualine/lualine.nvim' },

  -- peek number
  { 'nacro90/numb.nvim' },

  -- undo tree
  { "mbbill/undotree" },

  -- tmux (navigate seamless between neovim)
  { "christoomey/vim-tmux-navigator" },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',               opts = {} },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  { 'lewis6991/gitsigns.nvim' },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' },
      { 'williamboman/mason.nvim',          config = true },
      { 'j-hui/fidget.nvim',                tag = 'legacy', opts = {} },
      { 'folke/neodev.nvim' }
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context'
    },
    build = ':TSUpdate',
  },

  -- web dev utils
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufRead",
    opts = {
      user_default_options = {
        tailwind = true
      }
    }
  },

  -- import cost
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh yarn",
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact", "tsx", "jsx" },
    config = function()
      require("import-cost").setup({})
    end,
  }
}
