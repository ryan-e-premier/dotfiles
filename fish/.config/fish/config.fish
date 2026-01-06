alias ls="eza -a"

alias ls='eza -lh --no-user --no-permissions --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias avantefix='rm -rf ~/.local/state/nvim/avante ~/.cache/nvim/avante'

alias cf='nvim ~/.config'
alias acf='nvim ~/.config/nvim/lua/plugins/avante.lua'
alias fenvim='cd ~/code/stanson-frontend/ && nvim .'
alias fe='cd ~/code/stanson-frontend/'
alias sc='source ~/.config/fish/config.fish'
alias cd='z'

alias avanteclear='rm -rf ~/.local/state/nvim/avante ~/.cache/nvim/avante'

function killports
    for port in (seq 3000 3012)
        lsof -ti:$port 2>/dev/null | xargs kill -9 2>/dev/null
    end
    echo "Done killing processes on ports 3000-3012"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -Ux EDITOR nvim
set -Ux MY_CERTIFICATES ~/code
set -Ux NODE_EXTRA_CA_CERTS $MY_CERTIFICATES/nscacert_combined.pem
set -Ux SKIP_PREFLIGHT_CHECK true
set -Ux BASH_SOURCE /Users/ryan_eldridge/code/stanson-frontend/apps/backoffice

set -Ux FZF_DEFAULT_COMMAND ag --nocolor --ignore node_modules -g ""

# uv
fish_add_path "/Users/ryan_eldridge/.local/bin"

# zoxide
set -Ux _ZO_ECHO 1
zoxide init fish | source
