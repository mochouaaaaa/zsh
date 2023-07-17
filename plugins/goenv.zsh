 # goenv
export GOPATH=/Volumes/Code/Projects/golang
export PATH="$PATH:$GOPATH"
export GOPROXY=https://goproxy.cn,direct
export GOSUMDB=sum.golang.google.cn

export GOENV_DISABLE_GOPATH=1
export GOENV_ROOT="/Volumes/Code/tools/.goenv"
# export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
