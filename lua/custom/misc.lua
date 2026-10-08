vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.v3",
  command = "set filetype=scala",
})
