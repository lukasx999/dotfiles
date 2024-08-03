
# colorscript random


# Syncwd.nvim
source ~/Scripts/syncwd/changecwd.sh


# History
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE



# Doom Emacs scripts
# export PATH=$HOME/.config/emacs/bin:$PATH


# Set Qt6 theme
# export QT_QPA_PLATFORMTHEME="qt6ct"



setopt interactive_comments  # Interactive Comments
setopt auto_cd  # cding into dirs by just typing the name
# setopt NO_CASE_GLOB  # Case insensitive globbing (wildcard expansion, eg ls ~/D*)

# Corrections after sending commands
setopt CORRECT
setopt CORRECT_ALL

# Old VI Mode
#bindkey -v # enable vi mode
#KEYTIMEOUT=1 # instantly switch to normal mode (no delay)






# LF
LFCD="/home/lukas/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
  source "$LFCD"
fi

alias lf='lfcd'



# Ranger
export RANGER_LOAD_DEFAULT_RC=FALSE
# alias ranger='export TERM="kitty"; ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"; export TERM="xterm-256color"'

# Ranger Icons
export RANGER_DEVICONS_SEPARATOR=' '

# function ranger {
#     local IFS=$'\t\n'
#     local tempfile="$(mktemp -t tmp.XXXXXX)"
#     local ranger_cmd=(
#         command
#         ranger
#         --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
#     )
#
#     ${ranger_cmd[@]} "$@"
#     if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
#         cd -- "$(cat "$tempfile")" || return
#     fi
#     command rm -f -- "$tempfile" 2>/dev/null
# }




function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}








# Reload X11 Settings
alias RELOAD='xset r rate 300 50 && xinput set-prop 9 "libinput Accel Speed" -0.6 && setxkbmap de'




# Default Applications
export TERMINAL="kitty"
export BROWSER="firefox"
export TERM=xterm-256color
export PAGER="less"

# For quickfind
export IMGVIEWER="nsxiv"
export PDFVIEWER="mupdf"

# Editors
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"




# Keybinds
#bindkey -s '^x' '$EDITOR\n'
#bindkey -s '^o' 'lf\n'
#bindkey -s '^y' 'lf\n'
#bindkey -s '^f' 'fuzzy\n'



# export BAT_THEME="base16-256"
unset BAT_THEME  # Only way to get colored man pages
alias man="batman"




# source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)



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







# Symbols for PS1
#Ω ∮ Δ δ ∇ φ ψ


# PS1
# PROMPT="%F{#b7bdf8}%B%1~ %F{#8aadf4}ψ %b%f"
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "



NEWLINE=$'\n'
# PROMPT="${NEWLINE}%B%{$fg[blue]%}%~      %{$fg[yellow]%}    ${NEWLINE}$%{$reset_color%}%b "
PROMPT="%B%{$fg[blue]%}%~      %{$fg[yellow]%}    ${NEWLINE}$%{$reset_color%}%b "




# No Newline
# PROMPT="%B%{$fg[magenta]%}%~      %{$fg[yellow]%}    ${NEWLINE}$%{$reset_color%}%b "

# RPROMPT=""



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

# alias py='ipython'
alias py='ptpython'

# Wayland compatibility
alias qutebrowser='qutebrowser --qt-flag ignore-gpu-blacklist --qt-flag enable-gpu-rasterization --qt-flag enable-native-gpu-memory-buffers --qt-flag num-raster-threads=4'
alias spotify='spotify --enable-features=UseOzonePlatform --ozone-platform=wayland'

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
alias pipes='~/software-etc/pipes.sh/pipes.sh'
alias qlobe='clear; for ((;;)); do for i in {1..360}; do tput cup 0 0; ruby ~/software-etc/qlobe/src/qlobe.rb $i; sleep 0.1; done; done;'
alias shark='~/software-etc/display3d/target/release/display3d ~/software-etc/display3d/resources/blahaj.obj -t 0,0,5.5'
alias tock='~/software-etc/tock/target/release/tock'
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
  #ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  # ZVM_KEYTIMEOUT=0.4
  ZVM_KEYTIMEOUT=0
  ZVM_INIT_MODE=sourcing
  # Change to Zsh's default readkey engine
  # ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
  ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX

  # Disable the cursor style feature
  ZVM_CURSOR_STYLE_ENABLED=false


}





# function underscore() {
#   echo "\033[5D"
# }



# The plugin will auto execute this zvm_after_lazy_keybindings function
function zvm_after_lazy_keybindings() {

  # zvm_define_widget underscore
  # zvm_bindkey vicmd '^E' underscore

}







# # Set up ZINIT as a plugin manager
# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
# [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# source "${ZINIT_HOME}/zinit.zsh"
#
# # If you source after compinit
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit
#
# # Load plugins
# zinit ice depth=1  # Git clone depth
# zinit light jeffreytse/zsh-vi-mode
#
# zinit light zsh-users/zsh-autosuggestions
# zinit light zdharma-continuum/fast-syntax-highlighting
# zinit light hlissner/zsh-autopair
#
# zinit ice lucid wait'0'
# zinit light joshskidmore/zsh-fzf-history-search
# export ZSH_FZF_HISTORY_SEARCH_BIND='^r'
# export ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=0
# export ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0
# export ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=1




# Plugins (old)
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
source /usr/share/zsh/plugins/zsh-fzf-plugin/fzf.plugin.zsh

# (zsh-completions is also installed)

# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# autopair-init







# alias quickfind='. ~/Desktop/Code/Sh/quickfind'
bindkey -s '^f' 'quickfind\n'

bindkey -s '^n' 'tmux\n'
bindkey -s '^x' '$EDITOR\n'
bindkey -s '^y' 'lf\n'

# delete words with C - <backspace>
bindkey '^H' backward-kill-word





# Set up direnv
eval "$(direnv hook zsh)"



# Set up Starship prompt
# export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(starship init zsh)"


# NVM
# source /usr/share/nvm/init-nvm.sh
