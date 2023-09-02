local pantran_ok, pantran = pcall(require, 'pantran')
local keymap = vim.keymap.set

if not pantran_ok then
  return
end

local opts = {
  default_engine = 'google',
  engines = {
    google = {
      fallback = {
        default_source = 'en',
        default_target = 'id',
      },
    },
  },
}

keymap({ 'n', 'x' }, 'tr', pantran.motion_translate, {
  desc = 'Translate Motion Words',
  silent = true,
  expr = true,
  noremap = true,
})

keymap('n', 'trr', function()
  return pantran.motion_translate() .. '_'
end, {
  desc = 'Translate Words One Line',
  silent = true,
  expr = true,
  noremap = true,
})

pantran.setup(opts)

