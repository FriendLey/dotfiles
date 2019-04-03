#!/bin/bash


export DOTFILES="$HOME/.dotfiles"

if [[ -d "$DOTFILES" ]]; then
  echo "Symlinking DOTFILES from $DOTFILES"
else
  echo "$DOTFILES does not exist"
  exit 1
fi

# pre install
if which apt-get >/dev/null; then
    sudo apt-get install -y vim zsh tmux
elif which yum >/dev/null; then
    sudo yum install -y vim zsh tmux
fi

# Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    export HOMEBREW_NO_AUTO_UPDATE=1
    echo "You are using HomeBrew tool"
    brew install vim zsh tmux
fi

# if ! command_exists zsh; then
#     echo "zsh not found. Please install and then re-run installation scripts"
#     exit 1
# elif ! [[ $SHELL =~ .*zsh.* ]]; then
#     echo "Configuring zsh as default shell"
#     chsh -s "$(command -v zsh)"
# fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

link "$DOTFILES/vim/vimrc.symlink" "$HOME/.vimrc"
vim +PlugInstall +qall
link "$DOTFILES/vim/Ultisnips/" "$HOME/.vim/UltiSnips"
link "$DOTFILES/tmux/tmux.conf.symlink" "$HOME/.tmux.conf"
link "$DOTFILES/zsh/zshrc.symlink" "$HOME/.zshrc"




