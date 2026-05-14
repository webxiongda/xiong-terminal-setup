if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /opt/homebrew/bin

# Starship prompt
source (/opt/homebrew/bin/starship init fish --print-full-init | psub)

# fnm (Node version manager)
fnm env --use-on-cd --shell fish | source

# zoxide (smart cd)
zoxide init fish | source

# fzf
fzf --fish | source
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
if command -q fd
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
end

# atuin (shell history — Ctrl+R opens full history TUI)
if command -q atuin
    atuin init fish | source
end

# direnv (per-directory env vars)
if command -q direnv
    direnv hook fish | source
end

# SSH key switcher
function set-ssh-key
    set -l key "$HOME/.ssh/$argv[1]"
    if not test -f "$key"
        echo "Key not found: $key" >&2
        echo "Available keys:" >&2
        for f in ~/.ssh/*.pub
            echo "  "(basename $f .pub) >&2
        end
        return 1
    end
    ssh-add -D 2>/dev/null
    ssh-add "$key"
    echo "Active SSH key: $argv[1]"
end

# Proxy toggle (proxy-on / proxy-off / proxy-status)
set -gx PROXY_URL "http://127.0.0.1:7890"
function proxy-on
    set -gx HTTPS_PROXY $PROXY_URL
    set -gx HTTP_PROXY $PROXY_URL
    set -gx ALL_PROXY $PROXY_URL
    echo "✓ Proxy ON: $PROXY_URL"
end
function proxy-off
    set -e HTTPS_PROXY
    set -e HTTP_PROXY
    set -e ALL_PROXY
    echo "✓ Proxy OFF"
end
function proxy-status
    if set -q HTTPS_PROXY
        echo "Proxy: ON ($HTTPS_PROXY)"
    else
        echo "Proxy: OFF"
    end
end

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
