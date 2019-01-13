# Cheat Sheet

## General

| Category   | Key               | Comment                                              |
| ---------- | ------------------| -----------------------------------------------------|
| Switches   | `C-i`             | Toggle IdentLines                                    |
|            | `C-j`             | Toggle Tagbar                                        |
|            | `<leader>-s`      | Open spell check                                     |
|            | `<leader>-ns`     | Close spell check                                    |
|            | `<leader>-p`      | Enable `paste`                                       |
|            | `<leader>-np`     | Disable `paste`                                      |
| Navigation | `<leader>-b`      | Switch to next buffer                                |
|            | `<leader>-B`      | Switch to previous buffer                            |
|            | `<leader>-t`      | Switch to next tab                                   |
|            | `<leader>-T`      | Switch to previous tab                               |
| Listing    | `<leader>-ll`     | List local pending files (git)                       |
|            | `<leader>-lb`     | List recent files.                                   |
|            | `<leader>-zz`     | List files via FZF.                                  |
| Open       | `<leader>-ee`     | Try to open a file in local folder in current tab.   |
|            | `<leader>-et`     | Try to open a file in local folder in new tab.       |
| Special    | `jk`              | ESC                                                  |
|            | `` <leader>-` ``  | Add `` ` `` to the start and end of the current word.|


## Folding Cheat Sheet

This is the Vim built-in folding commands. Just copy here for quick reference.

| Category   | Keys              | Comment                                              |
| ---------- | ------------------| -----------------------------------------------------|
| Foldlevel  | `zi`              | switch folding on or off                             |
|            | `zm`              | increases the foldlevel by one.                      |
|            | `zM`              | closes all open folds.                               |
|            | `zr`              | decreases the foldlevel by one.                      |
|            | `zR`              | decreases the foldlevel to zero -- open everything.  |
| Open/Close | `za`              | toggle current fold open/closed                      |
|            | `zA`              | recursively open/close current fold                  |
|            | `zv`              | expand folds to reveal cursor                        |
|            | `zo`              | open current fold                                    |
|            | `zO`              | recursively open current fold                        |
|            | `zc`              | close current fold                                   |
|            | `zC`              | recursively close current fold                       |
| Move/Jump  | `zj`              | moves the cursor to the next fold.                   |
|            | `zk`              | moves the cursor to the previous fold.               |
|            | `[z`              | move to start of open fold.                          |
|            | `]z`              | move to end of open fold.                            |


## Unusual Shortcuts

    "*y     Copy the content to system clipboard.

