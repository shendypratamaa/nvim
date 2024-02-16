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

-- Greeper Word for Quickfix
function _G.on_current_directory()
  local current_word = vim.fn.input('Looking Word Current File 👀 > ')
  if current_word ~= '' then
    local word = string.format('vimgrep /%s/ ** | Trouble quickfix',
      vim.fn.escape(current_word, '/')
    )
    vim.cmd(word)
  else
    print('Word Not Found!')
  end
end

