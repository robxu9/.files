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
    [ "`uname -i`" == "x86_64" ] && arch="amd64" || arch="386"
	pushd $HOME/Installations
		curl https://go.googlecode.com/files/go1.2.1.linux-$arch.tar.gz | tar zx
	popd
fi

git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

source $HOME/.bash_profile
