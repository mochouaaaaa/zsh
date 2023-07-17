zinit light Aloxaf/fzf-tab
zinit light Freed-Wu/fzf-tab-source

# 窗口的大小和位置
export FZF_DEFAULT_OPTS="--height=60% --layout=reverse --info=inline --border --margin=1 --padding=1"
# CTRL-T
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
# CLT-C
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# 预览窗口上的完整命令
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# ctrl-x + ctrl+r 得到的命令直接运行
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle -N fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

# 窗口位置
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# bat集成
# fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
# fzf --preview 'bat --color=always {}' --preview-window '~3'

# # disable sort when completing options of any command
# zstyle ':completion:complete:*:options' sort false
# # use input as query string when completing zlua
# zstyle ':fzf-tab:complete:_zlua:*' query-string input
# # disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# # set descriptions format to enable group support
# zstyle ':completion:*:descriptions' format '[%d]'
# # set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # preview directory's content with exa when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# # switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[ $group == "[process ID]" ] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:*:options' fzf-flags --preview-window=down:0:wrap

# 显示系统设备状态
# zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# environment variable 环境变量
# zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'

# git
# it is an example. you can change it
# zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
# 	'git diff $word | delta'
# zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
# 	'git log --color=always $word'
# zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
# 	'git help $word | bat -plman --color=always'
# zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
# 	'case "$group" in
# 	"commit tag") git show --color=always $word ;;
# 	*) git show --color=always $word | delta ;;
# 	esac'
# zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
# 	'case "$group" in
# 	"modified file") git diff $word | delta ;;
# 	"recent commit object name") git show --color=always $word | delta ;;
# 	*) git log --color=always $word ;;
# 	esac'

# Homebrew
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'

# Commands
zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
  ¦ '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'

# tldr
# zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'
#
#popup-min-size
# apply to all command
zstyle ':fzf-tab:*' popup-min-size 50 8
# only apply to 'diff'
zstyle ':fzf-tab:complete:diff:*' popup-min-size 80 12
