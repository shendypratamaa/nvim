local cfm_ok, cfm = pcall(require, 'conform')

if not cfm_ok then
  return
end

cfm.setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    -- Use a sub-list to run only the first available formatter
    css = { 'prettierd' },
    html = { 'prettierd' },
    markdown = { 'prettierd' },
    javascript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescript = { 'prettierd' },
    typescriptreact = { 'prettierd' },
  },
})

