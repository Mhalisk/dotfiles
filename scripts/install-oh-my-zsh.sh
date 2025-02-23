install_ohmyzsh() {
  info "Checking for Oh My Zsh..."
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
      info "Installing Oh My Zsh..."
      RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
      warning "Oh My Zsh already installed."
  fi
}

install_ohmyzsh