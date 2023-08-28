vim.keymap.set(
  'n',
  '<leader>gd',
  '<cmd>Gvdiffsplit!<cr>',
  { desc = 'Open Fugitive Git' }
)
vim.keymap.set(
  'n',
  '<leader>ga',
  '<cmd>Git<cr>',
  { desc = 'Open Fugitive Git' }
)
vim.keymap.set(
  'n',
  '<leader>gq',
  '<cmd>diffget //2<cr>',
  { desc = 'Diff Get //2' }
)
vim.keymap.set(
  'n',
  '<leader>gp',
  '<cmd>diffget //3<cr>',
  { desc = 'Diff Get //3' }
)

