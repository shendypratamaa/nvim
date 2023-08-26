local signs = {
  { name = 'DiagnosticSignError', text = '' },
  { name = 'DiagnosticSignWarn', text = '' },
  { name = 'DiagnosticSignHint', text = '' },
  { name = 'DiagnosticSignInfo', text = 'ﯧ' },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(
    sign.name,
    { texthl = sign.name, text = sign.text, numhl = '' }
  )
end

local servers = {
  html = {},
  cssls = {},
  tailwindcss = {},
  emmet_ls = {},
  bashls = {},
  tsserver = {},
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
      },
    },
  },
  lua_ls = {
    lua = {
      workspace = { checkthirdparty = false },
      telemetry = { enable = false },
    },
  },
  eslint = {},
}

local disableDiagnosticsLspVirtualText = function(server)
  if server.name == 'lua_ls' then
    vim.lsp.handlers['textDocument/publishDiagnostics'] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
      })
  end
end

local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  for k, _ in pairs(servers) do
    if client.name == k then
      client.server_capabilities.documentFormattingProvider = false
      disableDiagnosticsLspVirtualText(client)
    end
  end

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  nmap('K', '<cmd>Lspsaga hover_doc<cr>', 'Hover Documentation')
  nmap('<leader>rn', '<cmd>Lspsaga rename<cr>', '[R]e[n]ame')
  nmap('<leader>ca', '<cmd>Lspsaga code_action<cr>', '[C]ode [A]ction')
  nmap('<leader>fo', '<cmd>Lspsaga outline<cr>', '[O]utline')
  nmap('<leader>pd', '<cmd>Lspsaga peek_definition<cr>', '[P]eek [D]efinition')

  -- Diagnostic
  nmap(']e', '<cmd>Lspsaga show_line_diagnostics ++unfocus<cr>', 'Diagnostic Current Line')
  nmap(']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Diagnostic Next')
  nmap('[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Diagnostic Prev')

  -- Incoming Outgoing Calls
  nmap('<leader>ic', '<cmd>Lspsaga incoming_calls<cr>', '[I]incoming [C]alls')
  nmap('<leader>oc', '<cmd>Lspsaga outgoing_calls<cr>', '[O]utgoing [C]calls')

  -- Definitions References Implementations
  nmap('<leader>fr', '<cmd>Lspsaga finder ref<cr>', '[F]inder [R]eferences')
  nmap('<leader>fd', '<cmd>Lspsaga finder def<cr>', '[F]inder [D]efinition')
  nmap('<leader>fi', '<cmd>Lspsaga finder imp<cr>', '[F]inder [I]mplementation')
  nmap('<leader>fa', '<cmd>Lspsaga finder def+ref+imp<cr>', '[F]inder [A]All')

  -- Typescript
  if client.name == "tsserver" then
    nmap('<leader>to', '<cmd>TSToolsOrganizeImports<cr>', '[T]ypescript [O]rganize')
    nmap('<leader>tm', '<cmd>TSToolsAddMissingImports<cr>', '[T]ypescript [M]issing')
    nmap('<leader>ts', '<cmd>TSToolsSortImports<cr>', '[T]ypescript [S]ort')
    nmap('<leader>tr', '<cmd>TSToolsRemoveUnusedImports<cr>', '[T]ypescript [R]emove Unused Imports')
    nmap('<leader>tf', '<cmd>TSToolsFixAll<cr>', '[T]ypescript [F]ix All')
    nmap('<leader>tf', '<cmd>TSToolsGoToSourceDefinition<cr>', '[T]ypescript [F]ix All')
  else
    nmap('gd', '<cmd>Lspsaga goto_definition<cr>', '[G]oto [D]efinition')
  end

  -- Format
  nmap('<leader>ff', function()
    vim.cmd('Format')
    print('Formatting File Successfuly 💅')
  end, '[F]ormat [F]ile')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('plug_cfg.formatter').setup()

require('plug_cfg.typescript').setup()

require('neodev').setup()

require('lspsaga').setup({
  symbol_in_winbar = { enable = true },
  finder = { layout = 'normal' },
  ui = { sign = false },
})

require('plug_cfg.mason').setup(servers, capabilities, on_attach)

