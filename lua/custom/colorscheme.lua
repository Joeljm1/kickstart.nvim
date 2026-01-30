Minimal = true
ToggleTheme = function()
  Minimal = not Minimal
  LoadTheme()
end

LoadTheme = function()
  if Minimal then
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
  vim.api.nvim_set_hl(0, "Directory",   { fg = palette["blue"]      })
  vim.api.nvim_set_hl(0, "Visual",      { bg = "#333333",           })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0A0A0A"            })
  vim.api.nvim_set_hl(0, "StatusLine",  { bg = "#111111"            })
  vim.api.nvim_set_hl(0, "StatusLine",  { bg = "#111111"            })
  vim.api.nvim_set_hl(0, "TODO",        { fg = palette["red"]       })
  vim.api.nvim_set_hl(0, "YankSystemClipboard", { bg = "#0000FF", fg = "#000000" })

  vim.api.nvim_set_hl(0, "rustCommentLineDoc",          { link = "Comment" })
    -- stylua: ignore end
  else
    vim.cmd.colorscheme 'tokyonight-night'
  end
end

LoadTheme()
