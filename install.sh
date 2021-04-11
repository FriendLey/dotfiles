#!/bin/bash

export DOTFILES="$HOME/.dotfiles"

if [[ -d "$DOTFILES" ]]; then
    echo "Symlinking DOTFILES from $DOTFILES"
else
    echo "$DOTFILES does not exist"
    exit 1
fi

if ! which zsh > /dev/null; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    sudo sh -c "echo $(which zsh) >> /etc/shells"
    chsh -s "$(which zsh)"
fi

link() {
    from="$1"
    to="$2"
    echo "Linking '$from' to '$to'"
    rm -f "$to"
    ln -s "$from" "$to"
}

link "$DOTFILES/vim/vimrc.symlink" "$HOME/.vimrc"
link "$DOTFILES/vim/Ultisnips/" "$HOME/.vim/UltiSnips"
link "$DOTFILES/tmux/tmux.conf.symlink" "$HOME/.tmux.conf"

if [ `grep -c "customized_zsh.symlink" ~/.zshrc` -eq '0' ]; then
    # echo "source ~/.dotfiles/zsh/customized_zsh.symlink" >> "$HOME/.zshrc"
    sed -i '/oh-my-zsh.sh/i\source ~\/\.dotfiles\/zsh\/customized_zsh.symlink\n' ~/.zshrc
fi
