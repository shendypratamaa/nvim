local tsc_ok, tsc = pcall(require, 'tsc')

local typescript_ok, typescript = pcall(require, 'typescript-tools')

if not typescript_ok and tsc_ok then
  return
end

local M = {}

M.setup = function()
  tsc.setup({})
  typescript.setup({})
end

return M

