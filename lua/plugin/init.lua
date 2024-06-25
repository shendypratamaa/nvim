return {
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    pin = true,
    dependencies = {
      { 'williamboman/mason-lspconfig.nvim', pin = true },
      { 'williamboman/mason.nvim', config = true, pin = true },
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {}, pin = true },
      { 'folke/neodev.nvim', pin = true },
      { 'nvimdev/lspsaga.nvim', pin = true },
      { 'pmizio/typescript-tools.nvim', pin = true },
      { 'b0o/schemastore.nvim', pin = true },
      { 'ray-x/lsp_signature.nvim', pin = true },
      { 'RRethy/vim-illuminate', pin = true },
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    pin = true,
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      { 'L3MON4D3/LuaSnip', pin = true },
      { 'saadparwaiz1/cmp_luasnip', pin = true },

      -- Adds LSP completion capabilities
      { 'hrsh7th/cmp-nvim-lsp', pin = true },
      { 'hrsh7th/cmp-buffer', pin = true },
      { 'hrsh7th/cmp-cmdline', pin = true },
      { 'hrsh7th/cmp-path', pin = true },

      -- Adds a number of user-friendly snippets
      { 'rafamadriz/friendly-snippets', pin = true },
    },
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    pin = true,
    dependencies = {
      { 'nvim-lua/plenary.nvim', pin = true },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        pin = true,
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
    },
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    pin = true,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', pin = true },
      { 'nvim-treesitter/nvim-treesitter-context', pin = true },
      { 'JoosepAlviste/nvim-ts-context-commentstring', pin = true },
      { 'windwp/nvim-ts-autotag', pin = true },
    },
    build = ':TSUpdate',
  },

  -- Tmux (navigate seamless between neovim)
  {
    'christoomey/vim-tmux-navigator',
    pin = true,
    cond = {function() return not vim.g.vscode end},
    keys = {
      { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Tmux Left' },
      { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Tmux Down' },
      { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Tmux Up' },
      { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Tmux Right' },
    },
    config = function ()
      vim.g.tmux_navigator_no_mappings = 1
      vim.g.tmux_navigator_save_on_switch = 2
      vim.g.tmux_navigator_disable_when_zoomed = 1
      vim.g.tmux_navigator_preserve_zoom = 1
    end
  },

  -- Colorscheme
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    pin = true,
    config = function()
      require('catppuccin').setup({ transparent_background = true })
      vim.cmd.colorscheme('catppuccin')
    end
  },

  -- Colorizer
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    pin = true,
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  -- Typescript compile check
  { 'dmmulroy/tsc.nvim', pin = true },

  -- Tabline
  {
    "romgrk/barbar.nvim",
    pin = true,
    opts = {}
  },

  -- Undo Tree
  { 'mbbill/undotree', pin = true },

  -- Autopairs
  { 'windwp/nvim-autopairs', event = 'InsertEnter', pin = true },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, pin = true },

  -- Alternative Navigation
  { 'ThePrimeagen/harpoon', pin = true },

  -- Formatter
  { 'stevearc/conform.nvim', pin = true },

  -- Linter
  { 'mfussenegger/nvim-lint', pin = true },

  -- Git (info)
  { 'lewis6991/gitsigns.nvim', pin = true },

  -- Git (solver)
  { 'tpope/vim-fugitive', pin = true },

  -- File Explorer
  { 'nvim-tree/nvim-tree.lua', pin = true },

  -- Icons
  { 'nvim-tree/nvim-web-devicons', lazy = true, pin = true },

  -- Motion
  { 'tpope/vim-surround', pin = true },

  -- Status Line
  { 'nvim-lualine/lualine.nvim', pin = true },

  -- Peek Number
  {
    'nacro90/numb.nvim',
    opts = {
      show_numbers = true,
      show_cursorline = true,
      hide_relativenumbers = true,
      number_only = false,
      centered_peeking = true,
    },
    pin = true
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', pin = true },

  -- Todo comments
  { 'folke/todo-comments.nvim', pin = true },

  -- Translator
  { 'potamides/pantran.nvim', pin = true },
}

