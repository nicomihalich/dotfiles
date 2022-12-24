require('lspsaga').init_lsp_saga({
  code_action_lightbulb = {
    enable = false
  }
})

vim.keymap.set('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', { silent = true })
vim.keymap.set('n', 'gR', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true })
vim.keymap.set('n', '<leader>a', '<cmd>Lspsaga code_action<CR>', { silent = true })
vim.keymap.set('n', '<leader>A', '<cmd>Lspsaga outline<CR>', { silent = true })
vim.keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<CR>', { silent = true })
