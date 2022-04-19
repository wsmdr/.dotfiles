export PATH="${PATH}:${HOME}/.local/bin"


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
export GOPROXY=https://goproxy.cn,direct

export GOPATH=$HOME/gopath
export GOBIN=$GOPATH/bin

export PATH=/usr/local/go/bin:$GOBIN:$PATH

if [[ "$(uname -s)" == "Linux" ]];then
    export https_proxy=http://127.0.0.1:8888
    export http_proxy=http://127.0.0.1:8888
    export all_proxy=socks5://127.0.0.1:1088
else
    export PATH=/opt/homebrew/bin:$PATH
    export https_proxy=http://127.0.0.1:6152
    export http_proxy=http://127.0.0.1:6152
    export all_proxy=socks5://127.0.0.1:6153

    alias vip="sudo ifconfig lo0 alias 10.200.10.1"
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
    export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
    export PATH="/opt/homebrew/sbin:$PATH"
    export HOMEBREW_NO_AUTO_UPDATE=true

    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH=$HOME/development/flutter/bin:$PATH
export no_proxy="localhost,127.0.0.1"
export PATH=$HOME/Library/Android/sdk/tools/bin:$PATH



