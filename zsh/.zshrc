export ZINIT_DIR=$HOME/.dotfiles
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$ZINIT_DIR/zsh

# module_path+=( "$ZDOTDIR/zinit/bin/zmodules/Src" )
# zmodload zdharma/zinit

source $ZDOTDIR/zshrc.zsh


export operation_system=

# 启用 Go Modules 功能
export GO111MODULE=on
# 配置 GOPROXY 环境变量
export GOPROXY=https://goproxy.io

export GOPATH=$HOME/gopath
export GOBIN=$GOPATH/bin

export PATH=/usr/local/go/bin:GOBIN:$PATH

if [[ "$(uname -s)" == "Linux" ]];then
    export https_proxy=http://127.0.0.1:8888
    export http_proxy=http://127.0.0.1:8888
    export all_proxy=socks5://127.0.0.1:1088
else
    export https_proxy=http://127.0.0.1:6152
    export http_proxy=http://127.0.0.1:6152
    export all_proxy=socks5://127.0.0.1:6153
fi




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet