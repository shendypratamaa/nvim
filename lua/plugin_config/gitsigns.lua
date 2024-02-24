local gs_ok, gs = pcall(require, "gitsigns");

if not gs_ok then
  return
end

local keymap = vim.keymap.set

gs.setup({
  current_line_blame = false,
  current_line_blame_opts = {
    delay = 1000,
  },
  on_attach = function(bufnr)
    keymap('n', '[c', gs.prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
    keymap('n', ']c', gs.next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
    keymap('n', ']gh', gs.preview_hunk, { buffer = bufnr, desc = '[G]it Preview [H]unk' })
    keymap('n', ']gt', gs.toggle_deleted, { buffer = bufnr, desc = '[G]it [T]toggle Delete' })
    keymap('n', ']gb', gs.toggle_current_line_blame, { buffer = bufnr, desc = '[G]it [B]lame' })
    keymap('n', ']gH', gs.stage_hunk, { buffer = bufnr, desc = '[G]it Stage [H]unk' })
    keymap('n', ']gR', gs.reset_hunk, { buffer = bufnr, desc = '[G]it [R]eset hunk' })
    keymap('v', ']gH', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { buffer = bufnr, desc = '[G]it Stage [H]unk' })
    keymap('v', ']gR', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { buffer = bufnr, desc = '[G]it [R]eset hunk' })
  end,
})

