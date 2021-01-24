#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]] || [[ "$OSTYPE" == "linux-gnueabihf" ]]; then

	sudo apt purge vim
	sudo add-apt-repository ppa:jonathonf/vim
	sudo apt-get update
	sudo apt-get install vim

	ln -sf $(realpath .vim) ~/.vim
	ln -sf $(realpath .vimrc) ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone https://github.com/michalbachowski/vim-wombat256mod.git ~/.vim/bundle/vim-wombat256mod

elif [[ "$OSTYPE" == "darwin"* ]]; then

	brew uninstall macvim
	brew unlink vim
	brew unlink macvim

	rm -f $HOME/.vimrc
	rm -rf $HOME/.vim

    brew update
    brew upgrade
	brew install macvim
	brew link macvim

	ln -s $PWD/.vim $HOME/.vim
	ln -s $PWD/.vimrc $HOME/.vimrc

    sudo pip3 install jedi
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

fi
