local buff_ok, buff = pcall(require, "mini.bufremove")

if not buff_ok then
  return
end

vim.keymap.set("n", "]q", "<cmd>lua MiniBufremove.unshow()<cr>", { desc = "Unshow BUffers" })
vim.keymap.set("n", "]qq", "<cmd>bd<cr>", { desc = "Delete BUffers" })

buff.setup()
