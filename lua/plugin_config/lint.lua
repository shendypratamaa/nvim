local ln_ok, ln = pcall(require, 'lint')

if not ln_ok then
  return
end

ln.linters_by_ft = {
  javascript = { "eslint_d" },
  typesript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  javascriptreact = { "eslint_d" },
}

local lint_group = vim.api.nvim_create_augroup('lint', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    pattern = { '*.tsx', '*.jsx', '*.ts', '*.js' },
    group = lint_group,
    callback = function()
      ln.try_lint()
    end,
  }
)
