![](./imgs/zsh_tmux_vim_screenshot.png)

# Prerequisites

 - vim ( >= 8.0 )
 - zsh ( >= 5.1.1 )
 - tmux ( >= 2.1 )

# Installation

```bash
$ git clone https://github.com/FriendLey/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./install.sh
```

# [Install YCM](https://github.com/ycm-core/YouCompleteMe)

 - 不能使用anaconda中的clang

# [install powerline font](https://github.com/powerline/fonts)

# 索引

## 安装ctags和gtags

### mac

[Install ctags](http://docs.ctags.io/en/latest/building.html)

```shell
$ xcode-select --install
$ brew tap universal-ctags/universal-ctags
$ brew install --HEAD universal-ctags
```

Install gtags

```shell
$ brew install global
$ pip install pygments
```

### ubuntu

Install ctags

```shell
$ git clone https://github.com/universal-ctags/ctags.git
$ cd ctags
$ ./autogen.sh
$ ./configure
$ make
$ make install
```

Install gtags

```shell
$ sudo apt install global
$ pip install pygments
```

安装vim-guntentags插件自动索引，相关配置如下：

```shell
" vim-gutentags
Plug 'ludovicchabant/vim-gutentags'
" how Gutentags figures out the project a file belongs to
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

set tags=./.tags;,.tags
" Specifies the name of the tag file to create. This will be appended to the project's root.
let g:gutentags_ctags_tagfile = '.tags'
" A list of arguments to pass to `ctags`, Defaults to `[]`.
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Specifies a directory in which to create all the tags files, instead of writing them at the root of each
" project. This is handy to keep tags files from polluting many directories all across your computer.
let s:vim_tags = expand('~/.cache/tags')
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags
```

`set tags=./.tags;,.tags`： tag 文件的名字从 "tags" 换成了 ".tags" ，前面多加了一个点，避免污染项目文件。 `./.tags;` 表示在文件所在目录下查找名字为 ".tags" 的符号文件，`;`代表查找不到的话向上递归到父目录，直到找到 .tags 文件或者递归到了根目录还没找到。`,.tags` 表示同时在vim的当前目录下面查找".tags"文件。



# Mac initialization

```shell
$ xcode-select --install
```

- [Install Homebrew](https://brew.sh/) 

```shell
$ brew cask install osxfuse
$ brew install sshfs
$ brew install tmux
$ brew install 
$ brew cask install iterm2
$ brew install autojump
$ brew install cmake
```

