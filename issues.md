  * Ctrl + h was not working. In insert mode: <c-v><c-h> was rendering as <BS>.
  * Issue: https://github.com/neovim/neovim/issues/2048
  * Best solution: Edit -> Preferences -> Keys. Press +. Press Ctrl+h as Keyboard Shortcut. Choose Send Escape Sequence as Action. Type [104;5u for Esc+
  * When installing new plugins with vim-plug, add to init.vim (or vimrc), however saving the file is not sufficient for PlugInstall to work, you must restart vim. (You can also try nvim +PlugInstall at command line).
  * Linux change caps lock. Use dc
