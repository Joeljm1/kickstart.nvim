Options = { 'Minimal', 'Default', 'Tokyo-night', 'Gruvbox - dark', 'Gruvbox - light' }
SelectedColor = Options[1] -- minimal

--- @param opt string
LoadTheme = function(opt)
  SelectedColor = opt
  if opt == Options[5] then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end

  if opt == Options[1] then
    -- === Colorscheme ===
    local palette = {
      ['yellow'] = '#F6C177',
      -- ['red'] = '#EB6F92',
      ['red'] = '#FF0000',
      ['blue'] = '#9CCFD8',
      ['text_dark'] = '#777777',
    }


  -- stylua: ignore start
  vim.cmd.colorscheme("quiet")
  vim.api.nvim_set_hl(0, "Comment",     { fg = palette["text_dark"] })
  vim.api.nvim_set_hl(0, "String",      { fg = palette["yellow"]    })
  vim.api.nvim_set_hl(0, "Statement",      { fg = palette["yellow"]    }) -- keywords and all 
  vim.api.nvim_set_hl(0, "Operator",      { fg = palette["yellow"]    })
  vim.api.nvim_set_hl(0, "Directory",   { fg = palette["blue"]      })
  vim.api.nvim_set_hl(0, "Visual",      { bg = "#333333",           })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0A0A0A"            })
  vim.api.nvim_set_hl(0, "StatusLine",  { bg = "#111111"            })
  vim.api.nvim_set_hl(0, "StatusLine",  { bg = "#111111"            })
  vim.api.nvim_set_hl(0, "TODO",        { fg = palette["red"]       })
  vim.api.nvim_set_hl(0, "YankSystemClipboard", { bg = "#0000FF", fg = "#000000" })

  vim.api.nvim_set_hl(0, "rustCommentLineDoc",          { link = "Comment" })
  vim.wo.fillchars = 'eob: '
    -- stylua: ignore end
  elseif opt == Options[2] then
    vim.cmd.colorscheme 'default'
  elseif opt == Options[3] then
    vim.cmd.colorscheme 'tokyonight-night'
  elseif opt == Options[4] then
    vim.cmd.colorscheme 'gruvbox'
  elseif opt == Options[5] then
    vim.cmd.colorscheme 'gruvbox'
  end
end

LoadTheme(Options[1])
