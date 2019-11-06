#!/bin/bash
# Configure vi
# Author: Stéphane Bressani <s.bressani@bluewin.ch>
cd files
mv .vimrc ~/.vimrc
cd ..
cd ..
rm -rf vi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
python3 -m pip install powerline-status
python3 -m pip install --user flake8
