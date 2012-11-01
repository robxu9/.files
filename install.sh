#!/bin/sh
#
# Install dotfiles to home directory and create relevant directories.
# Backs up existing dotfiles just in case.
#

for dotfile in `ls -1 .*`; do
	cp -v $HOME/$dotfile $HOME/$dotfile.backup
	cp -fv $dotfile $HOME/$dotfile
done

mkdir -pv $HOME/PATH/{bin,etc,include,lib,lib64,libexec,share,src}
