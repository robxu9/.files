# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# Golang
export PATH=$PATH:$HOME/Installations/go/bin
export GOROOT=$HOME/Installations/go
export GOPATH=$HOME/Documents/goworkspaces/common

# load vim correctly (stares at git)
export EDITOR=vim

# android-studio
export PATH=$PATH:$HOME/Installations/android-studio/sdk/tools
export PATH=$PATH:$HOME/Installations/android-studio/sdk/platform-tools

export ANDROID_HOME=$HOME/Installations/android-studio/sdk
export ANDROID_SDK=$ANDROID_HOME
export ANDROID_TOOLS=$ANDROID_HOME/tools

# some visualisation:
#return value visualisation
export PS1="\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) \[\e[2;35m\]`date +%T`\[\e[m\] \[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] "
