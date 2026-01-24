-- RACKET
-- require('lspconfig').racket_langserver.setup {} Old way
vim.lsp.config('racket_langserver', {
  cmd = { 'racket', '--lib', 'racket-langserver' },
  filetypes = { 'racket', 'scheme' },
  root_ = { '.git' },
})
vim.lsp.enable 'racket_langserver'
vim.lsp.enable 'templ'
vim.lsp.enable 'gleam'
-- https://www.youtube.com/watch?v=oBiBEx7L000
--h lspconfig-all
