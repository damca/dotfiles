#!/bin/sh

echo -e "\n\nInstalling apt packages..."
echo "=============================="

sudo apt update
sudo apt upgrade

# cli tools
sudo apt install ack tree curl man-db manpages

# development server setup
sudo apt install nginx dnsmasq dnsutils ftp vsftpd nmap

# development tools
sudo apt install git zsh python python3 python3-venv

# get image processing tools, most of these are for the python imagecodecs package
sudo apt-get install build-essential python3-dev cython3 python3-setuptools python3-pip python3-wheel python3-numpy python3-pytest python3-blosc python3-brotli python3-snappy python3-lz4 libz-dev libblosc-dev liblzma-dev liblz4-dev libzstd-dev libpng-dev libwebp-dev libbz2-dev libopenjp2-7-dev libjpeg-dev libjxr-dev liblcms2-dev libcharls-dev libaec-dev libbrotli-dev libsnappy-dev libzopfli-dev libgif-dev libtiff-dev qt5-default

# python environments
mkdir ~/venvs
python3 -m venv ~/venvs/base
source ~/venvs/base/bin/activate
pip install --upgrade pip setuptools
pip install wheel numpy pandas matplotlib imagecodecs tifffile scikit-image ipython
deactivate
python3 -m venv ~/venvs/web
source ~/venvs/web/bin/activate
pip install wheel pandas plotly dash
deactivate

# install neovim
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xvzf nvim-linux64.tar.gz
sudo cp -rf nvim-linux64/* /usr/local
rm -rf nvim-linux64
rm -rf nvim-linux64.tar.gz

# base16-shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Download zsh autocomplete scripts
(cd $ZSH && curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash)
(cd $ZSH && curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh)

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


exit 0
