# Dotfiles

# Tools
  * `xcode-select --install`
  * [asdf](https://asdf-vm.com/#/core-manage-asdf-vm)
  * [Homebrew](https://brew.sh/)
    * `exa`
    * `bat`
    * `tmux`
    * `neovim`
    * `ripgrep`
    * `fd`
    * [fzf](https://github.com/junegunn/fzf)

## zsh
  * https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh
  * https://github.com/git/git/blob/master/contrib/completion/git-completion.bash


```
touch ~/.other_alias
mkdir ~/.zsh
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
```
