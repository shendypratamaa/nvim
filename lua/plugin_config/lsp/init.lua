local utils = require('plugin_config.lsp.opts')

for _, sign in ipairs(utils.signs) do
  vim.fn.sign_define(
    sign.name,
    { texthl = sign.name, text = sign.text, numhl = '' }
  )
end

local on_attach = function(client, bufnr)
  -- Keymaps
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Disable default formatter
  for k, _ in pairs(utils.servers) do
    if client.name == k then
      client.server_capabilities.documentFormattingProvider = false
    end
  end

  -- User Auto cmd format
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    require("conform").format({ bufnr = _.buf })
  end, { desc = 'Format current buffer with LSP' })

  -- Format
  nmap(']ff', utils.lsp_format, '[F]ormat [F]ile')

  -- Basic Lsp Keymap
  nmap('K', '<cmd>Lspsaga hover_doc<cr>', 'Hover Documentation')
  nmap('gd', '<cmd>Lspsaga goto_definition<cr>', '[G]oto [D]efinition')
  nmap('<leader>fr', '<cmd>Lspsaga rename<cr>', '[R]ename')
  nmap('<leader>fo', '<cmd>Lspsaga outline<cr>', '[O]utline')
  nmap('<leader>fs', '<cmd>Lspsaga code_action<cr>', '[C]ode [A]ction')
  nmap('<leader>fd', '<cmd>Lspsaga peek_definition<cr>', '[P]eek [D]efinition')

  -- Definitions References Implementations
  nmap('<leader>fR', '<cmd>Lspsaga finder ref<cr>', '[F]inder References')
  nmap('<leader>fD', '<cmd>Lspsaga finder def<cr>', '[F]inder Definition')
  nmap('<leader>fi', '<cmd>Lspsaga finder imp<cr>', '[F]inder Implementation')
  nmap('<leader>fa', '<cmd>Lspsaga finder def+ref+imp<cr>', '[F]inder [A]All')

  -- Intergrate Terminal With MyScripts
  nmap('<leader>ftF', '<cmd>Lspsaga term_toggle lf<cr>', 'Open LF')
  nmap('<leader>fte', '<cmd>Lspsaga term_toggle emoji<cr>', 'Open Emoji')
  nmap('<leader>fts', '<cmd>Lspsaga term_toggle tmux-sesionizer<cr>', 'Open New Tmux Session')
  nmap('<leader>ftf', '<cmd>Lspsaga term_toggle search<cr>', 'Search Sometings From Internet')
  nmap('<leader>ftk', '<cmd>Lspsaga term_toggle mkill<cr>', 'Kill Process')
  nmap('<leader>ftb', '<cmd>Lspsaga term_toggle bookmarks<cr>', 'Open bookmarks')
  nmap('<leader>ftg', '<cmd>Lspsaga term_toggle<cr>', 'Open Terminal')

  -- Illuminate Under Cursor
  nmap(']n', '<cmd>lua require("illuminate").goto_next_reference()<CR>', 'Illuminate Go Next')
  nmap('[n', '<cmd>lua require("illuminate").goto_prev_reference()<CR>', 'Illuminate Go Prev')

  -- Diagnostic
  nmap(']e', '<cmd>Lspsaga show_line_diagnostics ++unfocus<cr>', 'Diagnostic Current Line')
  nmap(']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Diagnostic Next')
  nmap('[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Diagnostic Prev')

  -- Opts Keymaps
  require("plugin_config.lsp.keymaps").setup(client, nmap)

  -- Lsp Signature
  require("lsp_signature").on_attach(utils.lsp_signature, bufnr)

  -- Replacement for tsserver lsp
  require('plugin_config.typescript').setup()

  -- LSP UI
  require('lspsaga').setup()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('neodev').setup()

require('plugin_config.lsp.mason').setup(utils.servers, capabilities, on_attach)

