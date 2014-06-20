nnoremap <leader><CR> :noh<CR>
imap jk <Esc>
imap kj <Esc>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nnoremap <silent>[b :bnext<CR>
nnoremap <silent>]b :bprev<CR>

" NERDTree
map - :NERDTreeToggle<CR>

" fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <C-P> :FzfFiles<CR>
nnoremap <C-G> :FzfRg<CR>
nnoremap <C-f> :Rg<space>
nmap <unique> <leader>ff :FzfFiles<CR>
nmap <unique> <leader>fg :FzfRg<CR>
nmap <unique> <leader>fb :FzfBuffers<CR>
nmap <unique> <leader>fm :FzfMarks<CR>
nmap <unique> <leader>fw :FzfWindows<CR>
nmap <unique> <leader>fc :FzfCommits<CR>
nmap <unique> <leader>fl :FzfLines<CR>

" projectionist
map <leader>aa :A<CR>
nmap <leader>av :AV<CR>
map <leader>as :AS<CR>
map <leader>at :AT<CR>

" vim-test
nmap t<C-n> :TestNearest<CR>
nmap t<C-i> :TestNearest --interactive<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" coc
inoremap <silent><expr> <c-l> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

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
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
