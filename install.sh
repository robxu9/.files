#!/bin/bash
#
# Install dotfiles to home directory and create relevant directories.
# Backs up existing dotfiles just in case.
#

if [ "$1" != "NO" ]; then

	echo "Note: This *will* build a checkout of Go."
	echo "If you don't want this to happen, pass NO to this script."
	sleep 5

fi

for dotfile in `ls -A1 | egrep '^\.'`; do
	if [ -f $HOME/$dotfile ]; then
		cp -v $HOME/$dotfile $HOME/$dotfile.backup
	fi
	cp -fv $dotfile $HOME/$dotfile
done

mkdir -pv $HOME/{bin,Installations}/
mkdir -pv $HOME/Installations/GOPATH/{bin,pkg,src}
mkdir -pv $HOME/.local/{bin,etc,include,lib,lib64,libexec,share,src}

if [ "$1" != "NO" ]; then
	hg clone -u release https://code.google.com/p/go $HOME/Installations/go
	$HOME/PATH/go/src/all.bash
else
	path=https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz
	if [ "`uname -i`" == "i*86" ]; then
		path=https://go.googlecode.com/files/go1.2.1.linux-386.tar.gz
	fi
	pushd $HOME/Installations
		curl $path | tar zx
	popd
fi

git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

source $HOME/.bash_profile
