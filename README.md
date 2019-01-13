# My vim configuration

## Cheat Sheet

See [here](cheatsheet.md).

## Instructions

### Install

- Clone and link the `vimrc`.

        cd ~/Workspace
        git clone https://github.com/xiejw/vimrc.git
        ln -sf ~/Workspace/vimrc ~/.vim
        ln -sf ~/.vim/vimrc ~/.vimrc

- Open vim and run `:PlugInstall`.
- Quit vim and open vim again.

### Update

After sync to head, run `:PlugStatus` to check the plugs status an execute
`:PlugInstall` or `:PlugUpdate` if necessary.

### Dependencies

Plugin `TagBar` depends on [Exuberant Ctags 5.5](http://ctags.sourceforge.net/).

- Ubuntu: `sudo apt-get install exuberant-ctags`.
- Mac OS: `brew install ctags`

In addition, for Golang, install `Gotags`:

    sudo mkdir -p /opt/go; sudo chrown $(whoami) /opt/go; \
      GOPATH=/opt/go go get -u github.com/jstemmer/gotags

