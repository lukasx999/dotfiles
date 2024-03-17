

#            _              
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#    / /\__ \ | | | | | (__ 
#   /___|___/_| |_|_|  \___|



colorscript random

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

export PATH="$HOME/.emacs.d/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9

setopt interactive_comments
setopt auto_cd # cding into dirs by just typing the name

#bindkey -v # enable vi mode
#KEYTIMEOUT=1 # instantly switch to normal mode (no delay)


# set up zoxide
eval "$(zoxide init zsh)"




#lf
LFCD="/home/lukas/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
  source "$LFCD"
fi

alias lf='lfcd'




#xset r rate 300 50 # fast scrolling in vim
#xinput set-prop 9 'libinput Accel Speed' -0.6
#setxkbmap de

alias RELOAD='xset r rate 300 50 && xinput set-prop 9 "libinput Accel Speed" -0.6 && setxkbmap de'

#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#MANROFFOPT="-c"



#default apps

#export EDITOR="nvim"
#export SUDO_EDITOR="nvim"
export EDITOR="$HOME/scripts/nvide.sh"
export SUDO_EDITOR="$HOME/scripts/nvide.sh"
export TERMINAL="kitty"
export BROWSER="librewolf"





# Keybinds
bindkey -s '^x' '$EDITOR\n'
#bindkey -s '^o' 'lf\n'
bindkey -s '^y' 'lf\n'
bindkey -s '^f' 'fuzzy\n'






export BAT_THEME="base16-256"

#for fuzzy finder

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

export IMGVIEWER="nsxiv"
export PDFVIEWER="mupdf"
#export FZF_DEFAULT_OPTS="--color='fg:#cad3f5,bg:#363a4f,fg+:#8aadf4,bg+:#464d64,pointer:#ed8796,prompt:#8aadf4,spinner:#8aadf4,info:#b7bdf8,border:#cad3f5,label:#cad3f5' --preview='head -$LINES {}' --border=rounded --border-label='╢ fuzzy ╟' --info=default --separator='─' --scrollbar='' --prompt='->' --pointer='->'"

#--bind 'ctrl-j:down'
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#c6a0f6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#8aadf4,pointer:#ed8796 \
--color=marker:#f5a97f,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=border:#464d64,label:#464d64,gutter:#363a4f \
--border=rounded \
--preview-window '-3' \
--border-label='╢ fuzzy ╟' \
--info=default \
--marker='' \
--separator='─' \
--scrollbar='' \
--prompt='=>' \
--pointer=''"


alias fuzzy='source ~/scripts/fuzzyfinder/fuzzy'
#. ~/scripts/fuzzyfinder/z.sh
#alias exp='fuzzy . explore'


#--preview='file {} && echo "" && bat -p --color=always {} 2>/dev/null' \






# xsecurelock settings
#export XSECURELOCK_AUTH_CURSOR_BLINK=0
#export XSECURELOCK_AUTH_TIMEOUT=15
#export XSECURELOCK_BLANK_TIMEOUT=-1
#export XSECURELOCK_AUTH_FOREGROUND_COLOR='#cad3f5'
#export XSECURELOCK_AUTH_BACKGROUND_COLOR='#464b64'
#export XSECURELOCK_BACKGROUND_COLOR='#363a4f'
#export XSECURELOCK_FONT='JetBrainsMono Nerd Font Mono'
#export XSECURELOCK_PASSWORD_PROMPT="asterisks" #asterisks, cursor, time, time_hex
#export XSECURELOCK_SHOW_DATETIME=1
#export XSECURELOCK_SHOW_HOSTNAME=1
#export XSECURELOCK_SHOW_USERNAME=1
#export XSECURELOCK_SHOW_KEYBOARD_LAYOUT=1
#export XSECURELOCK_DATETIME_FORMAT='%d.%m.%Y - %R'




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
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char







#symbols:
#Ω
#∮
#Δ
#δ
#∇
#φ
#ψ



# setting PS1
#PROMPT="%F{#b7bdf8}%B%1~ %F{#8aadf4}ψ %b%f"

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


#PS1="%B%{$fg[white]%}[%{$fg[blue]%}%n%{$fg[grey]%}@%{$fg[cyan]%}%M %{$fg[red]%}%~%{$fg[white]%}]%{$reset_color%}$%b "




alias ltspice='wine ~/.wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx64.exe'
#platformio core
alias PIO_UP='pio run --upload-port /dev/ttyACM0 -t upload'
alias PIO_MON='pio run --upload-port /dev/ttyACM0 -t monitor'
alias PIO='pio run --upload-port /dev/ttyACM0 -t upload && pio run --upload-port /dev/ttyACM0 -t monitor'



#alias sudo='sudo -E' # preserve enviroment when running sudo

#alias pac='pacman'
#alias cat='bat -pp'
#alias fzy='~/scripts/fuzzyfinder'
alias neovide='devour neovide --no-fork 2>/dev/null'

alias vim='nvim'
alias vim=$EDITOR

alias vi='/bin/vim'
alias cat='bat --paging=never -n'
alias eza='eza -F --icons=auto --group-directories-first'
alias ls='eza'
#alias ls='ls -F --color=auto --group-directories-first'
alias rm='rm -vi'
alias mv='mv -vi'
alias cp='cp -vi'
alias mkdir='mkdir -v'
alias weather='curl wttr.in'
alias grep='grep --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -Al'
alias ..='cd ..'
alias ...='cd .. && cd ..'

alias pipes='~/XSoftware/pipes.sh/pipes.sh'
alias qlobe='clear; for ((;;)); do for i in {1..360}; do tput cup 0 0; ruby ~/XSoftware/qlobe/src/qlobe.rb $i; sleep 0.1; done; done;'
alias shark='~/XSoftware/display3d/target/release/display3d ~/XSoftware/display3d/resources/blahaj.obj -t 0,0,5.5'
alias tock='~/XSoftware/tock/target/release/tock'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'














# vi mode config
function zvm_config() {
  ZVM_VI_EDITOR=$EDITOR # vi mode editor for vv in normal mode
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_KEYTIMEOUT=0.4

  ZVM_INIT_MODE=sourcing
}


function fuzzyfinder() {
  fuzzy
}


# keybinds
function zvm_after_lazy_keybindings() {
  zvm_define_widget fuzzyfinder
  #bindkey -M vicmd '^F' fuzzyfinder 

  #zvm_bindkey vicmd '^F' fuzzyfinder
}









# plugins
#source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
bindkey -s '^x' '$EDITOR\n'
bindkey -s '^y' 'lf\n'
bindkey -s '^f' 'fuzzy\n'
bindkey -s '^g' 'fuzzy / def\n'



#source ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh






