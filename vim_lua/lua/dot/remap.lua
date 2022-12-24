vim.g.mapleader = ' '

vim.keymap.set('n', '<leader><CR>', ':noh<CR>', { silent = true, noremap = true })
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')

vim.keymap.set('n', 'j', '(v:count == 0 ? "gj" : "j")', { silent = true, expr = true })
vim.keymap.set('n', 'k', '(v:count == 0 ? "gk" : "k")', { silent = true, expr = true })

vim.keymap.set('n', '[b', ':bnext<CR>', { silent = true })
vim.keymap.set('n', ']b', ':bprev<CR>', { silent = true })

vim.keymap.set('n', ']q', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '[q', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>q', '<cmd>copen<CR>')
vim.keymap.set('n', '<leader>Q', '<cmd>cclose<CR>')

vim.keymap.set('n', ']t', 'gt')
vim.keymap.set('n', '[t', 'gT')
vim.keymap.set('n', '<leader>ta', '<cmd>$tabnew<CR>')
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>')

vim.keymap.set('n', ']l', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '[l', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('x', '<leader>p', [['_dP]])
