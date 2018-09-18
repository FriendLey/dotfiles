[TOC]

# 安装macvim

```bash
brew install macvim
```

`~/.zshrc`中添加：

```bash
alias vim='mvim -v'
```



# Vundle（Vim bundle）

在 Vundle 这类插件管理器出现之前，vim 插件都散布在`~/.vim` 下的几个目录中，插件的安装、更新、删除都要自己手动来，即麻烦又容易出现错误。所以 Vundle 这类的插件管理插件应运而生，Vundle 将 git 也整合了进来，用户需要做的只是去 Github 中找到想要的插件地址，安装、更新、卸载都可以由 Vundle 来完成。

## 下载 Vundle

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## 配置插件

### 配置前的说明

插件有三种类型：

- Github 上 vim-scripts 仓库的插件
- Github 上非 vim-scripts 仓库的插件
- 不在Github上的插件

对于上面三种插件类型，Vundle自动管理和下载插件的时候，有不同的地址填写方法：

- 在 Github 上 vim-scripts 用户下的仓库,只需要写出`repo_name`
- 在 Github 其他用户下的 repos , 需要写出`"username/repo_name"`
- 不在 Github 上的插件，需要写出 git 全路径

### 配置示例及说明

所有的配置在`~/.vimrc`中完成。如下代码所示。以后安装新插件就直接编辑`~/.vimrc`，添加plugin就行了。

```cpp
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
```

## 卸载插件

将不用的插件在`~/.vimrc`中注释掉，然后打开vim执行`:PluginClean`即可。

或者直接命令行执行：`vim +PluginClean +qall`

# vim-plugin

## pros

- Easier to setup: Single file. No boilerplate code required.
- Easier to use: Concise, intuitive syntax
- Super-fast parallel installation/update (with any of +job, +python, +python3, +ruby, or Neovim)
- Creates shallow clones to minimize disk space usage and download time
- On-demand loading for faster startup time
- Can review and rollback updates
- Branch/tag/commit support
- Post-update hooks
- Support for externally managed plugins

## 使用方式

```c
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()
```

## 安装插件

接下来每次在`~/.vim.conf`新增插件之后，安装插件：

```bash
vim +PlugInstall +qall
```

## 删除插件

在`~/.vimrc`中将要删除的插件删掉，然后命令行运行：

```
vim +PlugClean +qall
```



# gtags

## 安装

gtags 不是vim插件，是一个独立的软件，他来替代ctags和cscope。

mac 安装 gtags：

```bash
➜  ~ brew info global
global: stable 6.6.2 (bottled), HEAD
Source code tag system
https://www.gnu.org/software/global/
Not installed
From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/global.rb
==> Dependencies
Required: python@2 ✘
Optional: ctags ✔
==> Options
--with-ctags
        Enable Exuberant Ctags as a plug-in parser
--with-pygments
        Enable Pygments as a plug-in parser (should enable exuberant-ctags too)
--with-sqlite3
        Use SQLite3 API instead of BSD/DB API for making tag files
--HEAD
        Install HEAD version
➜  ~ brew install global
```

只写 C/C++/Java 的话，那么到这里就够了，gtags 原生支持。如想要更多语言，那么 gtags 是支持使用 ctags/universal-ctags 或者 pygments 来作为分析前端支持 50+ 种语言。使用 ctags/universal-ctags 作为前端只能生成定义索引不能生成引用索引，因此我们要安装 pygments ，保证你的 $PATH 里面有 python，接着：

```bash
pip install pygments
```

保证 Vim 里要设置过两个环境变量才能正常工作：

```
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/path/to/share/gtags/gtags.conf'
```

第一个 GTAGSLABEL 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用 gtags 本地分析器，而其他语言使用 pygments 模块。

第二个环境变量必须设置，否则会找不到 native-pygments 和 language map 的定义， Windows 下面在 gtags/share/gtags/gtags.conf，Linux 下要到 /usr/local/share/gtags 里找，也可以把它拷贝成 ~/.globalrc ，Vim 配置的时候方便点。

## 【TODO】自动索引

安装两个插件：

```c
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
```

并做如下配置：

```c
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
   endif

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" 设置 F9 编译单个文件
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" 设置 F5 运行此文件
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
```

少用 **CTRL-]** 直接在当前窗口里跳转到定义，多使用 **CTRL-W ]** 用新窗口打开并查看光标下符号的定义，或者 **CTRL-W }** 使用 preview 窗口预览光标下符号的定义。





# vim 配置

## 自带配置

```c
" set syntax highlight on
syntax on

" display line number
set number

"set tab & space 4
set softtabstop=4
set shiftwidth=4

" use shallow color mark current line.
autocmd InsertLeave * set nocul
autocmd InsertEnter * set cul

" in editor mod. display current cursor's status, display at buttom right.
set ruler

```

## C++语法检查

```bash
Plug 'w0rp/ale'
```

语法检查错误会在侧边栏显示出来，避免侧边栏时有时无，`~/.vimrc`里添加：

```bash
set signcolumn=yes
```

## 代码更新提示

```bash
Plug 'mhinz/vim-signify'
```

在侧边栏显示修改情况（对比的是当前文件和 git/svn 仓库里的文件），比`git diff`好看多了。

## 代码补全

### YouCompleteMe安装过程

$\textcolor{Blue}{这里不能使用anaconda的python，必须使用自带的python或者自带的python3。}$

$\textcolor{Blue}{具体是python还是python3使用vim --version查看支持的是哪一个版本。}$

- Install the latest version of MacVim. Yes, MacVim. And yes, the latest.

- Install YouCompleteMe with vim-plug.

```bash
Plug 'Valloric/YouCompleteMe'
```

- Compiling YCM **with** semantic support for C-family languages and go language.
  - 这里翻墙会变慢

```bash
cd ~/.vim/plugged/YouCompleteMe/
/usr/local/bin/python3 install.py --clang-completer --system-libclang
```

之后vim打开cpp文件会发现：

```bash
NoExtraConfDetected: No .ycm_extra_conf.py file detected, so no compile flags are available. Thus no semantic support for C/C++/ObjC/ObjC++. Go READ THE DOCS *NOW*, DON'T file a bug repo ...
```

解决办法，`~/.vimrc`添加：

```
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
```

然后修改`.ycm_extra_conf.py`文件中flags的`-isystem`参数：

```
'-isystem',
'/usr/include',
'-isystem',
'/usr/include/c++/4.2.1',
```

### 接下来在`~/.vimrc`做一些配置

```bash
  " auto complete pane's color.
  highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
  highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
  " close function prototype when autocomplete.
  set completeopt=menu,menuone
  let g:ycm_add_preview_to_completeopt = 0
  " input 2 letters will trigger complete automaticly.
  let g:ycm_semantic_triggers =  {
              \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
              \ 'cs,lua,javascript': ['re!\w{2}'],
              \ }
  " whitelist.
  let g:ycm_filetype_whitelist = {
              \ "c":1,
              \ "cpp":1,
              \ "objc":1,
              \ "py":1,
              \ "sh":1,
              \ "zsh":1,
              \ "zimbu":1,
              \ }
```

## 括号和引号的自动补全和智能匹配

- 输入前大括号补全后大括号
- 在一对括号之间回车，自动分为3行并调整缩进
- 输入前引号自动补全后引号

```bash
Plug 'jiangmiao/auto-pairs'
```

## 代码块

Vim 比较流行的代码块引擎有 SnipMate 和 UltiSnips。目前越来越多的人选用 UltiSnips，它的优点有：

- 可以在代码片段中中嵌入 python / vim / bash 代码，动态实现一些很酷功能 
- 兼容 SnipMate
- 支持正则
- (据说) 响应速度更快，性能更好一些

`SirVer/ultisnips` 只是个引擎，需要搭配预设的代码块才能运转起来。自己创建代码块的过程中会遇到很多问题，所以直接用前人总结好的：`honza/vim-snippets`，几乎涵盖所有的主流编程语言。

所以整个过程如下：

- 安装引擎 SirVer/ultisnips
- 安装代码块集合 honza/vim-snippets
- 添加自定义代码块，把优先级调高，覆盖掉 `honza/vim-snippets` 中不满意的代码片段。

### 安装 `SirVer/ultisnips`和`honza/vim-snippets`

```bash
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
```

但是这样，tab会与ycm插件冲突。所以做如下设置：

```bash
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<c-l>"
```

这样就可以使用`ctrl-e`来做代码块补全配置。

### 自定义自己的代码块

在`.vimrc`中新建一个目录：`UltiSnips`，如果想要添加cpp文件的snippet，那么在此目录下新建`cpp.snippets`，然后写自己的代码块。



 # 问题及解决办法

## dyld: Library not loaded

```bash
dyld: Library not loaded: /usr/local/opt/perl/lib/perl5/5.24.0/darwin-thread-multi-2level/CORE/libperl.dylib
  Referenced from: /usr/local/bin/vim
  Reason: image not found
[1]    44267 abort      vim
```

解决办法：

```bash
$ brew uninstall vim
$ brew install --with-luajit vim
```





