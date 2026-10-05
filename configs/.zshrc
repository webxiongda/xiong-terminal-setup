#!/bin/zsh
# ─── xiong-terminal-setup: Zsh config ────────────────────────────────
# Stack: Starship + zsh-autosuggestions + zsh-syntax-highlighting
#        fzf + zoxide + fnm

# ─── Remove "Last Login" message ────────────────────────────────────
printf "\033[1A\033[K\033[G"

# ─── Homebrew ────────────────────────────────────────────────────────
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# ─── Editor ──────────────────────────────────────────────────────────
export EDITOR="vim"
export VISUAL="$EDITOR"

# ─── Starship prompt ─────────────────────────────────────────────────
eval "$(starship init zsh)"

# ─── Zoxide (smart cd) ───────────────────────────────────────────────
eval "$(zoxide init zsh)"

# ─── Plugins (via Homebrew) ──────────────────────────────────────────
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# ─── Completions ─────────────────────────────────────────────────────
if [[ -d /opt/homebrew/share/zsh-completions ]]; then
    fpath=(/opt/homebrew/share/zsh-completions $fpath)
fi
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# ─── History ─────────────────────────────────────────────────────────
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt AUTO_CD

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

# ─── fnm (Node version manager) ──────────────────────────────────────
if command -v fnm &>/dev/null; then
    eval "$(fnm env --use-on-cd --shell zsh)"
fi

# ─── direnv (per-directory env vars) ─────────────────────────────────
if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# ─── bat theme ───────────────────────────────────────────────────────
export BAT_THEME="Catppuccin Mocha"

# ─── Proxy toggle (proxy-on / proxy-off / proxy-status) ──────────────
# 端口用 PROXY_PORT 覆盖（默认 7890），建议在自己的 ~/.zshrc.local 里设成本机实际端口
export PROXY_HOST="${PROXY_HOST:-127.0.0.1}"
export PROXY_PORT="${PROXY_PORT:-7890}"
# localhost 和国内直连域名必须绕过代理，否则 Claude Code / DeepSeek 反而连不上
export PROXY_BYPASS="${PROXY_BYPASS:-localhost,127.0.0.1,::1,api.deepseek.com,.deepseek.com}"

function proxy-on() {
    local url="http://$PROXY_HOST:$PROXY_PORT"
    export http_proxy="$url"
    export https_proxy="$url"
    export all_proxy="socks5://$PROXY_HOST:$PROXY_PORT"
    export HTTP_PROXY="$url"
    export HTTPS_PROXY="$url"
    export ALL_PROXY="$all_proxy"
    export no_proxy="$PROXY_BYPASS"
    export NO_PROXY="$PROXY_BYPASS"
    echo "✓ Proxy ON: $url"
}
function proxy-off() {
    unset http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY no_proxy NO_PROXY
    echo "✓ Proxy OFF"
}
function proxy-status() {
    if [[ -n $http_proxy ]]; then
        echo "Proxy: ON ($http_proxy)"
        if nc -z "$PROXY_HOST" "$PROXY_PORT" 2>/dev/null; then
            echo "  端口 $PROXY_PORT: 在监听"
        else
            echo "  端口 $PROXY_PORT: 未监听 !! 代理软件没开，网络会断"
        fi
    else
        echo "Proxy: OFF"
    fi
}
# 下划线命名（旧配置沿用），同一份实现，避免两套逻辑打架
alias proxy_on='proxy-on'
alias proxy_off='proxy-off'
alias proxy_status='proxy-status'

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

# ─── Aliases ─────────────────────────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza -lha --icons --group-directories-first'
alias la='eza -a --icons'
alias lt='eza --tree --icons --level=2'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias top='btop'
alias lg='lazygit'
alias c='clear'
alias df='duf'
alias du='dust'
alias y='yazi'

# ─── Quick edit configs ─────────────────────────────────────────────
alias zshrc='$EDITOR ~/.zshrc'
alias szsh='source ~/.zshrc'
alias st='$EDITOR ~/.config/starship.toml'

# ─── pnpm ────────────────────────────────────────────────────────────
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ─── 本机自定义配置 ──────────────────────────────────────────────────
# 放在这里 source，重跑 setup.sh 覆盖 ~/.zshrc 时本机改动不会丢。
# 把机器相关的设置（代理端口、私有 alias、环境变量）写进 ~/.zshrc.local。
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi
