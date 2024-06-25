local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- HIGHLIGHT
local highlightYK = augroup('highlightYK', { clear = true })
autocmd('TextYankPost', {
  group = highlightYK,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

DISABLE = {
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

require('base_config.options')

-- IGNORE
autocmd({ 'BufWinEnter' }, {
  callback = function()
    local excludes = {
      'set iskeyword+=-',
      'set formatoptions-=cro',
      'set wildignore+=*.meteor*',
      'set wildignore+=*vim/backups*',
      'set wildignore+=*sass-cache*',
      'set wildignore+=*cache*',
      'set wildignore+=*logs*',
      'set wildignore+=*node_modules/**',
      'set wildignore+=*DS_Store*',
      'set wildignore+=*.gem',
      'set wildignore+=log/**',
      'set wildignore+=tmp/**',
      'set wildignore+=*.png,*.jpg,*.gif',
      'set whichwrap+=<,>,[,],h,l',
      'set grepformat=%f:%l:%c:%m',
      'set nocompatible',
      'set nofoldenable',
      'set grepprg=rg\\ --vimgrep\\ --no-heading\\ --smart-case',
    }
    for _, option in ipairs(excludes) do
      vim.cmd(option)
    end
  end,
})

if vim.g.vscode then
  require('lazy').setup({
    { 'tpope/vim-surround', pin = true },
    {
      'vscode-neovim/vscode-multi-cursor.nvim',
      event = 'VeryLazy',
      cond = not not vim.g.vscode,
      opts = {},
    },
  }, DISABLE)

  require('vscode-multi-cursor').setup({
    default_mappings = true,
    no_selection = false,
  })

  local keymap = vim.keymap.set

  local opts = { noremap = true, silent = true }

  -- STAY IN INDENT MODE
  keymap('v', '<', '<gv', opts)
  keymap('v', '>', '>gv', opts)

  -- MOVE TEXT UP AND DOWN
  keymap('x', 'J', ":m '>+1<cr>gv-gv", opts)
  keymap('x', 'K', ":m '<-2<cr>gv-gv", opts)

  -- REMOVE PANES, MARK, HIGHLIGHTING
  keymap('n', 'nq', '<cmd>nohls<cr>', { desc = 'No Highlight Search' })

  -- FIX-BEHAVE
  keymap('n', 'n', 'nzzzv', opts)
  keymap('n', 'N', 'Nzzzv', opts)
  keymap('n', 'J', 'mzJ`z', opts)
  keymap('n', '<C-d>', '<C-d>zz', opts)
  keymap('n', '<C-u>', '<C-u>zz', opts)

  -- YANK
  keymap('n', 'Y', [[yg$]], opts)
  keymap('n', ']Y', [[gg"+yG]])
  keymap({ 'n', 'v' }, ']r', [["_dP]], opts)
else
  require('lazy').setup('plugin', DISABLE)
  require('base_config.global')
  require('base_config.keymaps')
  require('base_config.autocommands')
  require('plugin_config')
end

