## https://github.com/Aloxaf/dotfiles/blob/master/zsh/.config/zsh/zshrc.zsh

# p10k instant prompt
# 可取代 zplugin turbo mode
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi


typeset -A ZINIT=(
    BIN_DIR         $ZDOTDIR/zinit/bin
    HOME_DIR        $ZDOTDIR/zinit
    COMPINIT_OPTS   -C
)

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/z-shell/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# ===== 函数 ====
FPATH=$ZINIT_DIR/zsh/functions:$ZINIT_DIR/zsh/completions:$FPATH
autoload -Uz rgzh rgsrc rgdata rgdoc pslist ebindkey expand_alias palette printc oomscore pb
autoload +X zman
autoload -Uz zcalc zmv zargs



ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_COMPLETION_IGNORE='( |man |pikaur -S )*'

GENCOMP_DIR=$ZINIT_DIR/zsh/completions


forgit_add=gai
forgit_diff=gdi
forgit_log=glgi

export _ZL_DATA=$ZDOTDIR/.z

export AGV_EDITOR='kwrite -l $line -c $col $file'

local extract="
# trim input
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"
zstyle ':fzf-tab:*' single-group ''
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always $realpath'

# ==== 加载插件 ====

zinit light-mode for \
    hlissner/zsh-autopair \
    skywind3000/z.lua \
    hchbaw/zce.zsh \
    Aloxaf/gencomp \
    wfxr/forgit

zinit light-mode for \
    blockf \
        zsh-users/zsh-completions \
    as="program" atclone="rm -f ^(rgg|agv)" \
        lilydjwg/search-and-view \
    atclone="dircolors -b LS_COLORS > c.zsh" atpull='%atclone' pick='c.zsh' \
        trapd00r/LS_COLORS

# agkozak/zsh-z \
# b4b4r07/enhancd \
zinit light Aloxaf/fzf-tab

zinit for \
    OMZ::lib/clipboard.zsh \
    OMZ::lib/completion.zsh \
    OMZ::lib/directories.zsh \
    OMZ::lib/git.zsh \
    OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
    OMZ::plugins/git-extras/git-extras.plugin.zsh \
    OMZ::plugins/systemd/systemd.plugin.zsh \
    OMZ::plugins/sudo/sudo.plugin.zsh \
    OMZ::plugins/history/history.plugin.zsh \
    OMZ::plugins/golang/golang.plugin.zsh \
    OMZ::plugins/pip/pip.plugin.zsh \
    OMZ::plugins/extract/extract.plugin.zsh \
    OMZ::plugins/encode64/encode64.plugin.zsh \
    OMZ::plugins/docker-compose/docker-compose.plugin.zsh \
    OMZ::plugins/git/git.plugin.zsh

zinit ice mv=":cht.sh -> cht.sh" atclone="chmod +x cht.sh" as="program"
zinit snippet https://cht.sh/:cht.sh

zinit ice mv=":zsh -> _cht" as="completion"
zinit snippet https://cheat.sh/:zsh


zinit as="completion" for \
    OMZ::plugins/extract/_extract \
    OMZ::plugins/fd/_fd \
    OMZ::plugins/docker/_docker \
    OMZ::plugins/docker-compose/_docker-compose \
    OMZ::plugins/pip/_pip 


zpcompinit; zpcdreplay

for i in $ZINIT_DIR/zsh/snippets/*.zsh; do
    source $i
done

zinit light-mode for \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions


## theme
zinit ice depth=1
zinit light romkatv/powerlevel10k    
