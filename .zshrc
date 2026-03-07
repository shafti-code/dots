export PATH="/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -Uz vcs_info

autoload -Uz compinit
compinit
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b) '
setopt PROMPT_SUBST

precmd() { vcs_info }

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'

export PATH="$PATH:/Users/shafti/.lmstudio/bin"
export PATH="$PATH:/Users/shafti/Projects/img2text/build"

export PROMPT='%B%F{magenta}%n  %1~ ${vcs_info_msg_0_} ✿➤ %f%b' 
export PICO_SDK=$HOME/Projects/pico-sdk/


fcd(){
    cd "$(fzf --tmux --walker=dir,hidden --smart-case)"
}

hi(){
    echo hello $(whoami)
}

# fhist(){
#     local history_command
#     history_command="$(cat $HOME/.zsh_history | awk '!seen[$0]++'  | fzf --smart-case --style=minimal --height 3 --exit-0 --bind 'ctrl-r:abort')"
#     eval $history_command
# }
# zle -N fhist
# bindkey '^R' fhist
#

tflip(){
    if [[ $1 == "dark" ]]; then
        tmux set -g status-fg "#ffffff"
        export TMUX_THEME=2
    else
    if [[ $1 == "light" ]]; then
        tmux set -g status-fg "#000000"
        export TMUX_THEME=1
    else
        echo "invalid arg"
    fi
    fi
}

dell='shaftidell@192.168.200'


alias vim='nvim'
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias sshafti='ssh shafti@192.168.0.109'
alias gi='generacja.sh'
alias spawn='spawn.sh'
alias darwin='sudo darwin-rebuild switch --flake $HOME/.config/nix#system'
alias love="/Applications/love.app/Contents/MacOS/love"

bindkey -v # enables vi bindings

poprepo(){
    local personalRepoList="$(gh repo list --json url --jq '.[] | .url' )"
    #github organizations have to be state explicityly so just put the ones you want to search here
    local orgRepoList="$(gh repo list Generacja-Innowacja --json url --jq '.[] | .url' )"
    local picked="$(echo -e "$personalRepoList\n$orgRepoList" | fzf --tmux)"
    open $picked
}

popclone(){
    local personalRepoList="$(gh repo list --json url --jq '.[] | .url' )"
    local orgRepoList="$(gh repo list Generacja-Innowacja --json url --jq '.[] | .url' )"
    local picked="$(echo -e "$personalRepoList\n$orgRepoList" | fzf --tmux)"
    git clone $picked
}

todo(){
    nvim ~/todo/todo.md
}

note(){
    if [[ $# == 0 ]]; then
        nvim ~/notes/$(ls ~/notes | fzf --tmux)
    else
        nvim ~/notes/$1.md
    fi

}


autoload -Uz history-incremental-search-backward history-incremental-search-forward #bring those funcs into scope
bindkey -M vicmd '/' history-incremental-search-backward # if in mode vicmd hit / to search history kinda like vim
bindkey -M vicmd '?' history-incremental-search-forward # same but forwards

bindkey '^R' history-incremental-search-backward # the bash GOATED way of doing this why isnt it a default

bindkey -M viins '^?' backward-delete-char # backspace fix (what the fuck zsh really? backspaces are not a default)
bindkey -M viins '^H' backward-delete-char # same thing

autoload -Uz edit-command-line #bring edit-command-line into scope
zle -N edit-command-line # make it a widget <- (litearlly just make it so you can call it by a keybind who the fuck named those things)
bindkey -M vicmd 'vv' edit-command-line # finally when you press v you are shot into $EDITOR (the glorius nvim)


export PATH="$PATH:/Users/shafti/tmux_scripts/"
export PATH="$PATH:/Users/shafti/simple_templates"

