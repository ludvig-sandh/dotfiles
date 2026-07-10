# Set up the prompt

# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# dircolors is GNU coreutils; not present on macOS unless installed via
# `brew install coreutils` (as gdircolors, since brew doesn't shadow the
# BSD tools by default).
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
elif command -v gdircolors >/dev/null 2>&1; then
  eval "$(gdircolors -b)"
fi
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ll="ls -lah"
alias c="clear"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias n="nvim"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Plugin install locations differ by OS/package manager: apt puts them
# under /usr/share, Homebrew under $HOMEBREW_PREFIX/share (/opt/homebrew
# on Apple Silicon, /usr/local on Intel Macs).
for _zsh_plugin_root in "$HOMEBREW_PREFIX/share" /opt/homebrew/share /usr/local/share /usr/share; do
  if [ -f "$_zsh_plugin_root/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$_zsh_plugin_root/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$_zsh_plugin_root/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    break
  fi
done
unset _zsh_plugin_root
bindkey '^f' autosuggest-accept

eval "$(starship init zsh)"
