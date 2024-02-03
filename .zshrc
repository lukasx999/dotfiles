# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9

#colorscript random

setopt auto_cd

#lf
LFCD="/home/lukas/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
  source "$LFCD"
fi

alias lf='lfcd'


bindkey -s '^o' 'lf\n'



xset r rate 300 50
xinput set-prop 9 'libinput Accel Speed' -0.6
setxkbmap de

#default apps
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="librewolf"



#export PATH=$PATH:~/scripts

#symbols:

#Ω
#∮
#Σ
#Δ
#δ
#∇


PROMPT="%F{#eceff4}%B%1~ %F{#81a1c1}∇ %b%f"
#PROMPT="%F{#eceff4}%B%1~ %F{#81a1c1}φ %b%f"
#PROMPT="%F{#eceff4}%B%1~ %F{#81a1c1}ψ %b%f"
#PROMPT="%F{#eceff4}%B%1~ %F{#81a1c1}∮ %b%f"
#PROMPT="%F{#81a1c1}%BΔ %F{#eceff4}%1~ %F{#81a1c1}∇ %b%f"
#PROMPT="%F{#81a1c1}%B∮ %F{#eceff4}%1~ %F{#81a1c1}∮ %b%f"


#enable colors
autoload -U colors && colors

#Tab complete
autoload -U compinit
zstyle '*:completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) #include hidden files


alias ltspice='wine ~/.wine/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx64.exe'


#alias sudo='sudo -E'

#alias pac='pacman'
alias rm='rm -v'
alias mv='mv -v'
alias mkdir='mkdir -v'
alias weather='curl wttr.in'
alias nv='neovide'
alias ls='ls -h --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias ..='cd ..'
alias ...='cd .. && cd ..'

alias pipes='~/XSoftware/pipes.sh/pipes.sh'
alias qlobe='clear; for ((;;)); do for i in {1..360}; do tput cup 0 0; ruby ~/XSoftware/qlobe/src/qlobe.rb $i; sleep 0.1; done; done;'
alias shark='~/XSoftware/display3d/target/release/display3d ~/XSoftware/display3d/resources/blahaj.obj -t 0,0,5.5'
alias tock='~/XSoftware/tock/target/release/tock'


source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
#source ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
