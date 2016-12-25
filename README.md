# Dotfiles

This is my personalized version of nicknisi's [dotfiles](https://github.com/nicknisi/dotfiles). See his excellent video at [vim + tmux](https://www.youtube.com/watch?v=5r6yzFEXajQ). Be warned: I am learning as I go and there a lot of gaps in my git/bash/vim/tmux knowledge ;)

## Contents

+ [starting clean](#starting-clean)
+ [ZSH Details](#zsh-details)
+ [Vim and Neovim Setup](#vim-and-neovim-setup)
+ [Fonts](#fonts)
+ [Anaconda](#anaconda)

## starting clean

This requires OSX.  
* Get [iterm2](https://www.iterm2.com/). Such a nice terminal emulator. Default profile preferences are a plist in ~/Library/Preferences/
*  Install `brew`. Your /usr/local directory is empty, [Homebrew](http://brew.sh/) will use this directory to do local installs and builds. You can clean it out whenever you need. Also, homebrew now automatically installs the XCode CLI tools
*  Your bash is out of date and cannot run the install.sh correctly. Run `brew install bash`

```bash
sudo -s  # Uses whatever shell is assigned to the SHELL variable
echo /usr/local/bin/bash >> /etc/shells  # Appends the new bash to the system's list
chsh -s /usr/local/bin/bash  # change shells 
```

NOTE: you will have to log out and log back in for the effect to take place.

* Run `brew install git`, and then clone this repo to your homefolder
* [Configure ssh fot git.](https://help.github.com/articles/generating-an-ssh-key/) Not totally necessary at the moment, but useful. This repo uses [base16](https://github.com/chriskempson/base16) as a submodule, and having git configured will smooth things out. NOTE: to personalize you'll want to edit the .dotfiles/git/gitconfig.symlink file
* Run `bash install.sh`.
  * `install.sh` will start by initializing the submodules used by this repository (base-16, etc.). 
  * Then, it will install all symbolic links into your home directory. Every file with a `.symlink` extension will be symlinked to the home directory with a `.` in front of it. As an example, `vimrc.symlink` will be symlinked in the home directory as `~/.vimrc`. 
  * Then, this script will create a `~/.vim-tmp` directory in your home directory, as this is where vim is configured to place its temporary files. 
  * Additionally, all files in the `$DOTFILES/config` directory will be symlinked to the `~/.config/` directory for applications that follow the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html), such as neovim.
  * Next, the install script will perform a check to see if it is running on an OSX machine. If so, it will install Homebrew if it is not currently installed and will install the homebrew packages listed in [`brew.sh`](install/brew.sh). Then, it will run [`osx.sh`](install/osx.sh) and change some OSX configurations. This file is pretty well documented and so it is advised that you __read through and comment out any changes you do not want__. 
*  You'll need to run `nvim +PlugInstall` to add the necessary plugins found in the vimrc

## ZSH Details 

ZSH is configured in the `zshrc.symlink` file, which will be symlinked to the home directory. The following occurs in this file:

* set the `EDITOR` to nvim
* Load any `~/.terminfo` setup
* Set the `CODE_DIR` variable, pointing to the location where the code projects exist for exclusive autocompletion with the `c` command
* Recursively search the `$DOTFILES/zsh` directory for files ending in .zsh and source them
* source a `~/.localrc` if it exists so that additional configurations can be made that won't be kept track of in this dotfiles repo. This is good for things like API keys, etc.
* Add the `~/bin` and `$DOTFILES/bin` directories to the path
* Setup NVM, RVM, and hub if they exist
* Set the base16 colorscheme to use for both the terminal (iTerm2) and vim/neovim by exporting the `$THEME` and `$BACKGROUND` environment variables
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

## Vim and Neovim Setup

[Neovim](https://neovim.io/) is a fork and drop-in replacement for vim. in most cases, you would not notice a difference between the two, other than Neovim allows plugins to run asynchronously so that they do not freeze the editor, which is the main reason I have switched over to it. Vim and Neovim both use Vimscript and most plugins will work in both (all of the plugins I use do work in both Vim and Neovim). For this reason, they share the same configuration files in this setup. Neovim uses the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html) which means it won't look for a `.vimrc` in your home directory. Instead, its configuration looks like the following:

|                         | Vim        | Neovim                    |
|-------------------------|------------|---------------------------|
| Main Configuratin File  | `~/.vimrc` | `~/.config/nvim/init.vim` |
| Configuration directory | `~/.vim`   | `~/.config/nvim`          |

### Installation

Vim is likely already installed on your system. If using a Mac, MacVim will be installed from Homebrew. Neovim will also be installed from Homebrew by default on a Mac. For other systems, you may need to install Neovim manually. See their [web site](https://neovim.io) for more information.

[`link.sh`](install/link.sh) will symlink the XDG configuration directory into your home directory and will then create symlinks for `.vimrc` and `.vim` over to the Neovim configuration so that Vim and Neovim will both be configured in the same way from the same files. The benefit of this configuration is that you only have to maintain a single vim configuration for both, so that if Neovim (which is still alpha software) has issues, you can very seamlessly transition back to vim with no big impact to your productivity.

Inside of [`.zshrc`](zsh/zshrc.symlink), the `EDITOR` shell variable is set to `nvim`, defaulting to Neovim for editor tasks, such as git commit messages. Additionally, I have aliased `vim` to `nvim` in [`aliases.zsh`](zsh/aliases.zsh) You can remove this if you would rather not alias the `vim` command to `nvim`.

vim and neovim should just work once the correct plugins are installed. To install the plugins, you will need to open Neovim in the following way:

```bash
nvim +PlugInstall
```
Or once in neovim run :PlugInstall

## Fonts

iterm2 supports ascii and non-ascii fonts, see the image below. nicknisi's original .dotfiles uses a nice developer-designed font called  [Operator Mono](http://www.typography.com/fonts/operator/styles/operatormonoscreensmart) for ascii characters. However, this font doesn't support Powerline or non-ascii characters. 

A great substitute is [FiraCode](https://github.com/tonsky/FiraCode). You'll want a font that supports italics. If you would prefer not to do this, then simply remove the `Plug 'ryanoasis/vim-devicons'` plugin from vim/nvim. Then, configure the fonts in this way in iTerm2. FiraCode italics will be supported in iTerm2 version 3.1

![](http://nicknisi.com/share/iterm-fonts-config.png)

## Anaconda

Homebrew and [Anaconda](https://www.continuum.io/downloads) sometimes can mess each other up with dependencies found the PATH. To avoid this my default shell in iterm2 is the updated bash, and whenever I want to use brew, I'll start zsh. But within zsh, anaconda can be activated by toggling it in the PATH with the con script.
