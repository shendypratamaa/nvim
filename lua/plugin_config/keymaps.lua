local keymap = vim.keymap.set

-- FUGITIVE
keymap('n', '<leader>gd', '<cmd>Gvdiffsplit!<cr>', { desc = 'Fugitive Split Diff' })
keymap('n', '<leader>ga', '<cmd>Git<cr>', { desc = 'Git Fugitive Changes' })
keymap('n', '<leader>gq', '<cmd>diffget //2<cr>', { desc = 'Diff Get //2' })
keymap('n', '<leader>gp', '<cmd>diffget //3<cr>', { desc = 'Diff Get //3' })

-- HARPOON
keymap('n', ']ga', "<cmd>lua require('harpoon.mark').add_file()<cr>", { silent = true, desc = 'Harpoon Add' })
keymap('n', ']gq', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', { silent = true, desc = 'Harpoon Quick Menu' })
keymap('n', ']gn', "<cmd>lua require('harpoon.ui').nav_next()<cr>", { silent = true, desc = 'Harpoon Next' })
keymap('n', ']gp', "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { silent = true, desc = 'Harpoon Prev' })
keymap('n', ']1', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { silent = true, desc = 'Harpoon File 1' })
keymap('n', ']2', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { silent = true, desc = 'Harpoon File 2' })
keymap('n', ']3', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { silent = true, desc = 'Harpoon File 3' })

-- MINI-BUFFERS
keymap("n", "]qu", "<cmd>lua MiniBufremove.unshow()<cr>", { desc = "Unshow BUffers" })
keymap("n", "]qq", "<cmd>bd<cr>", { desc = "Delete BUffers" })

require("mini.bufremove").setup()

-- TODO-COMMENTS
keymap('n', ']tn', function() require('todo-comments').jump_next() end, { desc = '[T]odo [N]ext' })
keymap('n', ']tp', function() require('todo-comments').jump_prev() end, { desc = '[T]odo [P]rev' })

-- PANTRAN (TRANSLATE)
keymap({ 'n', 'x' }, 'tr', require("pantran").motion_translate,
{
  desc = 'Translate Motion Words',
  silent = true,
  expr = true,
  noremap = true,
})
keymap('n', 'trr', function() return require("pantran").motion_translate() .. '_' end,
{
  desc = 'Translate Words One Line',
  silent = true,
  expr = true,
  noremap = true,
})

-- UNDOTREE
keymap('n', ']zu', '<cmd>UndotreeToggle<cr>', { desc = 'Open Undotree', silent = true })

-- NVIM-TREE
keymap('n', '<leader>fn', '<cmd>NvimTreeToggle<cr>', { desc = 'Open File Explorer' })

-- BARBAR
keymap('n', '<leader>bp', '<Cmd>BufferPick<CR>', { desc = "Buffer Pick" })
keymap('n', '<leader>bn', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = "Order By Number" })
keymap('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', { desc = "Order By Directory" })
keymap('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', { desc = "Order By Language" })
keymap('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', { desc = "Order By Window Number" })
