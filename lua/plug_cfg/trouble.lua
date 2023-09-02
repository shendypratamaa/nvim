local trouble_ok, trouble = pcall(require, 'trouble')

local keymap = vim.keymap.set

if not trouble_ok then
  return
end

local opts = {
  mode = "quickfix",
  indent_lines = true,
}

keymap('n', ']tt', function() trouble.open() end, { desc = '[T]rouble [T]oggle', silent = true })
keymap('n', ']tq', function() trouble.open('quickfix') end, { desc = '[T]rouble [Q]uickfix', silent = true })
keymap('n', ']td', function() trouble.open('document_diagnostics') end, { desc = '[T]rouble [D]ocument Diagnostics', silent = true })
keymap('n', ']tw', function() trouble.open('workspace_diagnostics') end, { desc = '[T]rouble [W]orkspace Diagnostics', silent = true })

trouble.setup(opts)

