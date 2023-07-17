
PWD_PATH=$HOME/.config/zsh/plugins

for i ($PWD_PATH/*.zsh) {
    if [ $i != "$PWD_PATH/init.zsh" ]; then
        source $i
    fi
}

source $PWD_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PWD_PATH/pinyin-completion/shell/pinyin-comp.zsh
