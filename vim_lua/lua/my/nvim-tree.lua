vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  view = {
    mappings = {
      list = {
        { key = '-', action = '' },
      }
    }
  },
  filters = {
    custom = { '^.git$' }
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      }
    }
  }
})

vim.keymap.set('n', '-', vim.cmd.NvimTreeToggle)
