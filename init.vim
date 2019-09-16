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
set number
"set relativenumber
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
set ttimeoutlen=0
set notimeout
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
" set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
"set wildmenu
exec "nohlsearch"
set ignorecase
set smartcase
set shortmess+=c
" set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
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


" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
"tnoremap <C-N> <C-\><C-N>:q<CR>

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
" let mapleader=","
" Map ; to : and save a million keystrokes 用于快速进入命令行
map ; :

" Save & quit
"map Q :q<CR>
"map S :w<CR>

vmap j gj
vmap k gk

" Remap U to <C-r> for easier redo
nnoremap U <C-r>

" Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
map <LEADER>st :Startify<CR>

" Copy to system clipboard
if has('macunix') "Mac
    vnoremap Y :.w !pbcopy <CR><CR>
elseif has('unix') "Linux
    vnoremap Y :.w !xclip -i -sel c<CR>
endif

" Search
map <LEADER><CR> :nohlsearch<CR>
noremap - nzz
noremap = Nzz

" Adjacent duplicate words
map <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Folding
map <silent> <LEADER>o za

" Disable ex-mode
:nnoremap Q <Nop>


" ===
" === Cursor Movement
" ===
" N key: go to the start of the line
noremap <silent> H ^
" I key: go to the end of the line
noremap <silent> L $


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sj :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
" map <C-up> :res +5<CR>
" map <C-down> :res -5<CR>
map <C-up> :vertical resize-5<CR>
map <C-down> :vertical resize+5<CR>
" map <C-left> :vertical resize-5<CR>
" map <C-right> :vertical resize+5<CR>

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
map tt :tabe<CR>
" Move around tabs with tn and ti
map tp :-tabnext<CR>
map tn :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmp :-tabmove<CR>
map tmn :+tabmove<CR>

" ===
" === Tagbar
" ===
let g:tagbar_width = 60
nmap tb :TagbarToggle<cr>  
" -----------------------------

" ===
" === My Snippets
" ===
source ~/.config/nvim/snippits.vim


" ===
" === Other useful stuff
" ===

" Opening a terminal window
map <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
map ` ~

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet 

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/eleline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'liuchengxu/space-vim-theme'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'kien/rainbow_parentheses.vim'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Taglist
"Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
Plug 'liuchengxu/vista.vim'

" Error checking
"Plug 'w0rp/ale'

" Auto Complete
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'davidhalter/jedi-vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-github'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-match-highlight'
"Plug 'ncm2/ncm2-markdown-subscope'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/vim-cursorword'
"Plug 'tmhedberg/SimpylFold'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'

" Git
"Plug 'rhysd/conflict-marker.vim'
"Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'dkarter/bullets.vim', { 'for' :['markdown', 'vim-plug'] }
Plug 'vimwiki/vimwiki'

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Code management
Plug 'psf/black'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'tmhedberg/SimpylFold'
"Plug 'vim-scripts/restore_view.vim'
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'ryanoasis/vim-devicons'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

call plug#end()

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" ===
" === Dress up my vim
" ===
set termguicolors     " enable true colors support
let g:space_vim_transp_bg = 1
"let g:vim_monokai_tasty_italic = 1
"set background=dark
colorscheme space_vim_theme
"colorscheme vim-monokai-tasty

" ===================== Start of Plugin Settings =====================

" ===
" === Airline
" ===
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1 
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
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


" ===
" === NERDTree
" ===
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "N"
let NERDTreeMapUpdirKeepOpen = "n"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "I"
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapOpenInTabSilent = "O"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"


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
" === NCM2
" ===
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"let ncm2#popup_delay = 5
"let g:ncm2#matcher = "substrfuzzy"
"let g:ncm2_jedi#python_version = 3
"let g:ncm2#match_highlight = 'bold'
"let g:jedi#auto_initialization = 1
""let g:jedi#completion_enabled = 0
""let g:jedi#auto_vim_configuration = 0
""let g:jedi#smart_auto_mapping = 0
"let g:jedi#popup_on_dot = 1
"let g:jedi#completion_command = ""
"let g:jedi#show_call_signatures = "1"


" ===
" === coc
" ===
" fix the most annoying bug that coc has
"autocmd WinEnter * call timer_start(1000, { tid -> execute('unmap if')})
"silent! autocmd BufEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
"silent! autocmd WinEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
silent! au BufEnter * silent! unmap if
"au TextChangedI * GitGutter
" Installing plugins
" https://github.com/mads-hartmann/bash-language-server
" https://github.com/rcjsuen/dockerfile-language-server-nodejs
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-snippets', 'coc-neosnippet', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-yaml', 'coc-highlight', 'coc-vetur']
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
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


" ===
" === indentLine
" ===
let g:indentLine_char = '│'
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#333333'
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === some error checking
" ===
" I ain't need no ale!


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === FZF
" ===
" nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-e> :Buffers<CR>
"----------------------------


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


" ===
" === Undotree
" ===
map L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1


" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-k>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" ==
" == thesaurus_query
" ==
map <LEADER>th :ThesaurusQueryLookupCurrentWord<CR>


" Startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]


" ===
" === Far.vim
" ===
nnoremap <silent> <LEADER>f :F  %<left><left>


" ===
" === emmet
" ===
"let g:user_emmet_leader_key='<C-e>'


" ===
" === Bullets.vim
" ===
let g:bullets_set_mappings = 0


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

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax c,cpp,go,h,java,python,javascript,scala,coffee RainbowParenthesesLoadSquare
au Syntax c,cpp,go,h,java,python,javascript,scala,coffee,scss  RainbowParenthesesLoadBraces
" ----------------------------


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
"let g:vista_default_executive = 'ctags'
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']



" ===================== End of Plugin Settings =====================

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
  exec "e ~/.config/nvim/_machine_specific.vim"
endif

