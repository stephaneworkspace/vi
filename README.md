# Installation
<br />
Vérifier que python a un +<br />
````
vim --version
````
Installaer vim<br />
````
brew update
brew install vim
brew install ctags
brew install cmake
````

Installer .vimrc
````
./run.sh
````

Ensuite

````
vi
:PluginInstall
:q
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
# ./install.py --all
````
