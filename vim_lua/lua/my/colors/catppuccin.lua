require('catppuccin').setup({
  flavour = 'mocha',
  dim_inactive = {
    enabled = false
  },
  integrations = {
    gitsigns = true,
    telescope = true,
    neotree = true,
    native_lsp = {
      enabled = true
    }
  }
})
