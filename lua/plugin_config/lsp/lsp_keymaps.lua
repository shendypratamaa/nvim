local M = {}

M.setup = function(client, nmap)
  if client.name == "tailwindcss" or client.name == "emmet_ls" or client.name == "eslint" then
    -- TYPESCRIPT
    nmap("n",'<leader>to', '<cmd>TSToolsOrganizeImports<cr>', '[T]ypescript [O]rganize')
    nmap("n",'<leader>tm', '<cmd>TSToolsAddMissingImports<cr>', '[T]ypescript [M]issing')
    nmap("n",'<leader>ts', '<cmd>TSToolsSortImports<cr>',  '[T]ypescript [S]ort')
    nmap("n",'<leader>tr', '<cmd>TSToolsRemoveUnusedImports<cr>',  '[T]ypescript [R]emove Unused Imports')
    nmap("n",'<leader>ta', '<cmd>TSToolsFixAll<cr>', '[T]ypescript [F]ix All')
    nmap("n",'<leader>tf', '<cmd>TSToolsFileReferences<cr>', '[T]ypescript Reference[S]')
    nmap("n",'gd', '<cmd>TSToolsGoToSourceDefinition<cr>', 'Typescript [G]o to [D]efinition')
    nmap( "n", ']fw', function()
      local save, error = vim.cmd([[w | e %]])
      if save then
        print('Save Reload File Successfully 💅')
      else
        print('Save Realod File Failed ❌')
        print('Error Message:', error)
      end
    end , { desc = 'Save File W Reload Current File' })
  elseif client.name == "lua_ls" then
    -- LUA
    nmap('<leader>fc', '<cmd>Lspsaga incoming_calls<cr>', 'Incoming [C]alls')
    nmap('<leader>fC', '<cmd>Lspsaga outgoing_calls<cr>', 'Outgoing [C]calls')
    nmap(']w', '<cmd>w<cr><cmd>so%<cr>', 'Source File')
  end
end

return M
