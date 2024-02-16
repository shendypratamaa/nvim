local lsp_opts = {
  servers = {
    html = {},
    cssls = {},
    tailwindcss = {
      filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "html",
        "css",
      }
    },
    emmet_ls = {},
    bashls = {},
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
  },
  signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  },
  lsp_signature = {
    hint_prefix = '🦕 ',
    toggle_key = '<C-k>',
    toggle_key_flip_floatwin_setting = true,
  },
  lsp_format = function()
    local success, err_msg = pcall(function()
      vim.cmd('Format')
    end)
    if success then
      local n_lines = vim.api.nvim_buf_line_count(0)
      local last_nonblank = vim.fn.prevnonblank(n_lines)
      if last_nonblank <= n_lines then
        vim.api.nvim_buf_set_lines(0, last_nonblank, n_lines, true, { '' })
        print('Formatting File Successfully 💅')
      end
    else
      print('Formatting File Failed ❌')
      print('Error Message:', err_msg)
    end
  end,
}

return lsp_opts

