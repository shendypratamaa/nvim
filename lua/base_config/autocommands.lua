local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- highlight when yanking was executed
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

-- close floating window
local qForCloseFloating = augroup('qForCloseFloating', { clear = true })
autocmd('FileType', {
  group = qForCloseFloating,
  pattern = {
    'qf',
    'help',
    'fugitive',
    'telescope_prompt',
    'git',
  },
  callback = function(pattern)
    vim.keymap.set('n', 'qq', function()
      local p = string.gsub(pattern.match, '%s', '')
      local f = vim.bo.filetype
      if p == f then
        local q = 'bd' .. pattern.buf
        vim.cmd(q)
      end
    end)
  end,
})

-- ignore
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

-- trim whitespaces x-axis
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])

