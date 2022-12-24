require('gitsigns').setup({
  signcolumn = false,
  numhl = true,
  linehl = false
})

vim.keymap.set('n', '<leader>gts', '<cmd>Gitsigns toggle_signs<CR>')
vim.keymap.set('n', '<leader>gtn', '<cmd>Gitsigns toggle_numhl<CR>')
vim.keymap.set('n', '<leader>gtl', '<cmd>Gitsigns toggle_linehl<CR>')
