# Dotfiles

## Contents

+ [Install](#Install)
+ [Terminal](#Terminal)
+ [Shell](#Shell)
+ [Editor](#Editor)
+ [Keeping Parallel Branches](#keeping-parallel-branches)

## Install

```
cd ~
git clone https://github.com/damca/dotfiles
mv dotfiles .dotfiles
bash .dotfiles/install.sh
```


## Terminal

  * `MacOS`: Terminal.app, see terminal folder for some beautiful color schemes
    * Using [vbwx's base16-builder](https://github.com/vbwx/base16-builder-php) will generate Terminal.app profiles for each base16 scheme. Make sure to use the non-256-color profiles since the Terminal.app doesn't really support xterm-256-color.
  * `Linux`: Gnome is great
    * [base16-shell](https://github.com/chriskempson/base16-shell)
  * `Windows`: Windows Terminal


## Shell

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


#### Prompt

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

## Editor

[Neovim](https://neovim.io/) is a fork and drop-in replacement for vim. In most cases, you would not notice a difference between the two, other than Neovim allows plugins to run asynchronously so that they do not freeze the editor, which is the main reason I have switched over to it. Vim and Neovim both use Vimscript and most plugins will work in both (all of the plugins I use do work in both Vim and Neovim). For this reason, they share the same configuration files in this setup. Neovim uses the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html) which means it won't look for a `.vimrc` in your home directory. Instead, its configuration looks like the following:

|                         | Vim        | Neovim                    |
|-------------------------|------------|---------------------------|
| Main Configuratin File  | `~/.vimrc` | `~/.config/nvim/init.vim` |
| Configuration directory | `~/.vim`   | `~/.config/nvim`          |


### Neovim setup

Vim is likely already installed on your system. If using a Mac, MacVim will be installed from Homebrew. Neovim will also be installed from the `install.sh`. For other systems, you may need to install Neovim manually. See their [web site](https://neovim.io) for more information.

[`link.sh`](install/link.sh) will symlink the XDG configuration directory into your home directory and will then create symlinks for `.vimrc` and `.vim` over to the Neovim configuration so that Vim and Neovim will both be configured in the same way from the same files. The benefit of this configuration is that you only have to maintain a single vim configuration for both, so that if Neovim (which is still alpha software) has issues, you can very seamlessly transition back to vim with no big impact to your productivity.

Inside of [`.zshrc`](zsh/zshrc.symlink), the `EDITOR` shell variable is set to `nvim`, defaulting to Neovim for editor tasks, such as git commit messages. Additionally, I have aliased `vim` to `nvim` in [`aliases.zsh`](zsh/aliases.zsh) You can remove this if you would rather not alias the `vim` command to `nvim`.

vim and neovim should just work once the correct plugins are installed. To install the plugins, you will need to open Neovim in the following way:

Or once in neovim run :PlugInstall

## Fonts

* [Operator Mono](https://www.typography.com/fonts/operator/styles) is great, I enjoy it a lot. But it lacks extensive unicode support.

## Keeping Parallel Branches

This repo is organized into three parallel branches - master (MacOS), linux, and windows. And is meant to provide a similar work environment across the three systems.

Useful snippets for maintaining parallel branches:
    ```
    # Pull file from another branch
    $ git checkout master
    $ git checkout feature-branch -- src/js/some-file.js
    # The tree is now dirty
    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

          new file:   src/js/some-file.js

          # Then commit in normal fashion
          $ git commit -m "Get a file from the feature branch"
    ```

[StackOverflow Tip](https://stackoverflow.com/a/24978991)
The idea is you use one common branch, and two (or as many as you need) customer specific branches. All common changes go into the master, and each customer branch gets changes that pertain only to that customer. Periodically (when master is considered to be at a stable point), you'll merge changes from master into the customer branch (`git checkout custA; git merge master`). This brings in newer "common" code into the customer branch. You will never merge the other way -- that would pollute master with customer-specific code.

When you make a delivery to customer A, you checkout the "custA" branch and send that. And of course similarly for other customers.

Now let's say you acquire a new customer, "C", and a bit later find a feature that customers A and C want, but B doesn't. You create (aka "fork") a branch off of master (`git checkout -b AC_feature master`), code/test it, making commits as you go, and then merge it into A and C (`git checkout A; git merge AC_feature and similarly for customer C`). You do not code it in A and then rely on merging A into C, because that would get all of A into C.

If, sometime later, you find a minor bug in that feature, you make the change in the same branch (`git checkout AC_feature; edit/test/commit`), and then you merge it into custA and custC as above.

