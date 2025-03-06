# -------------------------------
# Powerlevel10k
# -------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------
# Environment Setup: Homebrew & Pyenv
# -------------------------------
# Homebrew: Initialize shell environment & disable auto-update
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=1

# Pyenv: Setup Python environment
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"  # Initialize pyenv when a new shell spawns

# -------------------------------
# OH‑MY‑ZSH Setup
# -------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git gcloud z)
source "$ZSH/oh-my-zsh.sh"

if [ -f "$HOME/.zsh_aliases" ]; then
    source "$HOME/.zsh_aliases"
fi

# -------------------------------
# Source Powerlevel10k Configuration
# -------------------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# -------------------------------
# Git Completion & Compinit
# -------------------------------
zstyle ':completion:*:*:git:*' script "$HOME/.config/zsh/git-completion.bash"
fpath=("$HOME/.config/zsh" $fpath)
autoload -Uz compinit && compinit

# -------------------------------
# Google Cloud SDK
# -------------------------------
if [ -f '/Users/mhalisk/google-cloud-sdk/path.zsh.inc' ]; then 
  source '/Users/mhalisk/google-cloud-sdk/path.zsh.inc'
fi
if [ -f '/Users/mhalisk/google-cloud-sdk/completion.zsh.inc' ]; then 
  source '/Users/mhalisk/google-cloud-sdk/completion.zsh.inc'
fi

# -------------------------------
# Syntax Highlighting & Autosuggestions
# -------------------------------
# Use the brew-installed versions
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# Customize autosuggestion highlight style if desired
# Example: ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243"

# -------------------------------
# Postgres Path
# -------------------------------
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/14/bin"

# -------------------------------
# fzf Setup
# -------------------------------
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'  # Include hidden files
bindkey "ç" fzf-cd-widget  # Fix for ALT+C on Mac

# -------------------------------
# Utility Functions: fd & fh
# -------------------------------
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $(( [ -n "$ZSH_NAME" ] && fc -l 1 || history ) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# -------------------------------
# Tmux Auto-Attach (if applicable)
# -------------------------------
if which tmux >/dev/null 2>&1; then
  if [[ -z "$TMUX" && $TERM != "screen-256color" && $TERM != "screen" && -z "$VSCODE_INJECTION" && -z "$INSIDE_EMACS" && -z "$EMACS" && -z "$VIM" && -z "$INTELLIJ_ENVIRONMENT_READER" ]]; then
    tmux attach -t default || tmux new -s default
    # exit
  fi
fi

# -------------------------------
# zoxide Initialization
# -------------------------------
eval "$(zoxide init zsh)"

# -------------------------------
# Vi Mode & Cursor Customization
# -------------------------------
bindkey -v
export KEYTIMEOUT=1  # Makes switching modes quicker
export VI_MODE_SET_CURSOR=true

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[2 q'  # block
  else
    echo -ne '\e[6 q'  # beam
  fi
}
zle -N zle-keymap-select

function zle-line-init {
  zle -K viins  # initiate 'vi insert' as keymap
  echo -ne '\e[6 q'
}
zle -N zle-line-init
echo -ne '\e[6 q'  # Use beam shape cursor on startup

# -------------------------------
# Yank to System Clipboard Customization
# -------------------------------
function vi-yank-xclip {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy -i
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip