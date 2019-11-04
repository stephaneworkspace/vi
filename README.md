# Configuration de vi
Je vous recommande ce lien pour parameterer correctement :<br />
https://realpython.com/vim-and-python-a-match-made-in-heaven/

# Attention
Ce script écrase par dessus la config de vi sur la machine<br />
<br />
donc si vous avez déjà un .vimrc ATTENTION

# Utilisation
````
su
apt-get remove vim-tiny
apt-get update
apt-get install vim
apt-get install vim-nox
apt-get install exuberant-ctags
apt-get install powerline
apt install build-essential cmake python3-dev (or other https://github.com/ycm-core/YouCompleteMe#mac-os-x-super-quick-installation)
exit

vi
:python import sys; print(sys.version)
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
chmod 777 run.sh
./run.sh
vi
:PluginInstall
:VundleInstall (peut être après plugin install, je changerai, j'ai toujours utilisé celui ci)
:q
````
