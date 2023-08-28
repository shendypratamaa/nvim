local whichkey_ok, whichkey = pcall(require, 'which-key')

if not whichkey_ok then
  return
end

local opts = {
  plugins = {
    marks = false,
    register = false,
  },
  key_labels = {
    ['<space>'] = 'SPC',
    ['<cr>'] = 'RET',
    ['<tab>'] = 'TAB',
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 1,
    align = 'center',
  },
}

whichkey.setup(opts)

