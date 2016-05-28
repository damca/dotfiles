# Dotfiles

Welcome to my world. This is a collection of vim, tmux, and zsh configurations. Interested in a video walkthrough of the dotfiles? Check out my talk, [vim + tmux](https://www.youtube.com/watch?v=5r6yzFEXajQ).

## Contents

+ [pre install](#pre-install)
+ [install.sh](#install.sh)
+ [post install](#post-install)
+ [ZSH Details](#zsh-details)
+ [Vim and Neovim Setup](#vim-and-neovim-setup)
+ [Fonts](#fonts)
+ [Tmux](#tmux-configuration)

## pre install
### Get XCode CLI tools

If on OSX, you will need to install the XCode CLI tools before continuing. To do so, open a terminal and type

```bash
xcode-select --install
```

### Get a new version of BASH/ZSH
Make sure to use an updated version of bash or zsh when running the subsequent `install.sh`. The following bash install segment is from: https://johndjameson.com/blog/updating-your-shell-with-homebrew/

Installing bash via Homebrew – To get things started, you need to tell Homebrew to install the latest version of your shell. Whether you prefer using Bash or Zsh, the following instructions will work for both. Just change the word bash to zsh, and you’ll be good to go.
Open your terminal and enter this command:
`brew install bash`
Homebrew installs packages to /usr/local/bin/, so you’ll need to specify that path when looking for any Homebrew packages. In the following three commands, we’ll initiate a shell as the root user, append our desired shell’s path to a file of whitelisted system shells, and then change the system shell globally.
```sudo -s
echo /usr/local/bin/bash >> /etc/shells
chsh -s /usr/local/bin/bash
```

NOTE: I had to log out and login for the effects to take place.

Now you can close and reopen your terminal. With just those few commands, you should be using with the latest version of your shell. You can double-check the version you’re using with the command echo $BASH_VERSION. Or, if you’ve installed Zsh, you can use the command echo $ZSH_VERSION to do the same.
That’s it for installing your brand-new shell. Let’s take a look at how to keep it up-to-date with the help of Homebrew.

Staying current – The Homebrew command update actually refers to updating Homebrew itself. If you want to install the latest version of a Homebrew package, you’ll have to use the word upgrade instead:
`brew upgrade bash`
In this example, Homebrew will look for the package named bash on your computer and install the latest version. If you already have the newest version installed, Homebrew will print an error message telling you exactly that. You’ll have to run this command manually from time to time, but it’s a much more reliable approach than downloading directly from source or maintaining a cloned version control repository.
Now go out and write shell scripts for all the things.

### Configure git

Download git and configure, in particular see: https://help.github.com/articles/set-up-git/. You will need this for the [prompt](#Prompt) and to clone into the base16 repo (found in .dotfiles/.config, you need to have an ssh set up with git.

NOTE: to personalize you'll want to edit the .dotfiles/git/gitconfig.symlink file

## install.sh

Clone the dotfiles repository to your computer. This can be placed anywhere, and symbolic links will be created to reference it from your home directory.

```bash
git clone https://github.com/nicknisi/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

* `install.sh` will start by initializing the submodules used by this repository (base-16, etc.). 
* Then, it will install all symbolic links into your home directory. Every file with a `.symlink` extension will be symlinked to the home directory with a `.` in front of it. As an example, `vimrc.symlink` will be symlinked in the home directory as `~/.vimrc`. 
* Then, this script will create a `~/.vim-tmp` directory in your home directory, as this is where vim is configured to place its temporary files. 
* Additionally, all files in the `$DOTFILES/config` directory will be symlinked to the `~/.config/` directory for applications that follow the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html), such as neovim.
* Next, the install script will perform a check to see if it is running on an OSX machine. If so, it will install Homebrew if it is not currently installed and will install the homebrew packages listed in [`brew.sh`](install/brew.sh). Then, it will run [`osx.sh`](install/osx.sh) and change some OSX configurations. This file is pretty well documented and so it is advised that you __read through and comment out any changes you do not want__. 
* Next, the script will call [`install/nvm.sh`](install/nvm.sh) to install Node.js (stable) using nvm.

## post install

You'll need to run the following to install neovim plugins, see the section [below](#Vim-and-Neovim-Setup)
```
nvim +PlugInstall
```

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
* note: I commented out the:[ -z "$TMUX" ] && export TERM=xterm-256color-italic, since I don't want to deal with italics for the time being. 


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

I am currently using [Operator Mono](http://www.typography.com/fonts/operator/styles/operatormonoscreensmart) as my default font, which does not include Powerline support. In addition to this, I do have [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) installed and configured to be used for non-ascii characters. 

From the nerd-fonts page, you can download the Droid Powerline font with: `cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf`, install it by double clicking.

If you would prefer not to do this, then simply remove the `Plug 'ryanoasis/vim-devicons'` plugin from vim/nvim. Then, I configure the fonts in this way in iTerm2:


![](http://nicknisi.com/share/iterm-fonts-config.png)

## Tmux Configuration

*TODO: Documentation coming soon.*
