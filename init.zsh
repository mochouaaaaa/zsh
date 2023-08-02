
autoload -U compaudit compinit
autoload -U compinit && compinit


PWD_PATH=$HOME/.config/zsh
PLUGIN_PATH=$PWD_PATH/plugins

for i ($PLUGIN_PATH/*.zsh) {
    #if [ $i != "$PWD_PATH/init.zsh" ]; then
        source $i
    #fi
}

source $PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGIN_PATH/pinyin-completion/shell/pinyin-comp.zsh
