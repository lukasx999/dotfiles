# Syncwd.nvim
source ~/Scripts/syncwd/changecwd.sh

PATH=$PATH:~/.cargo/bin

# History
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

setopt interactive_comments  # Interactive Comments
setopt auto_cd               # cding into dirs by just typing the name
# setopt NO_CASE_GLOB  # Case insensitive globbing (wildcard expansion, eg ls ~/D*)

# Corrections after sending commands
setopt CORRECT
setopt CORRECT_ALL

# Old VI Mode
#bindkey -v # enable vi mode
#KEYTIMEOUT=1 # instantly switch to normal mode (no delay)

# bindkey -e  # Emacs keybindings (put this at bottom)




# LF
# LFCD="/home/lukas/.config/lf/lfcd.sh"
# if [ -f "$LFCD" ]; then
#   source "$LFCD"
# fi
#
# alias lf='lfcd'



# Reload X11 Settings
alias RELOAD='xset r rate 300 50 && xinput set-prop 9 "libinput Accel Speed" -0.6 && setxkbmap de'

# Default Applications
export TERMINAL="kitty"
export BROWSER="firefox"
export TERM=xterm-256color
export PAGER="less"

# Editors
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
alias vimpager="nvimpager"

# export MANPAGER="moar"
# export MANPAGER="bat -p -l man"
# alias man='man -P "bat -p -l man"'
alias man="batman"  # AUR: bat-extras

source <(fzf --zsh)  # Set up fzf key bindings and fuzzy completion

export FZF_DEFAULT_OPTS=" \
--color=gutter:#24283b \
--color=border:#24283b \
--color=bg+:#2f334d \
--color=info:#82aaff \
--color=fg+:#c8d3f5 \
--border=rounded \
--preview-window '-3' \
--info=default \
--marker='' \
--prompt='' \
--pointer=''"


# Load colors
autoload -U colors && colors

# Tab complete
autoload -U compinit
zstyle '*:completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) #include hidden files

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# case insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'






# CUSTOM:

# Exit with escape key
bindkey -M menuselect '\e' send-break

# Undo
bindkey -M menuselect 'u' undo

# Keep prompt open
bindkey -M menuselect 'o' accept-and-hold

# Only one tab press
setopt menu_complete


# Speed up completion by using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Formatting
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'

# Completions for typos
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'


# When no matches are found
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

# Grouping results
zstyle ':completion:*' group-name ''

# Luke Smith PS1
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Ω ∮ Δ δ ∇ φ ψ
NEWLINE=$'\n'
SYMBOL="*"
PROMPT="%B%{$fg[blue]%}%~      %{$fg[yellow]%}    ${NEWLINE}${SYMBOL}%{$reset_color%}%b "
RPROMPT="%(?..%?)" # Show exit code only if not 0
# setopt PRINT_EXIT_VALUE # Always print out exit code

# PlatformIO core
alias PIO_UP='pio run --upload-port /dev/ttyACM0 -t upload'
alias PIO_MON='pio run --upload-port /dev/ttyACM0 -t monitor'
alias PIO='pio run --upload-port /dev/ttyACM0 -t upload && pio run --upload-port /dev/ttyACM0 -t monitor'
alias PIO_CDB='pio run -t compiledb'

# Etc
alias sqlite='sqlite3'
alias pypy='pypy3'

# Custom Scripts
alias wpfzf="$HOME/Scripts/wpfzf/wpfzf.sh"
alias quickfind="source $HOME/Scripts/quickfind/quickfind.sh"

#alias cat='bat -pp'
alias neovide='neovide --no-fork 2>/dev/null'
alias emacstui='emacs -nw'  # Open emacs in terminal session

alias vim='nvim'
alias vi='command vim'
alias vimdiff='nvim -d'

# File listing
alias \
        ls='ls -hNF --color=auto --group-directories-first' \
        cat='bat --paging=never -n' \
        eza='eza -F --icons=never --group-directories-first' \
        ls='eza' \
        l1='ls -1' \
        l1a='ls -1a' \
        lt='eza --tree --level 2 --icons=auto' \
        lta='eza --tree -a --icons=auto' \
        ll='eza -l --icons=auto' \
        lla='eza -Al --icons=auto' \
        la='ls -A'
        # ll='ls -lh' \

# Etc
alias \
        rm='rm -vi' \
        mv='mv -vi' \
        cp='cp -vi' \
        mkdir='mkdir -v' \
        grep='grep --color=auto' \
        diff='diff --color=auto' \
        ip='ip -color=auto' \
        ..='cd ..' \
        ...='cd .. && cd ..'

# Other fun stuff
alias weather='curl wttr.in'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# make dir, then cd into it
function mkcd() {
    dir=$1
    mkdir "$dir"
    cd "$dir"
}



# VI Mode Config
function zvm_config() {
    ZVM_VI_EDITOR=$EDITOR # vi mode editor for vv in normal mode
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
    ZVM_KEYTIMEOUT=0
    ZVM_INIT_MODE=sourcing
    ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX

    # Disable the cursor style feature
    ZVM_CURSOR_STYLE_ENABLED=false
}



# Plugins
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh/plugins/zsh-fzf-plugin/fzf.plugin.zsh


# bindkey -s '^y' 'lf\n'

bindkey '^H' backward-kill-word # delete words with C - <backspace>

# autoload -Uz select-word-style
# select-word-style bash
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'  # Dont treat filepaths as words




# Set up direnv
eval "$(direnv hook zsh)"
