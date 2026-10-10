# Environment. Machine settings come from ~/.config/dotfiles/profile.local (not tracked).
export DOTFILES_DIR="$HOME/.config/dotfiles"
if [[ -f "$DOTFILES_DIR/profile.local" ]]; then
  set -a; source "$DOTFILES_DIR/profile.local"; set +a
fi

typeset -U path PATH
path=("$HOME/.local/bin" $path)

# Main editor: code (default) or nvim. Switch with: dot-editor nvim
export MAIN_EDITOR="${MAIN_EDITOR:-code}"
case "$MAIN_EDITOR" in
  nvim) export EDITOR="nvim" VISUAL="nvim" ;;
  *)    export EDITOR="code --wait" VISUAL="code --wait" ;;
esac

# Prompt: nerd (icons) or ascii. A bare Linux console cannot show icons.
if [[ "${PROMPT_STYLE:-nerd}" == "ascii" || "$TERM" == "linux" ]]; then
  export STARSHIP_CONFIG="$HOME/.config/starship-ascii.toml"
else
  export STARSHIP_CONFIG="$HOME/.config/starship.toml"
fi

export HOMEBREW_NO_ANALYTICS=1
export BAT_THEME="ansi"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
