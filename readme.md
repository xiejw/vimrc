# My vim configuration

## Cheat Sheet

See [here](cheatsheet.md).

## Instructions

### Install

- Clone and link the `vimrc`.

        cd ~/Workspace
        git clone git@github.com:xiejw/vimrc.git
        ln -sf ~/Workspace/vimrc ~/.vim
        ln -sf ~/.vim/vimrc ~/.vimrc

- Open vim and run `:PlugInstall`.
- Quit vim and open vim again.

### Update

After sync to head, run `:PlugStatus` to check the plugs status an execute
`:PlugInstall` or `:PlugUpdate` if necessary.

