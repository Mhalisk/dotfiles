
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git gcloud z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# Aliases
if [ -f $HOME/.zsh_aliases ]; then
    source $HOME/.zsh_aliases
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionn

#Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/14/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mhalisk/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mhalisk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mhalisk/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mhalisk/google-cloud-sdk/completion.zsh.inc'; fi
source /Users/mhalisk/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /Users/mhalisk/.config/halo/config.sh
