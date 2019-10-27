" ===
" === Basic Mappings
" ===
map ; :

" Save & quit
"map Q :q<CR>
"map S :w<CR>

" Remap U to <C-r> for easier redo
nnoremap U <C-r>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
noremap <LEADER>st :Startify<CR>

" Copy to system clipboard
if has('macunix') "Mac
    vnoremap Y :.w !pbcopy <CR><CR>
elseif has('unix') "Linux
    vnoremap Y :.w !xclip -i -sel c<CR>
endif

" Search
noremap <LEADER><CR> :nohlsearch<CR>
noremap - nzz
noremap = Nzz

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
noremap <LEADER>tt :%s/    /\t/g

" Folding
noremap <silent> <LEADER>o za

" Disable ex-mode
:nnoremap Q <Nop>

" Cursor Movement
" N key: go to the start of the line
noremap <silent> H ^
" I key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
" noremap <C-up> :res +5<CR>
" noremap <C-down> :res -5<CR>
" noremap <C-up> :vertical resize-5<CR>
" noremap <C-down> :vertical resize+5<CR>
" noremap <C-left> :vertical resize-5<CR>
" noremap <C-right> :vertical resize+5<CR>

" Place the two screens up and down
noremap spj <C-w>t<C-w>K
" Place the two screens side by side
noremap sph <C-w>t<C-w>H

" Rotate screens
noremap srk <C-w>b<C-w>K
noremap srh <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tt :tabe<CR>
" Move around tabs with tn and ti
noremap tp :-tabnext<CR>
noremap tn :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmp :-tabmove<CR>
noremap tmn :+tabmove<CR>
" Close the tab
noremap tx :tabclose<CR>


" insert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k>  <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

" command line alias
"cnoremap w!! w !sudo tee % >/dev/null
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

" Write buffer (save)
noremap <LEADER>w :w<CR>
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

"insert a newline
inoremap <C-O> <Esc>o

nnoremap  ]b :bp<CR>
nnoremap  [b :bn<CR>
"delete buffer
nnoremap <C-x>  :bd<CR>

"switch windw
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k

"smart move
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"tabline operation
" noremap <LEADER>tn :tabnew<CR>
" noremap <LEADER>te :tabedit
" noremap <LEADER>tm :tabmove

"buffer
" nnoremap <LEADER>bc :BufOnly<CR>
" nnoremap <LEADER>bo :BufOnly
"yank to end
" nnoremap Y y$

" settings for resize splitted window
nmap <C-w>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" a command which  edit PLugin config easy
nnoremap <LEADER>p :EditPluginSetting <Space>

nmap <LEADER>1 <Plug>BuffetSwitch(1)
nmap <LEADER>2 <Plug>BuffetSwitch(2)
nmap <LEADER>3 <Plug>BuffetSwitch(3)
nmap <LEADER>4 <Plug>BuffetSwitch(4)
nmap <LEADER>5 <Plug>BuffetSwitch(5)
nmap <LEADER>6 <Plug>BuffetSwitch(6)
nmap <LEADER>7 <Plug>BuffetSwitch(7)
nmap <LEADER>8 <Plug>BuffetSwitch(8)
nmap <LEADER>9 <Plug>BuffetSwitch(9)
nmap <LEADER>0 <Plug>BuffetSwitch(10)

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
noremap <expr> <C-f> max([winheight(0) - 2, 1])
	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")


