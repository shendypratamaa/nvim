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
    width = { min = 30, max = 50 },
    spacing = 4,
    align = 'center',
  },
}

whichkey.register({
  ['<leader>f'] = { name = '+LSP' },
  ['<leader>s'] = { name = '+SEARCH' },
  ['<leader>ft'] = { name = '+SAGAXME' },
  [']b'] = { name = '+BUFFER' },
  [']g'] = { name = '+GIT' },
  [']f'] = { name = '+UTILS' },
  [']t'] = { name = '+TROUBLE' },
  [']z'] = { name = '+UTILS' },
})

whichkey.setup(opts)

