-- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
-- Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
-- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

local lang = {
  "bash",
  "c",
  "cpp",
  "diff",
  "html",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "query",
  "vim",
  "vimdoc",
  "odin",
  "go",
  "elixir",
  "heex",
  "http",
  "svelte",
  "haskell",
  "llvm",
  "ocaml",
  "glsl",
  "templ",
}

require("nvim-treesitter").install(lang)

vim.api.nvim_create_autocmd("FileType", {
  pattern = lang,
  callback = function()
    vim.treesitter.start()
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- vim.treesitter.start()
-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
--  If you are experiencing weird indenting issues, add the language to
--  the list of additional_vim_regex_highlighting and disabled languages for indent.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function(args)
    vim.treesitter.start(args.buf)
    vim.bo[args.buf].syntax = "on"
  end,
})

-- config = function()
--   vim.api.nvim_create_autocmd('FileType', {
--     pattern = {
--       'bash',
--       'c',
--       'diff',
--       'html',
--       'lua',
--       'markdown',
--       'query',
--       'vim',
--     },
--     callback = function(args)
--       vim.treesitter.start(args.buf)
--       vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--     end,
--   })
--
-- end
