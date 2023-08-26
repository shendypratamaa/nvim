local nls_ok, nls = pcall(require, 'null-ls')

if not nls_ok then
  return
end

local M = {}

M.setup = function()
  nls.setup({
    sources = {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.prettierd,
      nls.builtins.diagnostics.eslint_d,
    },
  })
end

return M

