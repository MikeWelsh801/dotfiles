if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vim="nvim"
    alias v="nvim"
    alias g="git"
    alias bat="batcat"
    alias fetch="git config --global credential.helper store"

    # don't say hello
    set -g fish_greeting

    # the newest starship pull broke their install for fish, so you have to use
    # the janky ass sed command on the second line for now
    # starship init fish | source
    starship init fish --print-full-init | sed 's/"$(commandline)"/(commandline | string collect)/' | source
end
