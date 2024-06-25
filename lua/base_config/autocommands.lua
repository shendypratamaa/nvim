local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

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

-- trim whitespaces x-axis
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])

