"CoC configlet 

" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python',
            \'coc-vetur',
            \'coc-vimlsp',
            \'coc-emmet',
            \'coc-html',
            \'coc-json',
            \'coc-css',
            \'coc-tsserver',
            \'coc-yank',
            \'coc-lists',
            \'coc-gitignore']

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]	=~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()

" Remap key for gotos
nmap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for renmae current word
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

" let g:coc_global_extensions =[
            " \'coc-html',
            " \'coc-css',
            " \'coc-snippets',
            " \'coc-prettier',
            " \'coc-eslint',
            " \'coc-emmet',
            " \'coc-tsserver',
            " \'coc-pairs',
            " \'coc-json',
            " \'coc-python',
            " \'coc-highlight',
            " \'coc-git',
            " \'coc-emoji',
            " \'coc-lists',
            " \'coc-stylelint',
            " \'coc-yaml',
            " \'coc-template',
            " \'coc-tabnine',
            " \'coc-marketplace',
            " \'coc-gitignore',
            " \'coc-yank'
            " \]

