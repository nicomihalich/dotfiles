-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
local masonlsp = require('mason-lspconfig')
local lspconfig = require('lspconfig')

require('mason').setup()
masonlsp.setup({
  ensure_installed = {
    'elixirls',
    'sumneko_lua',
    'tsserver',
    'jsonls',
    'html',
    'vimls'
  }
})

masonlsp.setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
  ['sumneko_lua'] = function()
    lspconfig.sumneko_lua.setup({
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      }
    })
  end
})
