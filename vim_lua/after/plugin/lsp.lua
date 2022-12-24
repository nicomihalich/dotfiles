vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { noremap = true, silent = true, buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays a function's signature information
    bufmap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua require"telescope.builtin".lsp_definitions({ show_line = false })<CR>')

    -- Jump to declaration
    bufmap('n', 'gC', '<cmd>lua vim.lsp.buf.declaration()<CR>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua require"telescope.builtin".lsp_implementations({ show_line = false })<CR>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

    -- Lists all the references
    bufmap('n', 'gr',
      '<cmd>lua require"telescope.builtin".lsp_references({ show_line = false, jump_type = "never" })<CR>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

    -- Show quickfist list of dianostics
    bufmap('n', '<leader>l', '<cmd>lua vim.diagnostic.setloclist()<CR>')
    bufmap('n', '<leader>L', '<cmd>lclose<CR>')

    -- Move to the previous diagnostic
    bufmap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

    -- Move to the next diagnostic
    bufmap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>')

    -- Code action
    -- bufmap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')

    -- Displays hover information about the symbol under the cursor
    -- bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  end
})

vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
  group = vim.api.nvim_create_augroup('DiagnosticFloat', { clear = true })
})

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  signs = true,
  update_in_insert = true,
  underline = false,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
