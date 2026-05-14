#!/bin/zsh
# ─── Polar Bear: Zsh config ──────────────────────────────────────────
# Stack: Starship + zsh-autosuggestions + zsh-syntax-highlighting
#        fzf + atuin + zoxide + fnm + direnv

# ─── Homebrew ────────────────────────────────────────────────────────
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# ─── Starship prompt ─────────────────────────────────────────────────
eval "$(starship init zsh)"

# ─── Completions ─────────────────────────────────────────────────────
if [[ -d /opt/homebrew/share/zsh-completions ]]; then
    fpath=(/opt/homebrew/share/zsh-completions $fpath)
fi
autoload -Uz compinit
# Only rebuild completion cache once per day (speeds up shell startup)
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# ─── History ─────────────────────────────────────────────────────────
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY       # Save timestamp + duration
setopt HIST_EXPIRE_DUPS_FIRST # Remove duplicates first when trimming
setopt HIST_IGNORE_DUPS       # Don't record consecutive duplicates
setopt HIST_IGNORE_SPACE      # Don't record commands starting with space
setopt SHARE_HISTORY          # Share history across sessions
setopt INC_APPEND_HISTORY     # Write to history immediately
setopt AUTO_CD                # Type directory name to cd into it

# ─── History prefix search (↑/↓) ─────────────────────────────────────
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# ─── fzf ─────────────────────────────────────────────────────────────
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
elif command -v fzf &>/dev/null; then
    eval "$(fzf --zsh 2>/dev/null)"
fi
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
if command -v fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

# ─── Zoxide (smart cd) ───────────────────────────────────────────────
eval "$(zoxide init zsh)"

# ─── fnm (Node version manager) ──────────────────────────────────────
eval "$(fnm env --use-on-cd --shell zsh)"

# ─── atuin (shell history — replaces Ctrl+R with TUI search) ─────────
# ↑/↓ still does prefix search; Ctrl+R opens atuin's full history UI
if command -v atuin &>/dev/null; then
    eval "$(atuin init zsh --disable-up-arrow)"
fi

# ─── direnv (per-directory env vars) ─────────────────────────────────
if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# ─── SSH key switcher ────────────────────────────────────────────────
function set-ssh-key() {
    local key="$HOME/.ssh/$1"
    if [[ ! -f "$key" ]]; then
        echo "Key not found: $key" >&2
        echo "Available keys:" >&2
        ls ~/.ssh/*.pub 2>/dev/null | sed 's/.*\//  /; s/\.pub$//' >&2
        return 1
    fi
    ssh-add -D 2>/dev/null
    ssh-add "$key"
    echo "Active SSH key: $1"
}

# ─── Proxy toggle ────────────────────────────────────────────────────
# Usage: proxy-on / proxy-off / proxy-status
export PROXY_URL="http://127.0.0.1:7890"
function proxy-on() {
    export HTTPS_PROXY="$PROXY_URL"
    export HTTP_PROXY="$PROXY_URL"
    export ALL_PROXY="$PROXY_URL"
    echo "✓ Proxy ON: $PROXY_URL"
}
function proxy-off() {
    unset HTTPS_PROXY HTTP_PROXY ALL_PROXY
    echo "✓ Proxy OFF"
}
function proxy-status() {
    if [[ -n "$HTTPS_PROXY" ]]; then
        echo "Proxy: ON ($HTTPS_PROXY)"
    else
        echo "Proxy: OFF"
    fi
}

# ─── Aliases ─────────────────────────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias lt='eza --tree --icons --level=2'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias top='btop'
alias lg='lazygit'
alias df='duf'
alias du='dust'
alias y='yazi'

# ─── pnpm ────────────────────────────────────────────────────────────
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ─── Plugins (must load last) ─────────────────────────────────────────
# zsh-syntax-highlighting must be sourced before autosuggestions, both at EOF
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi
