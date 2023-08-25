return {
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    keys = {
      { ']gd', '<cmd>Gvdiffsplit!<cr>', desc = 'Open Fugitive Git' },
      { ']ga', '<cmd>Git<cr>', desc = 'Open Fugitive Git' },
      { ']gq', '<cmd>diffget //2<cr>', desc = 'Diff Get //2' },
      { ']gp', '<cmd>diffget //3<cr>', desc = 'Diff Get //3' },
    },
  },

  -- file explorer
  {
    'nvim-tree/nvim-tree.lua',
    keys = {
      { '<leader>fn', '<cmd>NvimTreeToggle<cr>', desc = 'Open File Explorer' },
    },
  },

  -- undo tree
  {
    'mbbill/undotree',
    keys = {
      { '<leader>du', '<cmd>UndotreeToggle<cr>', desc = 'Open Undotree' },
    },
  },

  -- tmux (navigate seamless between neovim)
  {
    'christoomey/vim-tmux-navigator',
    keys = {
      { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Tmux Left' },
      { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Tmux Down' },
      { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Tmux Up' },
      { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Tmux Right' },
    },
  },

  -- icons
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- motion
  { 'tpope/vim-surround' },

  -- indent
  { 'lukas-reineke/indent-blankline.nvim' },

  -- status line
  { 'nvim-lualine/lualine.nvim' },

  -- peek number
  { 'nacro90/numb.nvim' },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  { 'lewis6991/gitsigns.nvim' },

  -- schemastore
  { 'b0o/schemastore.nvim' },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' },
      { 'williamboman/mason.nvim', config = true },
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      { 'folke/neodev.nvim' },
      { 'nvimdev/lspsaga.nvim' },
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('catppuccin')
    end,
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
          return vim.fn.executable('make') == 1
        end,
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
  },

  -- WEB DEV UTILS

  -- colorizer
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  -- import cost
  {
    'barrett-ruth/import-cost.nvim',
    build = 'sh install.sh yarn',
    ft = {
      'typescript',
      'javascript',
      'typescriptreact',
      'javascriptreact',
      'tsx',
      'jsx',
    },
    config = function()
      require('import-cost').setup({})
    end,
  },

  -- formatter
  { 'shendypratamaa/null-ls.nvim' },
}
