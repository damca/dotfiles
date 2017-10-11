* Ctrl + h was not working. On command line <c-v><c-h> showed . However, in insert mode: <c-v><c-h> was rendering as <BS>.
    * Current solution: update to neovim > 2.0
    * Issue: https://github.com/neovim/neovim/issues/2048
    * Best solution for iTerm: Edit -> Preferences -> Keys. Press +. Press Ctrl+h as Keyboard Shortcut. Choose Send Escape Sequence as Action. Type [104;5u for Esc+
* When installing new plugins with vim-plug, add to init.vim (or vimrc), however saving the file is not sufficient for PlugInstall to work, you must restart vim. (You can also try nvim +PlugInstall at command line).
* Linux change caps lock. Use dc
