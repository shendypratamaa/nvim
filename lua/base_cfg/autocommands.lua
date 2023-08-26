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

-- add new line at the end
autocmd('BufWritePre', {
  pattern = "*",
  callback = function ()
    local n_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(n_lines)
    if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { '' }) end
  end
})

-- trim whitespaces
autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

