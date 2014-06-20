filetype plugin indent on
syntax enable
set mouse=a
set fileformats=unix,dos,mac
set confirm
set showtabline=2
set autoindent
set noshowmode
set encoding=UTF-8
set signcolumn=auto
set backspace=indent,eol,start whichwrap+=<,>,[,]
set fixendofline
set nobackup nowritebackup
set shortmess+=c
set scrolloff=1
set hidden
set ttyfast lazyredraw
set ignorecase smartcase
set list listchars=tab:»\ ,trail:#,extends:>
set expandtab tabstop=2 shiftwidth=2
set autoindent
set splitbelow splitright
set formatoptions=qrn1
set number ruler

set foldmethod=syntax
set nofoldenable

autocmd BufWritePre * %s/\s\+$//e
