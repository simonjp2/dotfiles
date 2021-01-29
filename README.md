Dotfiles
========
My dotfiles, I shall call him dotfiles and he shall be mine and he shall be my dotfiles. Come on, dotfiles. Come on, little dotfiles.

I like to have my home directory as clean as possible, so I tried to move as much configuration into ~/.config as possible.

INSTALLATION
------------
Run this:
```sh
$ git clone git@github.com:simonjp2/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./macos/set-defaults.sh
```

ZSH
---
I use zsh as my shell, with a custom configuration and prompt.
```sh
$ ln -sf zsh/.zshrc ~/.zshrc
$ mkdir -p ~/.config
$ ln -sfF ~/.dotfiles/zsh ~/.config
```

GIT
---
Note: I use a helper function `g` for git commands, defined in my zsh configuration.
```sh
$ ln -sf ~/.dotfiles/git/gitconfig ~/.gitconfig
```

TMUX
----
I like to stay in the terminal, so tmux give me a lot of flexibility to get work done with minimal context switching.
```sh
$ ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
```

VIM/NVIM
--------
I still use vim for a few things, but primarily use neovim.
```sh
$ ln -sfF ~/.dotfiles/vim ~/.vim
$ mkdir -p ~/.config/nvim
$ ln -sf ~/.dotfiles/vim/init.vim ~/.config/nvim/init.vim
```

INSPIRATION
-----------
- [christoomey](https://github.com/christoomey/dotfiles)
- [holman](https://github.com/holman/dotfiles)
- [gabebw](https://github.com/gabebw/dotfiles)
- [LukeSmithxyz](https://github.com/LukeSmithxyz/voidrice)
