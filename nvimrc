" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')

""" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" Project navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-projectionist'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'

""" Testing
Plug 'vim-test/vim-test'

""" Editing
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'qpkorr/vim-bufkill'

""" Git
Plug 'tpope/vim-fugitive'

""" Visual
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'ayu-theme/ayu-vim'
Plug 'camspiers/lens.vim'
Plug 'andymass/vim-tradewinds'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Boiler
filetype plugin indent on
syntax enable
set fileformats=unix,dos,mac
set confirm
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
set splitbelow splitright
set formatoptions=qrn1

" Folding
set foldmethod=syntax
set nofoldenable

" Set relative number in normal, absolute in insert
set number ruler relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
autocmd FileType nerdtree set norelativenumber
" using #j or #k ignores wrapped lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

set termguicolors
colorscheme gotham
" let ayucolor="mirage"
let ayucolor="dark"
colorscheme ayu
" set background=dark
" colorscheme gruvbox
highlight Normal ctermbg=NONE
highlight LineNr ctermbg=235
highlight SignColumn ctermbg=235
highlight CursorLineNr ctermbg=235
highlight CocErrorSign ctermbg=235
highlight CocWarningSign ctermbg=235
highlight CocInfoSign ctermbg=235
highlight CocHintSign ctermbg=235

set statusline=
set statusline+=
set statusline+=%<
set statusline+=%f
set statusline+=\ %{b:gitbranch}
set statusline+=%h%m%r
set statusline+=%=
set statusline+=\ %-14.(%l,%c%V%)\ %P
set statusline+=\ %y

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

nmap <Leader><C-s> :source ~/dotfiles/nvimrc<CR>

let mapleader=" "
imap jk <Esc>
imap kj <Esc>
autocmd BufWritePre * %s/\s\+$//e
nnoremap <Leader><CR> :noh<CR>

nnoremap <C-P> :Files<CR>
nnoremap <C-G> :Rg<CR>
nmap <unique> <leader>ff :Files<CR>
nmap <unique> <leader>fb :Buffers<CR>
nmap <unique> <leader>fm :Marks<CR>
nmap <unique> <leader>fw :Windows<CR>
nmap <unique> <leader>fc :Commits<CR>
nmap <unique> <leader>fl :Lines<CR>

map - :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:lens#animate = 0 " https://github.com/camspiers/lens.vim/issues/12
let g:lens#disabled_filetypes = ['defx', 'nerdtree', 'fzf', 'defxplorer']

let test#strategy="neovim"
let test#neovim#term_position = "botright"
nmap t<C-n> :TestNearest<CR>
nmap t<C-i> :TestNearest --interactive<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
function! ElixirTransform(cmd) abort
  if len(matchstr(a:cmd, '\v^mix test.*--interactive')) > 0
    return substitute('iex -S ' . a:cmd, '--interactive', '', '')
  else
    return a:cmd
  end
endfunction
let g:test#custom_transformations = {'elixir': function('ElixirTransform')}
let g:test#transformation = 'elixir'

let g:coc_global_extensions = ['coc-elixir', 'coc-json']

autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-l> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

map <leader>aa :A<CR>
nmap <leader>av :AV<CR>
map <leader>as :AS<CR>
map <leader>at :AT<CR>
let g:projectionist_heuristics = {}
let g:projectionist_heuristics['mix.exs'] = {
            \ 'apps/*/mix.exs': { 'type': 'app' },
            \ 'lib/*.ex': {
            \   'type': 'lib',
            \   'alternate': 'test/{}_test.exs',
            \   'template': ['defmodule {camelcase|capitalize|dot} do', 'end'],
            \ },
            \ 'test/*_test.exs': {
            \   'type': 'test',
            \   'alternate': 'lib/{}.ex',
            \   'template': ['defmodule {camelcase|capitalize|dot}Test do', '  use ExUnit.Case', '', '  alias {camelcase|capitalize|dot}, as: Subject', '', '  doctest Subject', 'end'],
            \ },
            \ 'mix.exs': { 'type': 'mix' },
            \ 'config/*.exs': { 'type': 'config' }
            \ }
