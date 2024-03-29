local keymap = vim.keymap.set

-- FUGITIVE : GIT
keymap('n', ']gg', '<cmd>Git<cr>', { desc = 'Git Fugitive Changes' })
keymap('n', ']gd', '<cmd>Gvdiffsplit!<cr>', { desc = 'Fugitive Split Diff' })
keymap('n', ']gq', '<cmd>diffget //2<cr>', { desc = 'Diff Get //2' })
keymap('n', ']gp', '<cmd>diffget //3<cr>', { desc = 'Diff Get //3' })

-- TELESCOPE : GIT
keymap('n', ']gs', '<cmd>Telescope git_status<cr>', { desc = 'Telescope Git Status' })
keymap('n', ']gB', '<cmd>Telescope git_branches<cr>', { desc = 'Telescope Git Branches' })
keymap('n', ']gc', '<cmd>Telescope git_commits<cr>', { desc = 'Telescope Git Preview commit' })

-- HARPOON
keymap('n', ']fa', "<cmd>lua require('harpoon.mark').add_file()<cr>", { silent = true, desc = 'Harpoon Add' })
keymap('n', ']fq', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', { silent = true, desc = 'Harpoon Quick Menu' })
keymap('n', ']fn', "<cmd>lua require('harpoon.ui').nav_next()<cr>", { silent = true, desc = 'Harpoon Next' })
keymap('n', ']fp', "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { silent = true, desc = 'Harpoon Prev' })
keymap('n', ']1', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { silent = true, desc = 'Harpoon File 1' })
keymap('n', ']2', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { silent = true, desc = 'Harpoon File 2' })
keymap('n', ']3', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { silent = true, desc = 'Harpoon File 3' })
keymap('n', ']4', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { silent = true, desc = 'Harpoon File 4' })
keymap('n', ']5', "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { silent = true, desc = 'Harpoon File 5' })

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
keymap('n', ']bp', '<Cmd>BufferPick<CR>', { desc = "Buffer Pick" })
keymap('n', ']bn', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = "Order By Number" })
