if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vim="nvim"
    alias v="nvim"
    alias g="git"
    alias bat="batcat"
    alias fetch="git config --global credentials.helper store"

    # don't say hello
    set -g fish_greeting

    starship init fish | source
end
