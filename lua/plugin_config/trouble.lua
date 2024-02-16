local trouble_ok, trouble = pcall(require, 'trouble')

if not trouble_ok then
  return
end

local opts = {
  mode = 'quickfix',
  indent_lines = true,
}

trouble.setup(opts)

