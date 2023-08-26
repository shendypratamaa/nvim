local typescript_ok, typescript = pcall(require, 'typescript-tools')

if not typescript_ok then
  return
end

local M = {}

M.setup = function()
  typescript.setup({})
end

return M
