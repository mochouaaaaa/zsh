

# pyenv
export PYENV_ROOT="/Volumes/Code/tools/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
