[TOC]

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

对于如下三种插件类型，vim-plugin自动管理和下载插件的时候，有不同的地址填写方法：

- 在 Github 上 vim-scripts 用户下的仓库,只需要写出`repo_name`
- 在 Github 其他用户下的 repos , 需要写出`"username/repo_name"`
- 不在 Github 上的插件，需要写出 git 全路径

## 安装插件

每次在新增插件之后，使用如下命令安装插件：

```bash
vim +PlugInstall +qall
```

## 删除插件

在配置文件中将要删除的插件删掉，然后命令行运行：

```
vim +PlugClean +qall
```



# vim 配置

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

##目录树

```bash
Plug 'scrooloose/nerdtree'

" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" map a specific key or shortcut to open NERDTree
map <C-m> :NERDTreeToggle<CR>
```

鼠标在目录列表中的相关操作：

- 打开/关闭目录： `o`或者`<Enter>`

- 新建目录/文件：`ma`
- 删除目录/文件：`md`
- 在已有窗口中打开文件并跳至该窗口：`o`
- 在已有窗口中打开文件但不跳至该窗口：`go`
- 水平新建新窗口打开文件且跳转至该窗口：`i`
- 水平新建新窗口打开文件但不跳转至该窗口：`gi`
- 竖直新建新窗口打开文件且跳转至该窗口：`s`
- 竖直新建新窗口打开文件但不跳转至该窗口：`gs`

窗口之间的移动操作：

- 移动到左侧树形目录：`ctrl + w + h`
- 移动到右侧文件显示窗口：`ctrl + w + l`

## 代码补全

### YouCompleteMe安装过程

$\textcolor{Blue}{这里不能使用anaconda的python，必须使用自带的python或者自带的python3。}​$

$\textcolor{Blue}{具体是python还是python3使用vim --version查看支持的是哪一个版本。}​$

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

### 自定义自己的代码块

在`.vimrc`中新建一个目录：`UltiSnips`，如果想要添加cpp文件的snippet，那么在此目录下新建`cpp.snippets`，然后写自己的代码块。





