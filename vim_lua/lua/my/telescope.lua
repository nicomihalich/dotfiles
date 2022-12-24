require('telescope').setup({
  defaults = {
    winblend = 15
  }
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')
require('telescope').load_extension('undo')

vim.keymap.set('n', '<C-P>', '<cmd>lua require"telescope.builtin".find_files()<CR>', {})
vim.keymap.set('n', '<C-G>', '<cmd>lua require"telescope.builtin".live_grep()<CR>', {})
vim.keymap.set('n', '<C-T>', '<cmd>Telescope aerial<CR>', {})

vim.keymap.set('n', '<leader>fb', '<cmd>lua require"telescope.builtin".buffers()<CR>', {})
vim.keymap.set('n', '<leader>fh', '<cmd>lua require"telescope.builtin".help_tags()<CR>', {})
vim.keymap.set('n', '<leader>fg', '<cmd>lua require"telescope.builtin".git_files()<CR>', {})
vim.keymap.set('n', '<leader>fm', '<cmd>lua require"telescope.builtin".marks()<CR>', {})
vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<CR>', {})
