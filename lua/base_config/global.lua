function _G.open_in_browser()
  local url = string.match(
    vim.fn.expand('<cWORD>'),
    'https?://[%w-_%.%?%.:/%+=&]+[^ >"\',;`]*'
  )
  if url ~= nil then
    if vim.fn.has('macunix') == 1 then
      vim.cmd(('!open "%s"'):format(url))
    else
      vim.cmd(('!xdg-open "%s"'):format(url))
    end
  else
    print('No https or http URI found in line.')
  end
end

-- grep current word
function _G.findWordUnderCursor()
  local current_word = vim.fn.input('Looking Word Current File 👀 > ')
  if current_word ~= '' then
    local pattern = vim.fn.escape(current_word, '/')
    local command = string.format('vimgrep /%s/j **/*', pattern)
    local executed = function() vim.cmd(command) end
    local success, result = pcall(executed, command)
    if success then
      vim.cmd(command)
    else
      print('Error: ' .. result)
    end
  else
    print('Word Not Found!')
  end
end
