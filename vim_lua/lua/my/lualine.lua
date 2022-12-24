require('lualine').setup {
  sections = {
    lualine_x = { 'require"nvim-lightbulb".get_status_text()', 'filetype' }
  },
}
