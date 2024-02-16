local ft = vim.bo.filetype

local M = {}

M.setup = function(client, nmap)
  if ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
    nmap('<leader>to', '<cmd>TSToolsOrganizeImports<cr>', '[T]ypescript [O]rganize')
    nmap('<leader>tm', '<cmd>TSToolsAddMissingImports<cr>', '[T]ypescript [M]issing')
    nmap('<leader>ts', '<cmd>TSToolsSortImports<cr>',  '[T]ypescript [S]ort')
    nmap('<leader>tr', '<cmd>TSToolsRemoveUnusedImports<cr>',  '[T]ypescript [R]emove Unused Imports')
    nmap('<leader>ta', '<cmd>TSToolsFixAll<cr>', '[T]ypescript [F]ix All')
    nmap('<leader>tf', '<cmd>TSToolsFileReferences<cr>', '[T]ypescript Reference[S]')
    nmap('gd', '<cmd>TSToolsGoToSourceDefinition<cr>', 'Typescript [G]o to [D]efinition')
    nmap(']fw', function()
      local save, error = vim.cmd([[w | e %]])
      if save then
        print('Save Reload File Successfully 💅')
      else
        print('Save Realod File Failed ❌')
        print('Error Message:', error)
      end
    end , { desc = 'Save File W Reload Current File' })
  elseif client.name == "lua_ls" then
    nmap('<leader>fc', '<cmd>Lspsaga incoming_calls<cr>', 'Incoming [C]alls')
    nmap('<leader>fC', '<cmd>Lspsaga outgoing_calls<cr>', 'Outgoing [C]calls')
    nmap(']w', '<cmd>w<cr><cmd>so%<cr>', 'Source File')
  else
    return
  end
end

return M
