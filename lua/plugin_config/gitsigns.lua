require('gitsigns').setup({
  current_line_blame = false,
  current_line_blame_opts = {
    delay = 1000,
  },
  on_attach = function(bufnr)
    vim.keymap.set(
      'n',
      ']c',
      require('gitsigns').prev_hunk,
      { buffer = bufnr, desc = '[G]o to [P]revious Hunk' }
    )
    vim.keymap.set(
      'n',
      '[c',
      require('gitsigns').next_hunk,
      { buffer = bufnr, desc = '[G]o to [N]ext Hunk' }
    )
    vim.keymap.set(
      'n',
      '<leader>gh',
      require('gitsigns').preview_hunk,
      { buffer = bufnr, desc = '[G]it Preview [H]unk' }
    )
    vim.keymap.set(
      'n',
      '<leader>gt',
      require('gitsigns').toggle_deleted,
      { buffer = bufnr, desc = '[G]it [T]toggle Delete' }
    )
    vim.keymap.set(
      'n',
      '<leader>gb',
      require('gitsigns').toggle_current_line_blame,
      { buffer = bufnr, desc = '[G]it [B]lame' }
    )
    vim.keymap.set(
      'n',
      '<leader>gH',
      require('gitsigns').stage_hunk,
      { buffer = bufnr, desc = '[G]it Stage [H]unk' }
    )
    vim.keymap.set('v', '<leader>gH', function()
      require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { buffer = bufnr, desc = '[G]it Stage [H]unk' })
    vim.keymap.set(
      'n',
      '<leader>gR',
      require('gitsigns').reset_hunk,
      { buffer = bufnr, desc = '[G]it [R]eset hunk' }
    )
    vim.keymap.set('v', '<leader>gR', function()
      require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { buffer = bufnr, desc = '[G]it [R]eset hunk' })
  end,
})

