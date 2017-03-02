# Document preparation
brew cask install basictex

# Example install of package
sudo tlmgr install natbib 
sudo tlmgr install collection-fontsrecommended collection-fontsextra
# If using Lyx. Tools -> reconfigure

# Note installs at /usr/local/texlive
sudo tlmgr install nature preprint biblatex biblatex-nature

sudo tlmgr install etex biber etoolbox oberdiek logreq xstring babel csquotes xpatch -v
