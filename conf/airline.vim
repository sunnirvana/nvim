set laststatus=2
let g:airline_powerline_fonts = 1
" let g:airline_theme='dracula'
" let g:airline_theme='onedark'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'Nor',
      \ 'i'  : 'Ins',
      \ 'R'  : 'Rpl',
      \ 'c'  : 'Cmd',
      \ 'v'  : 'Vis',
      \ 'V'  : 'Vli',
      \ '' : 'Vbl',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
