Options = { "Minimal", "Default", "Tokyo-night", "Gruvbox - dark", "Gruvbox - light" }
SelectedColor = Options[1] -- minimal

function Mycolor()
  local palette = {
    ["yellow"] = "#F6C177",
    -- ['red'] = '#EB6F92',
    ["red"] = "#FF0000",
    ["blue"] = "#9CCFD8",
    ["text_dark"] = "#777777",
    ["purple"] = "#C4A7E7",
    ["teal"] = "#56949F",
    ["green"] = "#98C379",
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

  --RendeerMarkdown
  -- vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#333333", fg = palette["blue"] })
    -- H1: Blue (your palette["blue"]) with a subtle matching dark blue background
    vim.api.nvim_set_hl(0, "RenderMarkdownH1",   { fg = palette["blue"], bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#142530", fg = palette["blue"] })

    -- H2: Yellow (your palette["yellow"]) with a subtle warm dark background
    vim.api.nvim_set_hl(0, "RenderMarkdownH2",   { fg = palette["yellow"], bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#292214", fg = palette["yellow"] })

    -- H3: Purple with subtle dark violet background
    vim.api.nvim_set_hl(0, "RenderMarkdownH3",   { fg = palette["purple"], bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#241D30", fg = palette["purple"] })

    -- H4: Teal with subtle dark cyan background
    vim.api.nvim_set_hl(0, "RenderMarkdownH4",   { fg = palette["teal"], bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#142629", fg = palette["teal"] })

    -- H5: Green with subtle dark green background
    vim.api.nvim_set_hl(0, "RenderMarkdownH5",   { fg = palette["green"], bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#1A281A", fg = palette["green"] })

    -- H6: Red (your palette["red"]) with subtle dark red background
    vim.api.nvim_set_hl(0, "RenderMarkdownH6",   { fg = palette["red"], bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#2B0B0E", fg = palette["red"] })


    -- Code Blocks & Inline Code
    vim.api.nvim_set_hl(0, "RenderMarkdownCode",       { bg = "#16161E" })
    vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { bg = "#26233A", fg = palette["yellow"] })

    -- Bullets, Quotes, Checkboxes
    vim.api.nvim_set_hl(0, "RenderMarkdownBullet",    { fg = palette["blue"] })
    vim.api.nvim_set_hl(0, "RenderMarkdownQuote",     { fg = palette["text_dark"], italic = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownChecked",   { fg = palette["green"] })
    vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked", { fg = palette["text_dark"] })
    vim.api.nvim_set_hl(0, "RenderMarkdownTodo",      { fg = palette["yellow"], bold = true })

    -- Links
    vim.api.nvim_set_hl(0, "RenderMarkdownLink", { fg = palette["blue"], underline = true })
  -- Neogit
  -- inline diff
  vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "#370808" })

  vim.api.nvim_set_hl(0, "NeogitDiffAdd",    { bg = "#0F2E18" })

  -- Focused / Selected hunks (slightly highlighted)
  vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "#4A0F11" })
  vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight",    { bg = "#163D21" })

  -- Context lines & hunk headers
  vim.api.nvim_set_hl(0, "NeogitDiffContext",          { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = "#1a1a1a" })
  vim.api.nvim_set_hl(0, "NeogitHunkHeader",           { bg = "#1e222b", fg = "#8892b0" })
  vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight",  { bg = "#282e3a", fg = "#ccd6f6" })

  --Neovim geeral diffs
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#370808", fg = "#5A2020" })
  vim.api.nvim_set_hl(0, "DiffAdd",    { bg = "#0F2E18" })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "#142534" })
  vim.api.nvim_set_hl(0, "DiffText",   { bg = "#FABD2F",fg="#000000" })
  vim.api.nvim_set_hl(0, "rustCommentLineDoc",          { link = "Comment" })
  vim.wo.fillchars = 'eob: '
end

--- @param opt string
LoadTheme = function(opt)
  SelectedColor = opt
  if opt == Options[5] then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end

  if opt == Options[1] then
    -- === Colorscheme ===
    Mycolor()
    -- stylua: ignore end
  elseif opt == Options[2] then
    vim.cmd.colorscheme("default")
  elseif opt == Options[3] then
    vim.cmd.colorscheme("tokyonight-night")
  elseif opt == Options[4] then
    vim.cmd.colorscheme("gruvbox")
  elseif opt == Options[5] then
    vim.cmd.colorscheme("gruvbox")
  end
end

LoadTheme(Options[1])
