require('nvim-lightbulb').setup({
  autocmd = {
    enabled = true
  },
  sign = {
    enabled = false
  },
  status_text = {
    enabled = true,
    text = "!"
  }
})

vim.fn.sign_define('LightBulbSign', { text = '!' })
