#!/bin/sh
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

mkdir -pv $HOME/PATH/{bin,etc,gopath,include,lib,lib64,libexec,share,src}

if [ "$1" != "NO" ]; then
	hg clone https://code.google.com/p/go $HOME/PATH/goroot
	$HOME/PATH/goroot/src/all.bash
else
	path=http://go.googlecode.com/files/go1.0.3.linux-amd64.tar.gz
	if [ "`uname -i`" == "i386" ]; then
		path=http://go.googlecode.com/files/go1.0.3.linux-386.tar.gz
	fi
	pushd $HOME/PATH
		curl $path | tar zx
		mv go goroot
	popd
fi

mkdir -pv $HOME/PATH/gopath/{bin,pkg,src}
