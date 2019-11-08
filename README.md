# Configuration de vi
Je vous recommande ce lien pour parameterer correctement :<br />
https://realpython.com/vim-and-python-a-match-made-in-heaven/

# Attention
Ce script écrase par dessus la config de vi sur la machine<br />
<br />
Donc si vous avez déjà un .vimrc ATTENTION<br />
<br />
Pour putty depuis windows, il faut:
- Télécharger la font sur https://github.com/powerline/fonts/tree/master/DejaVuSansMono (ou autre ../)<br />
- La configurer dans putty<br />
<br />

# Utilisation
````
su
apt install curl
apt install python-pip
apt install python3-pip
apt-get remove vim-tiny
apt-get update
apt-get install vim
apt-get install vim-nox
apt-get install exuberant-ctags
apt-get install powerline
apt-get install fonts-powerline
apt install build-essential cmake python3-dev (or other https://github.com/ycm-core/YouCompleteMe#mac-os-x-super-quick-installation)
exit

vi
:python3 import sys; print(sys.version)
(pour vérifier si python est installé)

cd ~/
vi .bashrc
G (pour aller en fin de ligne)
o (pour insérer dessous)
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
        source /usr/share/powerline/bindings/bash/powerline.sh
fi
:wq (pour quitter et sauver)
mkdir download
cd download
git clone https://github.com/stephaneworkspace/vi.git
cd vi
chmod 700 run.sh
./run.sh
vi
:PluginInstall
:VundleInstall (aleternative a :PluginInstall une fois Vundle installé)
:q
````
et ensuite
````
~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer
python3 install.py --all

````
Pour debian et ubuntu desktop, mettre le dossier .vim/bundle dans vim/bundle et changer le .vimrc pour qu'il pointe vers vim et nom pas .vim
