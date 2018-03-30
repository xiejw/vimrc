# My vim configuration

## Cheat Sheet

- `C-i`: Toggle IdentLines
- `C-j`: Toggle Tagbar

- `<leader>-b`: Switch to next buffer
- `<leader>-B`: Switch to previous buffer
- `<leader>-t`: Switch to next tab
- `<leader>-T`: Switch to previous tab

- `<leader>-s`: Open spell check
- `<leader>-ns`: Close spell check
- `<leader>-p`: Enable `paste`
- `<leader>-np`: Disable `paste`

- `<leader>-ll`: List local pending files (git)
- `<leader>-lb`: List recent files.

- `<leader>-zz`: List files via FZF.

- `<leader>-ee`: Try to open a file in local folder in current tab.
- `<leader>-et`: Try to open a file in local folder in new tab.

- `jk`: <esc>
- `` <leader>-` ``: Add `` ` `` to the start and end of the current word.

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

