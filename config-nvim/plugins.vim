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
Plug 'jremmen/vim-ripgrep'

""" Testing
Plug 'vim-test/vim-test'

""" Editing
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'qpkorr/vim-bufkill'
Plug 'unblevable/quick-scope'

Plug 'honza/vim-snippets'

""" Git
Plug 'tpope/vim-fugitive'

""" Visual
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'srcery-colors/srcery-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'rose-pine/neovim'
Plug 'camspiers/lens.vim'
Plug 'andymass/vim-tradewinds'
call plug#end()

map - :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:lens#animate = 0 " https://github.com/camspiers/lens.vim/issues/12
let g:lens#disabled_filetypes = ['defx', 'nerdtree', 'fzf', 'defxplorer']

let test#strategy="neovim"
let test#neovim#term_position = "botright"

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

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'

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
