# zsh Options
setopt HIST_IGNORE_ALL_DUPS

# Custom zsh
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"

# Backup
# [ -f "$HOME/.config/zsh/backup.zshrc" ] && source "$HOME/.config/zsh/backup.zshrc"

# Aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

# Work
[ -f "$HOME/.config/zsh/work.zsh" ] && source "$HOME/.config/zsh/work.zsh"

# Halo
[ -f "$HOME/.config/halo/config.sh" ] && source "$HOME/.config/halo/config.sh"