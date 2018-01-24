# Dotfiles

Check out nicknisi's [dotfiles](https://github.com/nicknisi/dotfiles). See his excellent video at [vim + tmux](https://www.youtube.com/watch?v=5r6yzFEXajQ). 

## Contents

+ [Workflow](#workflow)
+ [Install](#Install)
+ [Details](#Details)
+ [Vim and Neovim Setup](#vim-and-neovim-setup)
+ [Fonts](#fonts)
+ [Anaconda](#anaconda)

## Workflow

Next steps:

Incorporate installing Anaconda and custom pip list (including neovim package)

### Terminal

1. Terminal.app
    * Using [vbwx's base16-builder](https://github.com/vbwx/base16-builder-php) will generate Terminal.app profiles for each base16 scheme. Make sure to use the non-256-color profiles since the Terminal.app doesn't really support xterm-256-color.
2. [iterm2](https://www.iterm2.com/)
    * Works great, but I found that I didn't need all the features. And in favor of simplicity I've adopted using OSX's Terminal.app (which can still do all the fancy colorizations and supports some ligature fonts like FiraCode). Many terminal emulator color schemes can be modulated with *colors* can be modulated with [base16-shell](https://github.com/chriskempson/base16-shell)


## Install

```
cd ~
git clone https://github.com/damca/dotfiles
mv dotfiles .dotfiles
bash .dotfiles/install.sh
```

## Details 

### ZSH
ZSH is configured in the `zshrc.symlink` file, which will be symlinked to the home directory. Read/edit it with `,ez` within an nvim session (assuming it installed corretly)

Brief overview of zshrc:
* set the `EDITOR` to nvim
* Load any `~/.terminfo` setup
* Set the `CODE_DIR` variable, pointing to the location where the code projects exist for exclusive autocompletion with the `c` command
* Recursively search the `$DOTFILES/zsh` directory for files ending in .zsh and source them
* source a `~/.localrc` if it exists so that additional configurations can be made that won't be kept track of in this dotfiles repo. This is good for things like API keys, etc.
* Add the `~/bin` and `$DOTFILES/bin` directories to the path
* Setup NVM, RVM, and hub if they exist
* And more...

### Prompt

The prompt is meant to be simple while still providing a lot of information to the user, particularly about the status of the git project, if the PWD is a git project. This prompt sets `precmd`, `PROMPT` and `RPROMPT`.

![](http://nicknisi.com/share/prompt.png)

The `precmd` shows the current working directory in it and the `RPROMPT` shows the git and suspended jobs info.

#### Prompt Git Info

The git info shown on the `RPROMPT` displays the current branch name, and whether it is clean or dirty.

![](http://nicknisi.com/share/git-branch-state.png)

Additionally, there are ⇣ and ⇡ arrows that indicate whether a commit has happened and needs to be pushed (⇡), and whether commits have happened on the remote branch that need to be pulled (⇣).

![](http://nicknisi.com/share/git-arrows.png)

#### Suspended Jobs

The prompt will also display a ✱ character in the `RPROMPT` indicating that there is a suspended job that exists in the background. This is helpful in keeping track of putting vim in the background by pressing CTRL-Z.

![](http://nicknisi.com/share/suspended-jobs.png)

## Vim and Neovim

[Neovim](https://neovim.io/) is a fork and drop-in replacement for vim. In most cases, you would not notice a difference between the two, other than Neovim allows plugins to run asynchronously so that they do not freeze the editor, which is the main reason I have switched over to it. Vim and Neovim both use Vimscript and most plugins will work in both (all of the plugins I use do work in both Vim and Neovim). For this reason, they share the same configuration files in this setup. Neovim uses the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html) which means it won't look for a `.vimrc` in your home directory. Instead, its configuration looks like the following:

|                         | Vim        | Neovim                    |
|-------------------------|------------|---------------------------|
| Main Configuratin File  | `~/.vimrc` | `~/.config/nvim/init.vim` |
| Configuration directory | `~/.vim`   | `~/.config/nvim`          |


### Neovim setup

Vim is likely already installed on your system. If using a Mac, MacVim will be installed from Homebrew. Neovim will also be installed from Homebrew by default on a Mac. For other systems, you may need to install Neovim manually. See their [web site](https://neovim.io) for more information.

[`link.sh`](install/link.sh) will symlink the XDG configuration directory into your home directory and will then create symlinks for `.vimrc` and `.vim` over to the Neovim configuration so that Vim and Neovim will both be configured in the same way from the same files. The benefit of this configuration is that you only have to maintain a single vim configuration for both, so that if Neovim (which is still alpha software) has issues, you can very seamlessly transition back to vim with no big impact to your productivity.

Inside of [`.zshrc`](zsh/zshrc.symlink), the `EDITOR` shell variable is set to `nvim`, defaulting to Neovim for editor tasks, such as git commit messages. Additionally, I have aliased `vim` to `nvim` in [`aliases.zsh`](zsh/aliases.zsh) You can remove this if you would rather not alias the `vim` command to `nvim`.

vim and neovim should just work once the correct plugins are installed. To install the plugins, you will need to open Neovim in the following way:

```zsh
nvim +PlugInstall
```
Or once in neovim run :PlugInstall

To get *colorscheme* working in vim ensure that *Plug 'chriskempson/base16-vim'* is in the config/nvim/init.vim, and the commands ``

## Fonts

 nicknisi's original .dotfiles uses a nice developer-designed font called  [Operator Mono](http://www.typography.com/fonts/operator/styles/operatormonoscreensmart) for ascii characters. However, this font is expensive.

A great substitute is [FiraCode](https://github.com/tonsky/FiraCode). But currently it does not support italics.
SF Mono is nice and supports italics.

## Anaconda

Homebrew and [Anaconda](https://www.continuum.io/downloads) sometimes can mess each other up with dependencies found the PATH. To avoid this my default shell in iterm2 is the updated bash, and whenever I want to use brew, I'll start zsh. But within zsh, anaconda can be activated by toggling it in the PATH with the con script.

## Keyboard

One of the best tips I've had: remap CAPSLOCK to CONTROL. Settings > Keyborad > Modifier Keys. It is on the home row and makes so many things in vim easier. As well as EMACS style control in many text input sources (e.g. CTRL-A, CTRL-E, CTRL-K).

In addition, I use a Microsoft Sculpt keyboard that is ergonomic. In the same modifier keys menu there is a drop down source to choose the keyboard for remapping. I switch CMD <> OPTION and map CAPSLOCK > CNTRL. This is to allow the positioning of the keys to be the same as on a mac (CMD just left of the space bar). For the rest I use "better touch tool" that allows nice OS keyboard mapping functionality (mission control, etc.).
