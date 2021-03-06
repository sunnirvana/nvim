# My NeoVim Config

## Install dependencies

#### fzf

https://github.com/junegunn/fzf

#### ctags

http://docs.ctags.io/en/latest/index.html

- Linux installation

http://docs.ctags.io/en/latest/autotools.html

```shell
- Debian prerequisites
sudo apt install \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev

# Fedora prerequisites
sudo dnf install \
    gcc make \
    pkgconfig autoconf automake \
    python3-docutils \
    libseccomp-devel \
    jansson-devel \
    libyaml-devel \
    libxml2-devel

- Installation
./autogen.sh
./configure --prefix=/where/you/want # defaults to /usr/local
make
make install # may require extra privileges depending on where to install
```

- Mac installation

注意 Mac 上要安装最新的 ctags ，不然会有 ctags 不能运行的错误，extras -> extra

```shell
# Mac
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
```

#### COC configuration

- Install language server

```shell
npm i -g bash-language-server
```

## After Installation, You Need To:

- [ ] Install `pynvim` (pip)
- [ ] Install `nodejs`
- [ ] Install nerd-fonts (actually it's optional but it looks real good)

## After Installation, You Might Want To:

#### First of all

- [ ] Do `:checkhealth`

#### Config `Python` path

- [ ] Well, make sure you have python
- [ ] See `_machine_specific.vim`

#### For Code AutoComplete (coc)

Python:

- [ ] Do `pip3 install flake8` (for linting)

#### For Taglist:

- [ ] Install `ctags` for function/class/variable list

#### For inputing text ASCII art

- [ ] Install `figlet`

## Keyboard Shortcuts for `NORMAL` (`COMMAND`) Mode

### 1 Basic Commands

#### 1.1 The Most Basics

| Command | What it does                    |
| ------- | ------------------------------- |
| `k`     | Cursor up a terminal line       |
| `j`     | Cursor down a terminal line     |
| `h`     | Cursor left                     |
| `l`     | Cursor right                    |
| `Home`  | Cursor to the start of the line |
| `$`     | Cursor to the end of the line   |

#### 1.2 Some Other Commands to Know

| Command | What it does                          |
| ------- | ------------------------------------- |
| `<C-i>` | Go to the next cursor position        |
| `<C-o>` | Go to the previous cursor position    |
| `<C-a>` | Increase the number under cursor by 1 |
| `z=`    | Show spell suggestions                |
| `H`     | Joins the current line with the next  |
| `<`     | Un-indent                             |
| `>`     | Indent                                |

### 2 Window Management

#### 2.1 Creating Window Through Split Screen

| Command | What it does                                                                |
| ------- | --------------------------------------------------------------------------- |
| `sj`    | Create a new horizontal split screen and place it above the current window  |
| `sk`    | Create a new horizontal split screen and place it below the current window  |
| `sl`    | Create a new vertical split screen and place it left to the current window  |
| `sh`    | Create a new vertical split screen and place it right to the current window |
| `spj`   | Set the two splits to be vertical                                           |
| `sph`   | Set the two splits to be horizontal                                         |
| `srk`   | Rotate splits and arrange splits vertically                                 |
| `srh`   | Rotate splits and arrange splits horizontally                               |

#### 2.2 Moving the Cursor Between Different Windows

| Shortcut        | Action                         |
| --------------- | ------------------------------ |
| `<CTRL>w` + `w` | Move cursor to the next window |
| `<CTRL>w` + `h` | Move cursor one window left    |
| `<CTRL>w` + `l` | Move cursor one window right   |
| `<CTRL>w` + `u` | Move cursor one window up      |
| `<CTRL>w` + `j` | Move cursor one window down    |

#### 2.3 Maximize Current Window And Return

| Shortcut        | Action            |
| --------------- | ----------------- |
| `<CTRL>w` + `o` | Toggle Maximizing |

## Plugins

#### COC (AutoCompletion)

| Shortcut    | Action                |
| ----------- | --------------------- |
| `Space` `y` | Get yank history list |
| `gd`        | Go to definition      |
| `gr`        | List references       |
| `gi`        | List implementation   |
| `gy`        | Go to type definition |

#### NERDTree

| Shortcut          | Action          |
| ----------------- | --------------- |
| `tt`              | Toggle NerdTree |
| `,` (in NERDTREE) | Toggle menu     |

#### Vista.vim

Press `T` (`Shift` + `t`) to open function and variable list.

Press `Ctrl` + `T` to open function/class/variable finder

Press `q` to leave Vista.vim

#### FZF (the fuzzy file finder)

':FZF', search in current path
':FZF ..', search in parent path

| Shortcut   | Action                    |
| ---------- | ------------------------- |
| `Ctrl` `p` | Active FZF (current path) |
| `Ctrl` `u` | Move up 1 item            |
| `Ctrl` `e` | Move down 1 item          |

#### Undotree

| Shortcut      | Action          |
| ------------- | --------------- |
| `Shift` + `L` | Open Undotree   |
| `Shift` + `K` | History go up   |
| `Shift` + `J` | History go down |

#### vim-startify (Startup screen)

Press `Space` `s` `t` to openup `startify`

#### thesaurus_query.vim

Press `Space` `t` `h` to find synonyms

#### vim-signiture (Bookmarks)

| Shortcut    | Action                          | Command |
| ----------- | ------------------------------- | ------- |
| `m<letter>` | Add/remove mark at current line |         |
| `m/`        | List all marks                  |         |
| `m<SPACE>`  | Jump to the next mark in buffer |         |

For more commands, see [here](https://github.com/MattesGroeger/vim-bookmarks#usage)

#### vim-table-mode

Toggle "Table Editing Mode" with `<SPACE>tm` (equals to command `:TableModeToggle<CR>`)

#### vim-multiple-cursors

| Shortcut   | Action                              |
| ---------- | ----------------------------------- |
| `Ctrl`+`k` | Select next word (multiple cursors) |
| `Ctrl`+`p` | Select previous word                |
| `Ctrl`+`x` | Skip word                           |
| `Esc`      | Quit mutiple cursors                |

#### vim-surround

To add surround (`string` -> `"string"`):

```
string
```

press: `ysiw'`:

```
'string'
```

To change surround

```
'string'
```

press: `cs'"`:

```
"string"
```

#### fzf-gitignore

Press `Space` `g` `i` to create a `.gitignore` file

#### vim-calc

Press `Space` + `a` to calculate the equation in the current line

## Custom Snippets

#### Markdown

| Shortcut | What it creates     |
| -------- | ------------------- |
| `,n`     | ---                 |
| `,b`     | **Bold** text       |
| `,s`     | ~~sliced~~ text     |
| `,i`     | _italic_ text       |
| `,d`     | `code block`        |
| `,c`     | big `block of code` |
| `,m`     | - [ ] check mark    |
| `,p`     | picture             |
| `,a`     | [link]()            |
| `,1`     | # H1                |
| `,2`     | ## H2               |
| `,3`     | ### H3              |
| `,4`     | #### H4             |
| `,l`     | --------            |

`,f` to go to the next `<++>` (placeholder)

`,w` to go to the next `<++>` (placeholder) and then press `Enter` for you

## Other Useful Stuff

#### Press `<SPACE>fd` to highlight adjacent duplicated words

#### Press `tx` and enter your text

`tx Hello<Enter>`

```
 _   _      _ _
| | | | ___| | | ___
| |_| |/ _ \ | |/ _ \
|  _  |  __/ | | (_) |
|_| |_|\___|_|_|\___/
```

```

```
