# Homebrew
BREW_PREFIX="/opt/homebrew"
export PATH="$BREW_PREFIX/bin:$PATH"

# alias
alias ..="cd .."
alias l="eza -lagB --group-directories-first -F --icons -h --git"
alias ls="eza --group-directories-first -F --icons"
alias ll="eza -l --group-directories-first -F --icons -h --git"
alias lt="eza --tree --git-ignore"
alias lla="eza -la --group-directories-first -F --icons -h --git"

alias v="nvim"
alias t="tmux"
alias lg="lazygit"
alias e="exit"

alias g="git"

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# zsh plugins

# vim mode
ZVM_VI_INSERT_ESCAPE_BINDKEY="jk"
ZVM_INIT_MODE=sourcing # Do the initialization when the script is sourced (i.e. Initialize instantly)
source "$BREW_PREFIX/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# syntax highlihting
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# autosuggestions
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^y' autosuggest-accept

# some options
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing nonexistent history.

export VISUAL=nvim
export EDITOR="$VISUAL"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
[ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$BREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ben/.lmstudio/bin"
# End of LM Studio CLI section

# this makes cmake make a compile commands json which makes the clangd lsp work??
export CMAKE_EXPORT_COMPILE_COMMANDS=1

# Fun command to copy files to clipboard.
yoink() {
  osascript -e "set the clipboard to (POSIX file \"$PWD/$1\")"
}
