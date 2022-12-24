require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'elixir',
    'lua',
    'javascript',
    'json',
    'html',
    'help',
    'vim'
  },
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
  },

  indent = {
    enable = true
  },

  endwise = {
    enable = true
  }
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
