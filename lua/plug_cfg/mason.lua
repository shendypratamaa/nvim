local mason_lsp_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')

if not mason_lsp_ok then
  return
end

local M = {}

M.setup = function(servers, capabilities, on_attach)
  mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })

  mason_lspconfig.setup_handlers({
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = (servers[server_name] or {}).settings,
        filetypes = (servers[server_name] or {}).filetypes,
      })
    end,
  })
end

return M

