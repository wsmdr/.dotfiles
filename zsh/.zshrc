
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


if [[ "$(uname -s)" == "Linux" ]];then
    export https_proxy=http://127.0.0.1:8888
    export http_proxy=http://127.0.0.1:8888
    export all_proxy=socks5://127.0.0.1:1088
else
    export https_proxy=http://127.0.0.1:6152
    export http_proxy=http://127.0.0.1:6152
    export all_proxy=socks5://127.0.0.1:6153
    export PATH=$HOME/.emacs.d/bin:$PATH

    alias vip="sudo ifconfig lo0 alias 10.200.10.1"
    export HOMEBREW_NO_AUTO_UPDATE=true
    export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

    if [[ "$(uname -m)" == "arm64" ]]; then
      export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
    fi  

    export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  
  if type brew &>/dev/null
  then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
  fi

fi

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# flutter
alias ls='lsd -h'  la='ls -la'  lt='ls --tree'  ll='ls -l'  l='ls'
export SSLKEYLOGFILE=$HOME/logs/sslkey.log

export PATH="/usr/local/sbin:$PATH"
