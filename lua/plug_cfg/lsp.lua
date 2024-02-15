local signs = {
  { name = 'DiagnosticSignError', text = '' },
  { name = 'DiagnosticSignWarn', text = '' },
  { name = 'DiagnosticSignInfo', text = '' },
  { name = 'DiagnosticSignHint', text = '' },
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
  -- Keymaps
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Disable Diagnostics & Formatting
  for k, _ in pairs(servers) do
    if client.name == k then
      client.server_capabilities.documentFormattingProvider = false
      disableDiagnosticsLspVirtualText(client)
    end
  end

  -- User Format Commands
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  -- Typescript Keymap
  if client.name == 'tsserver' then
    nmap('<leader>to', '<cmd>TSToolsOrganizeImports<cr>', '[T]ypescript [O]rganize')
    nmap('<leader>tm', '<cmd>TSToolsAddMissingImports<cr>', '[T]ypescript [M]issing')
    nmap('<leader>ts', '<cmd>TSToolsSortImports<cr>', '[T]ypescript [S]ort')
    nmap('<leader>tr', '<cmd>TSToolsRemoveUnusedImports<cr>', '[T]ypescript [R]emove Unused Imports')
    nmap('<leader>ta', '<cmd>TSToolsFixAll<cr>', '[T]ypescript [F]ix All')
    nmap('<leader>tf', '<cmd>TSToolsFileReferences<cr>', '[T]ypescript Reference[S]')
    nmap('gd', '<cmd>TSToolsGoToSourceDefinition<cr>', 'Typescript [G]o to [D]efinition')
  end

  -- Lua Keymap
  if client.name == "lua_ls" then
    nmap(']w', '<cmd>w<cr><cmd>so%<cr>', 'Source File')
  end

  -- Basic Lsp
  nmap('K', '<cmd>Lspsaga hover_doc<cr>', 'Hover Documentation')
  nmap('gd', '<cmd>Lspsaga goto_definition<cr>', '[G]oto [D]efinition')
  nmap('<leader>fr', '<cmd>Lspsaga rename<cr>', '[R]ename')
  nmap('<leader>fo', '<cmd>Lspsaga outline<cr>', '[O]utline')
  nmap('<leader>fs', '<cmd>Lspsaga code_action<cr>', '[C]ode [A]ction')
  nmap('<leader>fd', '<cmd>Lspsaga peek_definition<cr>', '[P]eek [D]efinition')

  -- Incoming Outgoing Calls
  nmap('<leader>fc', '<cmd>Lspsaga incoming_calls<cr>', 'Incoming [C]alls')
  nmap('<leader>fC', '<cmd>Lspsaga outgoing_calls<cr>', 'Outgoing [C]calls')

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

  -- Illuminate Under Cursor
  nmap(']n', '<cmd>lua require("illuminate").goto_next_reference()<CR>', 'Illuminate Go Next')
  nmap('[n', '<cmd>lua require("illuminate").goto_prev_reference()<CR>', 'Illuminate Go Prev')

  -- Format
  nmap('<leader>ff', function()
    vim.cmd('Format')
    local n_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(n_lines)
    if last_nonblank <= n_lines then
      vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { '' })
    end
    print('Formatting File Successfuly 💅')
  end, '[F]ormat [F]ile')

  -- Diagnostic
  nmap(']e', '<cmd>Lspsaga show_line_diagnostics ++unfocus<cr>', 'Diagnostic Current Line')
  nmap(']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Diagnostic Next')
  nmap('[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Diagnostic Prev')

  -- Lsp Signature
  require("lsp_signature").on_attach({
    hint_prefix = "🦕 ",
    toggle_key = "<C-k>",
    toggle_key_flip_floatwin_setting = true,
  }, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('plug_cfg.formatter').setup()

require('plug_cfg.typescript').setup()

require('neodev').setup()

require('lspsaga').setup({
  symbol_in_winbar = { enable = true },
  ui = { sign = false }
})

require('plug_cfg.mason').setup(servers, capabilities, on_attach)

