# Installation
<br />
Vérifier que python a un +
````
vim --version
`````
Installater vim
````
brew update
brew install vim
brew install ctags
brew install cmake
pip3 install powerline-status
pip3 show powerline-status
pip3 install --user flake8
vim ~/.bash_profile
# Paste this code into your .bash_profile

Avant d'aller plus loin je me rappel avoir cp /Users/stephanebressani/Library/Python/3.7/lib/python/site-packages/powerline/config_files/  ~/.config/powerline

ensuite dans l'un ou l'autre il faut aller dans config.json ext.shell-theme -> default to default_left_only pour l'intégration des branches de git

# Powerline
export PATH="$PATH:/Users/stephanebressani/Library/Python/3.7/lib/python/site-packages/scripts"
export PATH="$PATH:/Users/stephanebressani/Library/Python/3.7/bin/"
export PATH="$PATH:/Users/stephanebressani/Library/Python/3.7/lib/python/site-packages/powerline/config_files"

powerline-daemon -k # -q like the doc is will crash
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /Users/stephanebressani/Library/Python/3.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh
````

https://gist.github.com/wm/4750511

Ensuite :
````
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
````
Ensuite copier (vers la ligne 90 et quelque changer py3 en py selon la version de macOs) le fichier .vimrc dans files de ce repos<br />
<br />
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
python3 -m pip install powerline-status

Aller dans un répertoire:
git clone https://github.com/gnachman/iTerm2
# ATTENTION VIEUX IMAC HIGH SIERRA X CODE QUELQUE CHOSE COMME 10.1 prendre la release 3.2.8
start XCode
open the iTerm.xcodeproj
Click Run

It will build and launch iTerm. Then copy the app to /Applications. It will be something like:

mv /Users/wmernagh/Library/Developer/Xcode/DerivedData/iTerm-dmqofiayvqouzqakzaudepvpnfgb/Build/Products/Development/iTerm.app /Applications

lancer ITerm2 et aller dans preferance et choisir une font
````
vi
:PluginInstall
:q
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
./install.py --all
````
