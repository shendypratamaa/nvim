local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- RESIZE WITH ARROWS
keymap('n', '<C-S-Up>', '<cmd>resize +5<cr>', opts)
keymap('n', '<C-S-Down>', '<cmd>resize -5<cr>', opts)
keymap('n', '<C-S-Left>', '<cmd>vertical resize -5<cr>', opts)
keymap('n', '<C-S-Right>', '<cmd>vertical resize +5<cr>', opts)

-- PRESS JK FAST TO ENTER
keymap('i', 'jk', '<ESC>', { desc = 'Quit Insert Mode' })

-- STAY IN INDENT MODE
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- MOVE TEXT UP AND DOWN
keymap('x', 'J', ":m '>+1<cr>gv-gv", opts)
keymap('x', 'K', ":m '<-2<cr>gv-gv", opts)

-- NAVIGATION BUFFER
keymap('n', '<S-l>', '<cmd>bn<cr>', { desc = 'Buffer Next' })
keymap('n', '<S-h>', '<cmd>bp<cr>', { desc = 'Buffer Previous' })

-- NAVIGATION QUICKFIX
keymap('n', ']q', '<cmd>cnext<cr>', { desc = 'Quickfix Next' })
keymap('n', ']zq', '<C-w>o<cr>', { desc = 'Remove All Split Panes' })
keymap('n', '[q', '<cmd>cprev<cr>', { desc = 'Quickfix Prev' })

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

-- SPLIT WINDOW
keymap('n', 'vsp', '<cmd>vsp<cr>', opts)
keymap('n', 'sp', '<cmd>sp<cr>', opts)

-- LAZY
keymap('n', '<leader>l', '<cmd>Lazy<cr>', { silent = true, desc = 'Open Lazy' })

-- MASON
keymap( 'n', '<leader>m', '<cmd>Mason<cr>', { silent = true, desc = 'Open Mason' })

-- LSPINFO
keymap( 'n', '<leader>n', '<cmd>LspInfo<cr>', { silent = true, desc = 'Open Mason' })

-- URL VIEW
keymap('n', 'gx', '<cmd>lua open_in_browser()<cr>', opts)

-- GREPPER
keymap('n', '<leader>sd', on_current_directory, { desc = "Find Word Current Directory", silent = true })
