# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/PATH/bin:$HOME/PATH/gopath/bin:$HOME/PATH/goroot/bin:$PATH
GOROOT=$HOME/PATH/goroot
GOPATH=$HOME/PATH/gopath

export PATH
export GOROOT
export GOPATH
