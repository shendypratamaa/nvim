local todo_ok, todo = pcall(require, 'todo-comments')

local keymap = vim.keymap.set

if not todo_ok then
  return
end

local opts = {
  keywords = {
    FIX = {
      icon = ' ', -- icon used for the sign, and in search results
      color = 'error', -- can be a hex color, or a named color (see below)
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = ' ', color = 'info' },
    HACK = { icon = ' ', color = 'warning' },
    WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
    PERF = { icon = '󱤎 ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
    NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
    TEST = { icon = '⏲ ', color = 'test', alt = { 'PASSED', 'FAILED' } },
  },
}

keymap('n', ']tn', function()
  require('todo-comments').jump_next()
end, { desc = '[T]odo [N]ext' })
keymap('n', ']tp', function()
  require('todo-comments').jump_prev()
end, { desc = '[T]odo [P]rev' })

todo.setup(opts)

