local telescope_ok, telescope = pcall(require, 'telescope')

if not telescope_ok then
  return
end

local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        [']q'] = actions.close,
        ['<CR>'] = actions.select_default,
        ['<C-f>'] = actions.preview_scrolling_down,
        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-v>'] = actions.select_vertical,
        ['<C-h>'] = actions.select_horizontal,
        ['<C-n>'] = actions.move_selection_next,
        ['<C-p>'] = actions.move_selection_previous,
        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
        ['<C-t>'] = actions.smart_send_to_qflist + actions.open_qflist,
        ['<C-q>'] = actions_layout.toggle_preview,

        ['<Down>'] = false,
        ['<Up>'] = false,
        ['<C-d>'] = false,
      },
      n = {
        ['q'] = actions.close,
        [']q'] = actions.close,
        ['<CR>'] = actions.select_default,
        ['<C-f>'] = actions.preview_scrolling_down,
        ['<C-u>'] = actions.preview_scrolling_up,
        ['sp'] = actions.select_horizontal,
        ['vsp'] = actions.select_vertical,
        ['<C-n>'] = actions.move_selection_next,
        ['<C-p>'] = actions.move_selection_previous,
        ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
        ['<C-t>'] = actions.smart_send_to_qflist + actions.open_qflist,
        ['<C-q>'] = actions_layout.toggle_preview,

        ['<Down>'] = false,
        ['<Up>'] = false,
        ['<C-d>'] = false,
      },
    },
    borderchars = {
      prompt = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
      results = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
      preview = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
    },
    layout_config = {
      horizontal = {
        prompt_position = 'bottom',
        preview_width = 0.6,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.82,
      height = 0.75,
      preview_cutoff = 120,
    },
  },
})

local colors = {
  black = '#16161e',
  white = '#ffffff',
}

local telescope_borders = {
  TelescopePromptPrefix = { fg = colors.black },
  TelescopePromptCounter = { fg = colors.white, bold = true },
  TelescopePromptBorder = { fg = colors.white, bg = colors.white },
  TelescopePromptNormal = { fg = colors.black, bg = colors.white },
  TelescopePromptTitle = { fg = colors.white, bg = colors.white, bold = true },
  TelescopePreviewNormal = { bg = colors.black },
  TelescopePreviewBorder = { fg = colors.black, bg = colors.black },
  TelescopePreviewLine = { fg = colors.white, bg = colors.black, bold = true },
  TelescopePreviewTitle = { fg = colors.white, bg = colors.black, bold = true },
  TelescopeResultsNormal = { bg = colors.black },
  TelescopeResultsBorder = { fg = colors.black, bg = colors.black },
  TelescopeSelection = { fg = colors.white, bg = colors.black, bold = true },
  TelescopeResultsTitle = { fg = colors.black, bg = colors.black },
}

for k, v in pairs(telescope_borders) do
  vim.api.nvim_set_hl(0, k, v)
end

telescope.load_extension('fzf')

vim.keymap.set(
  'n',
  '<leader>?',
  builtin.oldfiles,
  { desc = '[?] Find recently opened files' }
)
vim.keymap.set(
  'n',
  '<leader><space>',
  builtin.buffers,
  { desc = '[ ] Find existing buffers' }
)
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown({
    winblend = 0,
    previewer = false,
  }))
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set(
  'n',
  '<leader>gf',
  builtin.git_files,
  { desc = 'Search [G]it [F]iles' }
)
vim.keymap.set(
  'n',
  '<leader>sf',
  builtin.find_files,
  { desc = '[S]earch [F]iles' }
)
vim.keymap.set(
  'n',
  '<leader>sh',
  builtin.help_tags,
  { desc = '[S]earch [H]elp' }
)
vim.keymap.set(
  'n',
  '<leader>sw',
  builtin.grep_string,
  { desc = '[S]earch current [W]ord' }
)
vim.keymap.set(
  'n',
  '<leader>sg',
  builtin.live_grep,
  { desc = '[S]earch by [G]rep' }
)
vim.keymap.set(
  'n',
  '<leader>sd',
  builtin.diagnostics,
  { desc = '[S]earch [D]iagnostics' }
)
