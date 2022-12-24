vim.g['test#strategy'] = 'neovim'
vim.g['test#term_position'] = 'botright'
vim.g['test#transformation'] = 'elixir'

vim.api.nvim_exec([[
  function! ElixirTransform(cmd) abort
    if len(matchstr(a:cmd, '\v^mix test.*--interactive')) > 0
      return substitute('iex -S ' . a:cmd, '--interactive', '', '')
    else
      return a:cmd
    end
  endfunction
  let g:test#custom_transformations = {'elixir': function('ElixirTransform')}
]], false)

vim.keymap.set('n', 't<C-n>', '<cmd>TestNearest<CR>')
vim.keymap.set('n', 't<C-i>', '<cmd>TestNearest --interactive<CR>')
vim.keymap.set('n', 't<C-f>', '<cmd>TestFile<CR>', { silent = true })
vim.keymap.set('n', 't<C-s>', '<cmd>TestSuite<CR>', { silent = true })
vim.keymap.set('n', 't<C-l>', '<cmd>TestLast<CR>', { silent = true })
vim.keymap.set('n', 't<C-g>', '<cmd>TestVisit<CR>', { silent = true })
