local set = vim.opt

set.number = true
set.fileformats = [[unix,dos,mac]]
set.ruler = true
set.mouse = 'a'
set.expandtab = true
set.tabstop = 2
set.shiftwidth = 2
set.confirm = true
set.showtabline = 2
set.encoding = 'UTF-8'
set.backspace = [[indent,eol,start]]
set.whichwrap = [[b,s,[,]<,>]]
set.fixendofline = true
set.writebackup = false
set.swapfile = false
set.shortmess = 'filnxtToOFc'
set.scrolloff = 1
set.hidden = true
set.ttyfast = true
set.lazyredraw = true
set.ignorecase = true
set.smartcase = true
set.list = true
set.listchars = [[tab:» ,trail:#,extends:>]]
set.splitbelow = true
set.splitright = true
set.formatoptions = 'qrn1'
set.signcolumn = 'yes'
set.updatetime = 200
set.completeopt = { 'menu', 'menuone', 'noselect' }

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*',
  command = [[%s/\s\+$//e]],
})
