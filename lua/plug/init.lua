return {
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gd', '<cmd>Gvdiffsplit!<cr>', desc = 'Open Fugitive Git' },
      { '<leader>ga', '<cmd>Git<cr>', desc = 'Open Fugitive Git' },
      { '<leader>gq', '<cmd>diffget //2<cr>', desc = 'Diff Get //2' },
      { '<leader>gp', '<cmd>diffget //3<cr>', desc = 'Diff Get //3' },
    },
  },

  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    keys = {
      { '<leader>fn', '<cmd>NvimTreeToggle<cr>', desc = 'Open File Explorer' },
    },
    config = function()
      require('plug_cfg.nvimtree')
    end,
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
    config = function()
      require('plug_cfg.tmux-navigator')
    end,
  },

  -- Icons
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- Motion
  { 'tpope/vim-surround' },

  -- Indent
  { 'lukas-reineke/indent-blankline.nvim' },

  -- Status Line
  { 'nvim-lualine/lualine.nvim' },

  -- Peek Number
  { 'nacro90/numb.nvim' },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {
      plugins = {
        marks = false,
        register = false,
      },
      key_labels = {
        ['<space>'] = 'SPC',
        ['<cr>'] = 'RET',
        ['<tab>'] = 'TAB',
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = 'center',
      },
    },
  },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  { 'lewis6991/gitsigns.nvim' },

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

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('plug_cfg.autopairs')
    end,
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

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
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

  -- Formatter
  { 'shendypratamaa/null-ls.nvim' },
}

