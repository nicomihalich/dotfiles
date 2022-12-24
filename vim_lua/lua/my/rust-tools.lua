local rt = require('rust-tools')

rt.setup({
  tools = {
    runnables = {
      use_telescope = true,
    },
    debuggables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = false
    },
    hover_actions = {
      auto_focus = true
    }
  },
  dap = {
    adapter = {
      type = 'executable',
      command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
      name = 'rt_lldb',
    },
  },
  server = {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = 'clippy'
        },
        inlayHints = {
          locationLinks = false,
          parameterHints = {
            enable = true,
          },
          typeHints = {
            enable = true
          },
          closingBraceHints = {
            enable = true
          }
        },
      },
    },
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set('n', '<leader>f', '<cmd>lua require"rust-tools".hover_actions.hover_actions()<CR>',
        { buffer = bufnr })
      -- Code action groups
      vim.keymap.set('n', '<leader>ga', '<cmd>lua require"rust-tools".code_action_group.code_action_group()<CR>',
        { buffer = bufnr })
      -- Inlay Hints
      vim.keymap.set('n', '<leader>ri', '<cmd>RustEnableInlayHints<CR>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>ru', '<cmd>RustDisableInlayHints<CR>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>rr', '<cmd>RustRunnables<CR>', { buffer = bufnr })
      vim.keymap.set('n', '<leader>rd', '<cmd>RustDebuggables<CR>', { buffer = bufnr })
    end,
  },
})
