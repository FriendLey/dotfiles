#!/bin/bash

root_path="$HOME/Documents"
dotfiles="$root_path/dotfiles"

if [[ -d "$dotfiles" ]]; then
  echo "Symlinking dotfiles from $dotfiles"
else
  echo "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

link "$dotfiles/vimrc" "$HOME/.vimrc"
vim +PlugInstall +qall
link "$dotfiles/vim/Ultisnips/" "$HOME/.vim/UltiSnips"
link "$dotfiles/tmux.conf" "$HOME/.tmux.conf"
