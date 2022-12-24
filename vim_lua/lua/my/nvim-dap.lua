local dap = require('dap')
local dapui = require('dapui')

dapui.setup({
  icons = { expanded = 'v', collapsed = '>', current_frame = '>' },
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
      },
      position = 'left',
      size = 40,
    },
    {
      elements = {
        'stacks',
        'watches',
      },
      position = 'right',
      size = 40,
    },
    {
      elements = {
        'repl'
      },
      size = 0.25,
      position = 'bottom'
    }
  },
  controls = {
    enabled = false,
    element = 'repl',
    icons = {
      pause = '||',
      play = '|>',
      step_into = 'v',
      step_over = '>',
      step_out = '^',
      step_back = '<',
      run_last = 'r',
      terminate = 'X',
    }
  }
})

-- dap.adapters.lldb = {
--   type = 'executable',
--   command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
--   name = 'lldb'
-- }

-- dap.configurations.rust = {
--   {
--     name = 'Rust debug',
--     type = 'lldb',
--     request = 'launch',
--     program = function()
--       vim.fn.jobstart('cargo build')
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = true
--   },
-- }

vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>')

vim.keymap.set('n', '<leader>do', '<cmd>lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<leader>du', '<cmd>lua require"dap".step_out()<CR>')

vim.keymap.set('n', '<leader>dt', '<cmd>lua require"dapui".toggle()<CR>')

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close({})
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close({})
end
