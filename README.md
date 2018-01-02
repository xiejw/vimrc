# My vim configuration

## Instructions

### Install

- Clone and link the `vimrc`.

        git clone https://github.com/xiejw/vimrc.git ~/.vim
        ln -sf ~/.vim/vimrc ~/.vimrc

- Open vim and run `:PlugInstall`.
- Quit vim and open vim again.

### Update

After sync to head, run `:PlugStatus` to check the plugs status an execute
`:PlugInstall` or `:PlugUpdate` if necessary.

### Dependencies


Plugin `TagBar` depends on [Exuberant Ctags 5.5](http://ctags.sourceforge.net/).

- Ubuntu: `sudo apt-get install exuberant-ctags`.

In addition, for Golang, install `Gotags`:

    mkdir -p /opt/go; GOPATH=/opt/go go get -u github.com/jstemmer/gotags

