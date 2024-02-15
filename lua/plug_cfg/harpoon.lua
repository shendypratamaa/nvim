local keymap = vim.keymap.set

keymap(
  'n',
  ']ga',
  "<cmd>lua require('harpoon.mark').add_file()<cr>",
  { silent = true, desc = 'Harpoon Add' }
)
keymap(
  'n',
  ']gq',
  '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>',
  { silent = true, desc = 'Harpoon Quick Menu' }
)
keymap(
  'n',
  ']gn',
  "<cmd>lua require('harpoon.ui').nav_next()<cr>",
  { silent = true, desc = 'Harpoon Next' }
)
keymap(
  'n',
  ']gp',
  "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
  { silent = true, desc = 'Harpoon Prev' }
)
keymap(
  'n',
  ']1',
  "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
  { silent = true, desc = 'Harpoon File 1' }
)
keymap(
  'n',
  ']2',
  "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
  { silent = true, desc = 'Harpoon File 2' }
)
keymap(
  'n',
  ']3',
  "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
  { silent = true, desc = 'Harpoon File 3' }
)

require('harpoon').setup()

