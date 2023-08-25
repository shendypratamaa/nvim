local indent_ok, indent = pcall(require, 'indent_blankline')

if not indent_ok then
  return
end

vim.opt.list = false
vim.g.indent_blankline_enabled = false
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_show_end_of_line = false

vim.opt.listchars:append('space:⋅')
vim.opt.listchars:append('eol:↴')

vim.g.indent_blankline_char_list = { '»', '»', '»', '»' }
vim.g.indent_blankline_indent_level = 4
vim.g.indent_blankline_max_indent_increase = 1
vim.g.indnet_blankline_show_current_context = {
  '^func',
  'method',
  '^if',
  'for',
  'arguments',
  'object',
  'do_block',
  'table',
  'try',
  'while',
}

indent.setup()
