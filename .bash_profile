# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.secrets ]; then
    . ~/.secrets
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# Golang
export PATH=$PATH:$HOME/Installations/go/bin
export GOROOT=$HOME/Installations/go
export GOPATH=$HOME/Installations/GOPATH
export PATH=$PATH:$GOPATH/bin

# load vim correctly (stares at git)
export EDITOR=vim

# android-studio
export PATH=$PATH:$HOME/Installations/android-studio/sdk/tools
export PATH=$PATH:$HOME/Installations/android-studio/sdk/platform-tools

export ANDROID_HOME=$HOME/Installations/android-studio/sdk
export ANDROID_SDK=$ANDROID_HOME
export ANDROID_TOOLS=$ANDROID_HOME/tools

