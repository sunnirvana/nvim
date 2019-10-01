"CoC configlet 

" fix the most annoying bug that coc has
"autocmd WinEnter * call timer_start(1000, { tid -> execute('unmap if')})
"silent! autocmd BufEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
"silent! autocmd WinEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})

silent! au BufEnter * silent! unmap if

" https://github.com/mads-hartmann/bash-language-server
" https://github.com/rcjsuen/dockerfile-language-server-nodejs
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
let g:coc_global_extensions =[
            \'coc-html',
            \'coc-css',
            \'coc-snippets',
            \'coc-prettier',
            \'coc-eslint',
            \'coc-emmet',
            \'coc-tsserver',
            \'coc-pairs',
            \'coc-json',
            \'coc-python',
            \'coc-highlight',
            \'coc-git',
            \'coc-emoji',
            \'coc-lists',
            \'coc-stylelint',
            \'coc-yaml',
            \'coc-template',
            \'coc-tabnine',
            \'coc-marketplace',
            \'coc-gitignore',
            \'coc-yank'
            \]

augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" inoremap <silent><expr> <Tab>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<Tab>" :
      " \ coc#refresh()
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Useful commands
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
