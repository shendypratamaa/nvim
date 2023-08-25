local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "ﯧ" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(
    sign.name,
    { texthl = sign.name, text = sign.text, numhl = "" }
  )
end

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  nmap('gd',  "<cmd>Lspsaga goto_definition<cr>", '[G]oto [D]efinition')
  nmap('K', "<cmd>Lspsaga hover_doc<cr>", 'Hover Documentation')
  nmap('<leader>rn', "<cmd>Lspsaga rename<cr>", '[R]e[n]ame')
  nmap('<leader>ca', "<cmd>Lspsaga code_action<cr>", '[C]ode [A]ction')
  nmap('<leader>fo', "<cmd>Lspsaga outline<cr>", '[O]utline')
  nmap('<leader>pd', "<cmd>Lspsaga peek_definition<cr>", '[P]eek [D]efinition')

  -- diagnostic
  nmap('<leader>e', "<cmd>Lspsaga show_line_diagnostics ++unfocus<cr>", 'Show Diagnostic Current Line')
  nmap('<leader>n', "<cmd>Lspsaga diagnostic_jump_next<cr>", 'Diagnostic [N]ext')
  nmap('<leader>p', "<cmd>Lspsaga diagnostic_jump_prev<cr>", 'Diagnostic [P]rev')

  -- find references
  nmap('<leader>ic', "<cmd>Lspsaga incoming_calls<cr>", '[I]incoming [C]alls')
  nmap('<leader>oc', "<cmd>Lspsaga outgoing_calls<cr>", '[O]utgoing [C]calls')

  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('gI', require("telescope.builtin").lsp_implementations, '[G]oto [I]mplementation')
  nmap('gD', require("telescope.builtin").lsp_definitions, '[G]oto [D]eclaration')

  -- Format
  nmap('<leader>ff', '<cmd>Format<cr>', '[F]ormat files')
end

require("lspsaga").setup({
  symbol_in_winbar = { enable = false },
})
require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
        validate = { enable = true },
      },
    },
  },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup { ensure_installed = vim.tbl_keys(servers), }

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}
