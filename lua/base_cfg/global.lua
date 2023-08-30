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

