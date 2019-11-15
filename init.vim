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
set hidden
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

" Set different config for each file type
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ai
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sw=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set ts=4
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sts=4
autocmd FileType javascript,html,css,xml set ai
autocmd FileType javascript,html,css,xml set sw=2
autocmd FileType javascript,html,css,xml set ts=2
autocmd FileType javascript,html,css,xml set sts=2

" ===
" === Buffet
" ===
source ~/.config/nvim/conf/buffet.vim

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
source ~/.config/nvim/conf/mappings.vim

" ===
" === Tagbar
" ===
" let g:tagbar_width = 60
" nmap tb :TagbarToggle<CR>
" -----------------------------

" ===
" === My Snippets
" ===
source ~/.config/nvim/conf/snippits.vim

" ===
" === Other useful stuff
" ===

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
" noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
" noremap <C-x> ea<C-x>s
" inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
noremap ` ~

"noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
" map tx :r !figlet

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" Pretty Dress
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/eleline.vim'
Plug 'bling/vim-bufferline'
" Plug 'liuchengxu/space-vim-theme'
Plug 'joshdick/onedark.vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'kien/rainbow_parentheses.vim'
Plug 'bagrat/vim-buffet'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'

" Syntax
Plug 'sheerun/vim-polyglot'

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'
Plug 'chrisbra/Colorizer' " Show colors with :ColorHighlight

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
"Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf'
Plug 'francoiscabrol/ranger.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Error checking
Plug 'dense-analysis/ale'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive' " gv dependency
Plug 'junegunn/gv.vim' " gv (normal) to show git log
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'

" Tex
" Plug 'lervag/vimtex'

" CSharp
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript' ", { 'for' :['javascript', 'vim-plug'] }
Plug 'jelera/vim-javascript-syntax'

" Go
Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }

" Python
Plug 'tmhedberg/SimpylFold'
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'dkarter/bullets.vim', { 'for' :['markdown', 'vim-plug'] }
"Plug 'vimwiki/vimwiki'

" Editor Enhancement
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
Plug 'AndrewRadev/switch.vim' " gs to switch
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'tpope/vim-capslock' " Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine' " Indent line
Plug 'tpope/vim-repeat' " Enhance the dot (.) to repeat something
Plug 'junegunn/vim-peekaboo' " \" / \@ / CTRL-R to see register list

" Formatter
Plug 'Chiel92/vim-autoformat'

" Code management
Plug 'psf/black'

" Other useful utilities
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'

" For general writing
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Find & Replace
Plug 'wsdjeg/FlyGrep.vim' " Ctrl+f (normal) to find file content
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
Plug 'osyo-manga/vim-anzu'

" Documentation
" Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc, not working on MacOS

" Mini Vim-APP
Plug 'mhinz/vim-startify'
"Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-clap'
Plug 'jceb/vim-orgmode'

" Vim Applications
Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'

" Other useful utilities
Plug 'airblade/vim-rooter' " auto change pwd
Plug 'tpope/vim-eunuch' " do stuff like :SudoWrite

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'
Plug 'rbgrouleff/bclose.vim' " For ranger.vim

call plug#end()

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file = 0
    silent! exec "!cp ~/.config/nvim/conf/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" ===
" === Dress up my vim
" ===
set termguicolors     " enable true colors support
" set $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme deus
" let g:space_vim_transp_bg = 1
"let g:vim_monokai_tasty_italic = 1
"set background=dark
" colorscheme space_vim_theme
" colorscheme ayu
"colorscheme vim-monokai-tasty

" ===================== Start of Plugin Settings =====================

" ===
" === Airline
" ===
" source ~/.config/nvim/conf/airline.vim


" ===
" === Eleline
" ===
set laststatus=2
let g:eleline_powerline_fonts = 1

" ===
" === NERDTree
" ===
noremap tt :NERDTreeToggle<CR>
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
" === NCM2
" ===
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<CR>": "\<CR>")
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
source ~/.config/nvim/conf/coc.vim


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
"let g:python_slow_sync = 0


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>


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


" ===
" === Undotree
" ===
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1


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


" ==
" == thesaurus_query
" ==
noremap <LEADER>th :ThesaurusQueryLookupCurrentWord<CR>


" Startify
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]


" ===
" === Far.vim
" ===
" nnoremap <silent> <LEADER>f :F  %<left><left>


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
source ~/.config/nvim/conf/vista.vim

" ===
" === Vimwiki.vim
" ===
" let g:vimwiki_file_exts = 'c, cpp, wav, txt, h, hpp, zip, sh, awk, ps, pdf, yaml, toml, json'
" let g:vimwiki_valid_html_tags = ''

" ===
" === Ranger.vim
" ===
nnoremap rr :Ranger<CR>


" ===
" === fzf-gitignore
" ===
" noremap <LEADER>gi :FzfGitignore<CR>


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
" === vimtex
" ===
"let g:vimtex_view_method = ''
"let g:vimtex_view_general_viewer = 'llpp'
"let g:vimtex_mappings_enabled = 0
"let g:vimtex_text_obj_enabled = 0
"let g:vimtex_motion_enabled = 0
"let maplocalleader=' '


" ===
" === FlyGrep
" ===
" nnoremap <c-f> :FlyGrep<CR>
nnoremap <leader>f :FlyGrep<CR>


" ===
" === GV
" ===
nnoremap gv :GV<CR>


" ===
" === vim-calendar
" ===
noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
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
" === Anzu
" ===
set statusline=%{anzu#search_status()}
nnoremap = n
nnoremap - N


" ===
" === vim-go
" ===
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
"let g:go_def_mapping_enabled = 1
let g:go_highlight_array_whitespace_error    = 1
let g:go_highlight_build_constraints         = 1
let g:go_highlight_chan_whitespace_error     = 1
let g:go_highlight_extra_types               = 1
let g:go_highlight_fields                    = 1
let g:go_highlight_format_strings            = 1
let g:go_highlight_function_calls            = 1
let g:go_highlight_function_parameters       = 1
let g:go_highlight_functions                 = 1
let g:go_highlight_generate_tags             = 1
let g:go_highlight_methods                   = 1
let g:go_highlight_operators                 = 1
let g:go_highlight_space_tab_error           = 1
let g:go_highlight_string_spellcheck         = 1
let g:go_highlight_structs                   = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types                     = 1
let g:go_highlight_variable_assignments      = 0
let g:go_highlight_variable_declarations     = 0


" ===
" === Black
" ===
nnoremap \b :Black<CR>

" ===
" === AutoFormat
" ===
nnoremap \f :Autoformat<CR>

" ===
" === OmniSharp
" ===
" let g:OmniSharp_typeLookupInPreview = 1
" let g:omnicomplete_fetch_full_documentation = 1

" let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_highlight_types = 2
" let g:OmniSharp_selector_ui = 'ctrlp'

" autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
" autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
" autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
" autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
" autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

" sign define OmniSharpCodeActions text=�

" augroup OSCountCodeActions
    " autocmd!
    " autocmd FileType cs set signcolumn=yes
    " autocmd CursorHold *.cs call OSCountCodeActions()
" augroup END

" function! OSCountCodeActions() abort
    " if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
    " if !OmniSharp#IsServerRunning() | return | endif
    " let opts = {
                " \ 'CallbackCount': function('s:CBReturnCount'),
                " \ 'CallbackCleanup': {-> execute('sign unplace 99')}
                " \}
    " call OmniSharp#CountCodeActions(opts)
" endfunction

" function! s:CBReturnCount(count) abort
    " if a:count
        " let l = getpos('.')[1]
        " let f = expand('%:p')
        " execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
    " endif
" endfunction


" ===
" === Colorizer
" ===
let g:colorizer_syntax = 1


" ===
" === vim-floaterm
" ===
"nnoremap ? :FloatermToggle<CR>
"let g:floaterm_position = 'center'
"let g:floaterm_winblend = 20
"let g:floaterm_height = winheight(0)/3*2
"let g:floaterm_width = &columns/3*2


" ===
" === vim-clap
" ===
"nnoremap ,c :Clap bcommits<CR>
"nnoremap ,l :Clap blines<CR>
nnoremap ,b :Clap buffers<CR>
nnoremap ,C :Clap colors<CR>
"nnoremap ,h :Clap hist<CR>
nnoremap ,c :Clap commits<CR>
"nnoremap ,f :Clap files<CR>
nnoremap ,t :Clap filetypes<CR>
nnoremap ,g :Clap gfiles<CR>
"nnoremap , :Clap grep<CR>
"nnoremap ,a :Clap jumps<CR>
"nnoremap , :Clap marks<CR>
"nnoremap ,t :Clap tags<CR>
nnoremap ,w :Clap window<CR>


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
" == Vim-json
" ==
" set conceallevel=0  "do not conceal quotes

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
