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
* [x] Installer les apt debian
```
su
./run_sudo_before_run_sh.sh
exit
```
* [x] Vérification que python3 est installé
vi
:python3 import sys; print(sys.version)
(pour vérifier si python est installé)
```
* [x] Configurer bash
```
vi ~/.bashrc

export EDITOR='vi'
set -o vi # For vi mode in bash

# Powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
        source /usr/share/powerline/bindings/bash/powerline.sh
fi

# Neofetch
neofetch
```
* [x] Effacer ce repertoire (de config de vi) et lancer la configuration
```
./run.sh
```
* [x] Installer les Vundle
vi
:PluginInstall
:VundleInstall (aleternative a :PluginInstall une fois Vundle installé)
```
* [x] Configurer YouCompleteMe
```
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer
python3 install.py --all
```
Pour debian et ubuntu desktop, mettre le dossier .vim/bundle dans vim/bundle et changer le .vimrc pour qu'il pointe vers vim et nom pas .vim
