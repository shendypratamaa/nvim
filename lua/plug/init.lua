return {
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim' },
      { 'williamboman/mason.nvim', config = true },
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      { 'folke/neodev.nvim' },
      { 'nvimdev/lspsaga.nvim' },
      { 'pmizio/typescript-tools.nvim' },
      { 'b0o/schemastore.nvim' },
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

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
  },

  -- Undo Tree
  {
    'mbbill/undotree',
    keys = {
      { '<leader>du', '<cmd>UndotreeToggle<cr>', desc = 'Open Undotree' },
    },
  },

  -- Tmux (navigate seamless between neovim)
  {
    'christoomey/vim-tmux-navigator',
    keys = {
      { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Tmux Left' },
      { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Tmux Down' },
      { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Tmux Up' },
      { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Tmux Right' },
    },
  },

  -- Colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },

  -- Colorizer
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  -- Autopairs
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Alternative Navigation
  { 'ThePrimeagen/harpoon' },

  -- Formatter
  { 'shendypratamaa/null-ls.nvim' },

  -- Git (info)
  { 'lewis6991/gitsigns.nvim' },

  -- Git (solver)
  { 'tpope/vim-fugitive' },

  -- File Explorer
  { 'nvim-tree/nvim-tree.lua' },

  -- Icons
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- Motion
  { 'tpope/vim-surround' },

  -- Status Line
  { 'nvim-lualine/lualine.nvim' },

  -- Peek Number
  { 'nacro90/numb.nvim' },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim' },

  -- todo comments
  { 'folke/todo-comments.nvim' },

  -- trouble
  { 'folke/trouble.nvim' },
}

