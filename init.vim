"
" __   __     _            __     _____ __  __
" \ \ / /   _| |__   ___   \ \   / /_ _|  \/  |
"  \ V / | | | '_ \ / _ \   \ \ / / | || |\/| |
"   | || |_| | |_) | (_) |   \ V /  | || |  | |
"   |_| \__,_|_.__/ \___/     \_/  |___|_|  |_|
"
"
" Author: @YuboSun

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !python3 -m pip install pynvim neovim autopep8
    silent !python2 -m pip install pynvim neovim autopep8
    silent !mkdir -p ~/.config/nvim/tmp/backup
    silent !mkdir -p ~/.config/nvim/tmp/undo
    silent !npm install vue-language-server -g
    silent !npm install bash-language-server -g
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
"set clipboard=unnamed
let &t_ut=''
set autochdir

filetype plugin on
syntax on

" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" To get correct comment highlighting
" autocmd FileType json syntax match Comment +\/\/.\+$+

" ===
" === Editor behavior
" ===
set hidden
set number
" set relativenumber
set cursorline
" 突入显示当前列
set cursorcolumn
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=7 " keep 5 lines offset to the bottom and top
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=300
"set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
" 设置取消备份 禁止生成临时文件
set nobackup
" 关闭交换文件
set noswapfile
set nowritebackup
set directory=/tmp/.swapfiles//
" 设置匹配模式 类似当输入一个左括号时会匹配响应的右括号
set showmatch
set matchtime=0
" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]
"在insert模式下能用删除键进行删除
set backspace=2
set backspace=indent,eol,start
" set fenc=utf-8
" set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp,ucs-bom
" set enc=utf-8
" set termencoding=utf-8
" vim支持打开的文件编码
set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,gbk,gb2312,cp936  "文件 UTF-8 编码
" 解决显示界面乱码
set fileencoding=utf-8
set encoding=utf-8      "vim 内部编码
set termencoding=utf-8
set formatoptions-=tc
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B
set splitright
set splitbelow
set mouse=a
set noshowmode
set showcmd
set cmdheight=2     " Height of the command line
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
"set wildmenu
exec "nohlsearch"
set ignorecase
set smartcase
set shortmess+=c
set signcolumn=yes
" set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

" Cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set different config for each file type
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ai
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sw=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ts=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sts=4
autocmd FileType javascript,html,css,xml,vue set ai
autocmd FileType javascript,html,css,xml,vue set sw=2
autocmd FileType javascript,html,css,xml,vue set ts=2
autocmd FileType javascript,html,css,xml,vue set sts=2
autocmd FileType vue syntax sync fromstart

" ===
" === Basic Mappings
" ===
let mapleader=" "

" Highlight a word
nmap z :let @/=expand('<cword>')<cr>

" Disable <F1>
map <F1> <Esc>
imap <F1> <Esc>

map ; :

" Save & quit
"map Q :q<CR>
"map S :w<CR>

" Remap U to <C-r> for easier redo
nnoremap U <C-r>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Copy to system clipboard
if has('macunix') "Mac
    vnoremap Y :.w !pbcopy <CR><CR>
elseif has('unix') "Linux
    vnoremap Y :.w !xclip -i -sel c<CR>
endif

" Search
let hlstate=0
nnoremap <LEADER><CR> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
" noremap <LEADER><CR> :nohlsearch<CR>
noremap n nzz
noremap N Nzz

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

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Maximize window and return to previous split structure
nnoremap <C-W>o :call MaximizeToggle()<CR>
" nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
" nnoremap <C-W>O :call MaximizeToggle()<CR>

function! MaximizeToggle()
    if exists("s:maximize_session")
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
    endif
endfunction

" Place the two screens up and down
noremap spj <C-w>t<C-w>K
" Place the two screens side by side
noremap sph <C-w>t<C-w>H

" Rotate screens
noremap srk <C-w>b<C-w>K
noremap srh <C-w>b<C-w>H

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

"insert a newline
inoremap <C-O> <Esc>o

" ===
" === Buffer management
" ===
" Write buffer (save)
noremap <LEADER>w :w<CR>
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

"switch buffer
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

" Vim-json qoutes concealing
" nmap <LEADER>cl :set conceallevel=2<CR>
" nmap <LEADER>ncl :set conceallevel=0<CR>
nnoremap <LEADER>nc :call QuoteConcealToggle()<CR>
" nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
" nnoremap <C-W>O :call MaximizeToggle()<CR>

function! QuoteConcealToggle()
    if &conceallevel == 2
        set conceallevel=0
    else
        set conceallevel=2
    endif
endfunction

" Press ` to change case (instead of ~)
noremap ` ~

"noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
" call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'

" Syntax
Plug 'sheerun/vim-polyglot'
" Plug 'posva/vim-vue'
Plug 'vim-syntastic/syntastic'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'

" Taglist
Plug 'liuchengxu/vista.vim'

" Error checking
Plug 'dense-analysis/ale'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'

" Git
Plug 'airblade/vim-gitgutter'

" Python
Plug 'tmhedberg/SimpylFold'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'tpope/vim-surround' " 1. ysiw' to wrap the word with ''; 2. cs'` to change 'word' to `word` 3. ds' to change 'word' to word
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine' " Indent line
Plug 'tpope/vim-repeat' " Enhance the dot (.) to repeat something
Plug 'junegunn/vim-peekaboo' " \" / \@ / CTRL-R to see register list

" Formatter
Plug 'Chiel92/vim-autoformat'

" Other useful utilities
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'

" For general writing
Plug 'junegunn/goyo.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Find & Replace
Plug 'wsdjeg/FlyGrep.vim' " Ctrl+f (normal) to find file content

" Vim Applications
Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'

" Other useful utilities
Plug 'airblade/vim-rooter' " auto change pwd

" Dependencies

call plug#end()

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file = 0
    silent! exec "!cp ~/.config/nvim/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" Optional themes for airline/lightline
set laststatus=2
" let g:airline_powerline_fonts = 1
" let g:airline_theme='dracula'
" let g:airline_theme='onedark'
" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#show_buffers = 0
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''


" ===
" === Dress up my vim
" ===
set termguicolors   " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

color deus

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===================== Start of Plugin Settings =====================

" ===
" === NERDTree
" ===
noremap nt :NERDTreeToggle<CR>
" let NERDTreeMapOpenExpl = ""
" let NERDTreeMapUpdir = "N"
" let NERDTreeMapUpdirKeepOpen = "n"
" let NERDTreeMapOpenSplit = ""
" let NERDTreeMapOpenVSplit = "I"
" let NERDTreeMapActivateNode = "i"
" let NERDTreeMapOpenInTab = "o"
" let NERDTreeMapOpenInTabSilent = ""
" let NERDTreeMapPreview = ""
" let NERDTreeMapCloseDir = ""
" let NERDTreeMapChangeRoot = "l"
" let NERDTreeMapMenu = ","
" let NERDTreeMapToggleHidden = "zh"


" ==
" == GitGutter
" ==
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
" nnoremap <LEADER>gf :GitGutterFold<CR>
" nnoremap <LEADER>gp :GitGutterPreviewHunk<CR>
" nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
" nnoremap <LEADER>g= :GitGutterNextHunk<CR>


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }


" ==
" == Nerdcommenter
" ==
" 注释符号和字符中间有空格
let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1


" ===
" === coc
" ===
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
    return !col || getline('.')[col - 1]    =~ '\s'
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


" ===
" === indentLine
" ===
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'
" " let g:indentLine_color_term = 238
" " let g:indentLine_color_gui = '#333333'
" silent! unmap <LEADER>ig
" autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === some error checking
" ===
let g:ale_virtualtext_cursor = 0
" let g:ale_linters = {
" \ 'cs': ['OmniSharp'],
" \ 'go': ['vim-go']
" \}


" ===
" === FZF
" ===
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-e> :Buffers<CR>


" ===
" === vim-signature
" ===
let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "dm-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "dm/",
            \ 'PurgeMarkers'       :  "dm?",
            \ 'GotoNextLineAlpha'  :  "m<LEADER>",
            \ 'GotoPrevLineAlpha'  :  "",
            \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
            \ 'GotoPrevSpotAlpha'  :  "",
            \ 'GotoNextLineByPos'  :  "",
            \ 'GotoPrevLineByPos'  :  "",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "",
            \ 'GotoPrevMarker'     :  "",
            \ 'GotoNextMarkerAny'  :  "",
            \ 'GotoPrevMarkerAny'  :  "",
            \ 'ListLocalMarks'     :  "m/",
            \ 'ListLocalMarkers'   :  "m?"
            \ }


" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<c-n>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-n>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" ===
" === rainbow_parentheses
" ===
let g:rbpt_colorpairs = [
            \ [158, '#00ceb3'],
            \ [081, '#00a3ff'],
            \ [214, '#ff8d00'],
            \ [123, '#3fffc9'],
            \ [045, '#29b9ec'],
            \ [190, '#bfec29'],
            \ [208, '#ffad00'],
            \ [117, '#48bde0'],
            \ ]

let g:rbpt_max = 8
let g:rbpt_loadcmd_toggle = 0

" ===
" === Vista.vim
" ===
map <silent> T :Vista!!<CR>
map <silent> <C-t> :Vista finder<CR>

function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b",
            \  }

" ===
" === Ultisnips
" ===
let g:tex_flavor = "plain"
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/snippets/', 'UltiSnips']
let g:UltiSnipsEditSplit="vertical"


" ===
" === FlyGrep
" ===
" nnoremap <c-f> :FlyGrep<CR>
nnoremap <leader>f :FlyGrep<CR>


" ===
" === vim-calendar
" ===
noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1

augroup calendar-mappings
    autocmd!
    " diamond cursor
    autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
    autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
    autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
    autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
    autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
    autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
    autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
    autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
    autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
    autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
    " unmap <C-n>, <C-p> for other plugins
    autocmd FileType calendar nunmap <buffer> <C-n>
    autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === AutoFormat
" ===
nnoremap \f :Autoformat<CR>

" ===
" === vim-easymotion
" ===
let g:EasyMotion_smartcase = 1
nmap ss <Plug>(easymotion-s2)
" 'f{char} to move to {char}
" map 'f <Plug>(easymotion-bd-f)
" nmap 'f <Plug>(easymotion-overwin-f)
" " 's{char}{char} to move to {char}{char}
" nmap 's <Plug>(easymotion-overwin-f2)
" " Move to line
" map 'l <Plug>(easymotion-bd-jk)
" nmap 'l <Plug>(easymotion-overwin-line)
" " Move to word
" map  'w <Plug>(easymotion-bd-w)
" nmap 'w <Plug>(easymotion-overwin-w)

" ==
" == vim-json
" ==
" set conceallevel=0  "do not conceal quotes

" ==
" == vim-peekaboo
" ==
let g:peekaboo_window = 'vert bo 80new'
let g:peekaboo_compact = 0


" ===================== End of Plugin Settings =====================

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
    exec "e ~/.config/nvim/_machine_specific.vim"
endif

" Testing my plugin
" set runtimepath+=~/.config/nvim/plugged/vim-amake
