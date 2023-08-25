local lualine_ok, lualine = pcall(require, 'lualine')

if not lualine_ok then
  return
end

local mode = {
  'mode',
  padding = 0,
  fmt = function()
    return '  '
  end,
}

local branch = {
  'branch',
  icon = '',
  padding = 2,
  fmt = function(str)
    if str == '' or str == nil then
      return '!= vcs'
    end
    return str
  end,
  on_click = function()
    vim.api.nvim_command('Telescope git_branches')
  end,
}

local icon_ft = {
  'icon_ft',
  padding = 0,
  icons_enabled = false,
  fmt = function()
    local ft = vim.bo.filetype
    local ws = {
      lua = '',
      javascript = '',
      typescript = '󰛦',
      javascriptreact = '',
      typescriptreact = '󰛦',
      json = '󰘦',
      html = '',
      css = '',
      sass = '',
      markdown = '',
      sh = '󰨊',
    }
    local s = function()
      local w = vim.o.columns / 6
      local h = ''
      for i = 1, w do
        h = h .. ' '
      end
      return h
    end
    local x = s()
    local y = ''
    for _, i in pairs(ws) do
      if ft == _ then
        y = x .. i
        break
      else
        y = x .. '🙅'
      end
    end
    return y
  end,
  on_click = function()
    vim.api.nvim_command('Mason')
  end,
}

local filename = {
  'filename',
  padding = 1,
  fmt = function()
    local fn = vim.fn
    local cwd = fn.expand('%:p')
    local short = fn.pathshorten(cwd, 1)
    return string.lower(short)
  end,
  on_click = function()
    vim.api.nvim_command('Telescope find_files')
  end,
}

local diff = {
  'diff',
  padding = 1,
  colored = true,
  symbols = { added = ' ', modified = ' ', removed = ' ' },
}

local diagnostics = {
  'diagnostics',
  padding = 1,
  colored = true,
  always_visible = true,
  update_in_insert = false,
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = ' ', warn = ' ' },
}

local spaces = {
  'spaces',
  padding = 1,
  color = 'lualine_b_normal',
  fmt = function()
    return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'tabstop')
  end,
}

local encoding = {
  'encoding',
  padding = 1,
  color = 'lualine_b_normal',
}

local filetype = {
  'filetype',
  padding = 1,
  icons_enabled = false,
  color = 'lualine_b_normal',
}

local location = {
  'location',
  padding = 1,
}

lualine.setup({
  options = {
    theme = 'catppuccin',
    icons_enabled = true,
    globalstatus = true,
    always_divide_middle = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'alpha' },
      winbar = {},
    },
    ignore_focus = {
      'qf',
      'git',
      'lazy',
      'mason',
      'NvimTree',
      'undotree',
      'fugitive',
      'lspsagafinder',
      'lspsagaoutline',
      'TelescopePrompt',
    },
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { icon_ft, filename },
    lualine_x = { diff, diagnostics, spaces, encoding, filetype },
    lualine_y = { location },
    lualine_z = { 'progress' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
