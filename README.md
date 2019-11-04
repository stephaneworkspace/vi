# Configuration de vi
Pour le moment je ne recommande pas l'utilisation de ce repository

Car pour le moment je ne l'ai pas encore installé sur plein de shell

Au fur et à mesure je metterai à jour !

Je vous recommande ce lien pour parameterer correctement vi :
https://realpython.com/vim-and-python-a-match-made-in-heaven/

# Attention
Ce script écrase par dessus la config de vi sur la machine

donc si vous avez déjà un .vimrc ATTENTION

# Utilisation
su
apt-get remove vim-tiny
apt-get update
apt-get install vim
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
