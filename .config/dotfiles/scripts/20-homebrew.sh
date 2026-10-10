#!/usr/bin/env bash
# Install Homebrew. The shell environment is set up by ~/.config/zsh/.zprofile.
set -euo pipefail
# shellcheck source=../lib/helpers.sh
. "${DOTFILES_DIR:-$HOME/.config/dotfiles}/lib/helpers.sh"
require_macos

load_brew
if have brew; then
  skip "Homebrew already installed ($(brew --prefix))"
else
  log "Installing Homebrew"
  if [ "$DRY_RUN" = "1" ]; then
    skip "would download and run the Homebrew installer"
  else
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    load_brew
  fi
fi
if have brew; then
  run brew analytics off
  run brew update --quiet
fi
ok "Homebrew ready"
