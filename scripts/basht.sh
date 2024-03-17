#! /bin/bash
# basht
# A terminal Fuzzy Finder File Manager
# Created by Christos Angelopoulos in February 2024, under GNU GENERAL PUBLIC LICENSE
Black="\x1b[38;5;60m"
Yellow="\033[1;33m"
Green="\033[1;32m"
Red="\033[1;31m"
Magenta="\033[1;35m"
Cyan="\033[1;36m"
Gray="\x1b[38;5;242m"
bold="\x1b[1m"
normal="\x1b[0m"
function print_mpv_video_shortcuts(){
 echo -e "  ${Black}╭─────┬──────────╮ ╭─────┬─────────────╮";
 echo -e "  ${Black}│${Magenta}  ␣  ${Black}│${Cyan}    Pause ${Black}│ │${Magenta}  f  ${Black}│${Cyan}  Fullscreen ${Black}│";
 echo -e "  ${Black}├─────┼──────────┤ ├─────┼─────────────┤";
 echo -e "  ${Black}│${Magenta} 9 0 ${Black}│${Cyan}   ↑↓ Vol ${Black}│ │${Magenta}  s  ${Black}│${Cyan}  Screenshot ${Black}│";
 echo -e "  ${Black}├─────┼──────────┤ ├─────┼─────────────┤";
 echo -e "  ${Black}│${Magenta}  m  ${Black}│${Cyan}     Mute ${Black}│ │${Magenta} 1 2 ${Black}│${Cyan}    Contrast ${Black}│";
 echo -e "  ${Black}├─────┼──────────┤ ├─────┼─────────────┤";
 echo -e "  ${Black}│${Magenta} ← → ${Black}│${Cyan} Skip 10\"${Black} │ │${Magenta} 3 4 ${Black}│${Cyan}  Brightness${Black} │";
 echo -e "  ${Black}├─────┼──────────┤ ├─────┼─────────────┤";
 echo -e "  ${Black}│${Magenta} ↑ ↓ ${Black}│${Cyan} Skip 60\"${Black} │ │${Magenta} 7 8 ${Black}│${Cyan}  Saturation${Black} │";
 echo -e "  ${Black}├─────┼──────────┤ ├─────┼─────────────┤";
 echo -e "  ${Black}│${Magenta} , . ${Black}│${Cyan}    Frame ${Black}│ │${Magenta}  q  ${Black}│${Red}        Quit ${Black}│";
 echo -e "  ${Black}╰─────┴──────────╯ ╰─────┴─────────────╯${Magenta}";
}
function print_mpv_audio_shortcuts(){
 echo -e "  ${Black}╭─────┬──────────╮";
 echo -e "  ${Black}│${Magenta}  ␣  ${Black}│${Cyan}    Pause ${Black}│";
 echo -e "  ${Black}├─────┼──────────┤";
 echo -e "  ${Black}│${Magenta} 9 0 ${Black}│${Cyan}   ↑↓ Vol ${Black}│";
 echo -e "  ${Black}├─────┼──────────┤";
 echo -e "  ${Black}│${Magenta}  m  ${Black}│${Cyan}     Mute ${Black}│";
 echo -e "  ${Black}├─────┼──────────┤";
 echo -e "  ${Black}│${Magenta} ← → ${Black}│${Cyan} Skip 10\"${Black} │";
 echo -e "  ${Black}├─────┼──────────┤";
 echo -e "  ${Black}│${Magenta} ↑ ↓ ${Black}│${Cyan} Skip 60\"${Black} │";
 echo -e "  ${Black}├─────┼──────────┤";
 echo -e "  ${Black}│${Magenta}  q  ${Black}│${Red}     Quit ${Black}│";
 echo -e "  ${Black}╰─────┴──────────╯${Magenta}";
}
function draw_line(){
 LL=1
 echo -e -n ${Gray}
 while [ $LL -le "$FZF_PREVIEW_COLUMNS"  ]
 do
  echo -e -n "─"
  ((LL++))
 done
 echo -e -n ${normal}
 echo
}

################# UBERZUGPP ###################
function exit_upp () {
 P="${V[_QUIT_]}"
# killall fzf>/dev/null 2>&1
if [[ $IMAGE_SUPPORT == "ueberzugpp" ]];then ueberzugpp cmd -s "$SOCKET" -a exit >/dev/null 2>&1;kill -9 $basht_pid>/dev/null 2>&1;fi
}

clean_upp() {
 ueberzugpp cmd -s "$SOCKET" -a exit>/dev/null 2>&1
 ueberzugpp layer --no-stdin --silent --use-escape-codes --pid-file /tmp/.basht_upp
 UB_PID=$(cat /tmp/.basht_upp)
 SOCKET=/tmp/ueberzugpp-"$UB_PID".socket
}

function draw_upp () {
 ueberzugpp cmd -s $SOCKET -i fzfpreview -a add -x $1 -y $2 --max-width $3 --max-height $4 -f "${5}"
}
##################### Ueberzug #################################

function start_ueberzug {
    mkfifo "${UEBERZUG_FIFO}"
    <"${UEBERZUG_FIFO}" \
        ueberzug layer --parser bash --silent &
    # prevent EOF
    3>"${UEBERZUG_FIFO}" \
        exec
}
function finalise {
    3>&- \
        exec
    &>/dev/null \
        rm "${UEBERZUG_FIFO}"
    &>/dev/null \
        kill $(jobs -p)
}
function draw_ueber {
#sample draw_ueber 35 35 90 3 /path/image.jpg
    >"${UEBERZUG_FIFO}" declare -A -p cmd=( \
        [action]=add [identifier]="preview" \
        [x]="$1" [y]="$2" \
        [width]="$3" [height]="$4" \
        [scaler]=fit_contain [scaling_position_x]=10 [scaling_position_y]=10 \
        [path]="$5")
}

function clear_image {
 if [[ "$IMAGE_SUPPORT" == "kitty" ]];then kitty icat --transfer-mode file  --clear;fi;
 if [[ "$IMAGE_SUPPORT" == "ueberzug" ]];then draw_ueber $(($FZF_PREVIEW_COLUMNS+200)) $(($FZF_PREVIEW_LINES+200))  1 1  $HOME/.cache/basht/basht.png;fi;
 if [[ "$IMAGE_SUPPORT" == "ueberzugpp" ]]; then draw_upp $(($FZF_PREVIEW_COLUMNS + 200)) $(($FZF_PREVIEW_LINES + 200)) 1 1 $HOME/.cache/basht/basht.png;fi
}

function draw_preview {
 if [[ "$IMAGE_SUPPORT" == "kitty" ]];then kitty icat --transfer-mode file  --clear&&kitty icat  --transfer-mode file --place $(($3-1))x$(($4-3))@$1x$2 --scale-up   "$5";fi;
 if [[ "$IMAGE_SUPPORT" == "ueberzugpp" ]]; then draw_upp $(($1*2)) $(($2/2)) $3 $4 "$5";fi;
 if [[ "$IMAGE_SUPPORT" == "ueberzug" ]];then draw_ueber $1 $2 $(($3-1)) $(($4-3)) "$5";fi;
 if [[ "$IMAGE_SUPPORT" == "chafa" ]];then chafa --format=symbols -c full -s  $(($3-1))x$(($4-3)) "$5";fi
}

######################################################
#get pid
basht_pid=$(ps -e|grep basht.sh|tail -2|head -1|awk '{print $1}')
#load config variables from config file

declare -r -x UEBERZUG_FIFO="$(mktemp --dry-run )"
declare -A V
TOTAL="$(cat $HOME/.config/basht/config.psv|wc -l)"
i=1
while [ $i -le $TOTAL ]
do
 VARIABLE[$i]="$(cat $HOME/.config/basht/config.psv|head -$i|tail +$i|awk -F '|' '{print $3}')"
 CONF[$i]="$(cat $HOME/.config/basht/config.psv|head -$i|tail +$i|awk -F '|' '{print $4}')"
 V["${VARIABLE[$i]}"]="${CONF[$i]}"
 ((i++))
done
IMAGE_SUPPORT="$(grep "IMAGE_SUPPORT" $HOME/.config/basht/config.psv|awk -F '|' '{print $4}')"

#load previously chosen theme
export FZF_DEFAULT_OPTS="$(cat $HOME/.config/basht/current_theme.txt)"
echo "$(date +%c): ""Opened instance">>$HOME/.cache/basht/log.txt
FUNCTIONTIME=0

bindings="$(echo $(grep "SHORTCUT " $HOME/.config/basht/config.psv |awk -F '|' '{print $4","}'))""$(echo $(grep "BOOKMARK " $HOME/.config/basht/config.psv |awk -F '|' '{print $4","}'))";bindings="${bindings::-1}";bindings="${bindings// /}"

export UEBERZUG_FIFO IMAGE_SUPPORT SOCKET UB_PID Cyan Magenta Green Black Gray normal FZF_PREVIEW_COLUMNS FZF_PREVIEW_COLUMNS
export -f start_ueberzug finalise draw_ueber clear_image draw_preview draw_upp  draw_line clean_upp
trap exit_upp HUP INT QUIT TERM EXIT ABRT
if [[ $IMAGE_SUPPORT == "ueberzug" ]];then start_ueberzug;fi
if [[ $IMAGE_SUPPORT == "ueberzugpp" ]];then clean_upp; fi
while [[ "$(echo "$P"|head -1)" != "${V[_QUIT_]}" ]] ########## main loop until quit shortcut (ctrl-q) is entered #########
do
 P="$(ls -haA --file-type|sed 's/^/󰧮 /;/\//s/^󰧮 / /;/\.mp3/s/^󰧮 /󰝚 /;/\.wav/s/^󰧮 /󰝚 /;/\.m3u/s/^󰧮 /󰝚 /;/\.flac/s/^󰧮 /󰝚 /;/\.opus/s/^󰧮 /󰝚 /;/\.best/s/^󰧮 /󰝚 /;/\.aac/s/^󰧮 /󰝚 /;/\.ogg/s/^󰧮 /󰝚 /;/\.midi/s/^󰧮 /󰝚 /;/\.m4a/s/^󰧮 /󰝚 /;/\.m4b/s/^󰧮 /󰝚 /;/\.WAV/s/^󰧮 /󰝚 /;/\.mpeg3/s/^󰧮 /󰝚 /;/\.mpeg/s/^󰧮 / /;/\.mp4/s/^󰧮 / /;/\.flv/s/^󰧮 / /;/\.webm/s/^󰧮 / /;/\.mkv/s/^󰧮 / /;/\.avi/s/^󰧮 / /;/\.mov/s/^󰧮 / /;/\.wmv/s/^󰧮 / /;/\.ape/s/^󰧮 / /;/\.mpg/s/^󰧮 / /;/\.3gp/s/^󰧮 / /;/\.jpg/s/^󰧮 / /;/\.jpeg/s/^󰧮 / /;/\.webp/s/^󰧮 / /;/\.JPG/s/^󰧮 / /;/\.JPEG/s/^󰧮 / /;/\.gif/s/^󰧮 / /;/\.png/s/^󰧮 / /;/\.svg/s/^󰧮 / /;/\.zip/s/^󰧮 /󰿺 /;/\.rar/s/^󰧮 /󰿺 /;/\.tar/s/^󰧮 /󰿺 /;/\.gz/s/^󰧮 /󰿺 /;/\.md/s/^󰧮 /󰽛 /;/\.js/s/^󰧮 / /;/\.css/s/^󰧮 /󰅩 /;/\.pdf/s/^󰧮 / /;/\.azw/s/^󰧮 / /;/\.mobi/s/^󰧮 / /;/\.epub/s/^󰧮 / /;/\.doc/s/^󰧮 / /;/\.docx/s/^󰧮 / /;/\.odt/s/^󰧮 / /;/\.html/s/^󰧮 / /;/\.xml/s/^󰧮 / /;/\.deb/s/^󰧮 / /;/\.xls/s/^󰧮 / /;/\.odp/s/^󰧮 / /;/\.pps/s/^󰧮 / /;/\.ppt/s/^󰧮 / /;/\.pptx/s/^󰧮 / /;/\.xlsx/s/^󰧮 / /;/\.ods/s/^󰧮 / /;/\.sh/s/^󰧮 /󱆃 /;/\.conf.*/s/^󰧮 / /;/\.py/s/^󰧮 / /'|fzf \
--header="$PWD"  \
--layout=reverse \
--height=100% \
--prompt="Search:" \
--preview-window=50% \
--bind=right:accept \
--bind=ctrl-a:select-all \
--bind=ctrl-alt-a:deselect-all \
--tabstop=1 \
--no-margin  \
-m \
-i \
--exact \
--expect="$bindings" \
--preview='icon="none";curly={};curly="${curly//[󰝚󰧮󰿺󰽛󱆃󰅩] /}"\
;if [[ -d "$curly" ]] \
 ;then echo -e "${Green}Folder: ${Cyan}""$curly" \
 ; echo -e "${Green}Size  :${Cyan}""$(du -h -c --exclude=.dbus --exclude=.gvfs --exclude=.cache "$curly"|grep total|sed "s/\s.*$//g")""${Green}      Contents:${Cyan}""$(ls "$curly"|wc -l)"; draw_line &&ls -hA1 --file-type "$curly" |sed "s/^/󰧮 /;/\//s/^󰧮 / /;/\.mp3/s/^󰧮 /󰝚 /;/\.wav/s/^󰧮 /󰝚 /;/\.m3u/s/^󰧮 /󰝚 /;/\.flac/s/^󰧮 /󰝚 /;/\.opus/s/^󰧮 /󰝚 /;/\.best/s/^󰧮 /󰝚 /;/\.aac/s/^󰧮 /󰝚 /;/\.ogg/s/^󰧮 /󰝚 /;/\.midi/s/^󰧮 /󰝚 /;/\.m4a/s/^󰧮 /󰝚 /;/\.m4b/s/^󰧮 /󰝚 /;/\.WAV/s/^󰧮 /󰝚 /;/\.mpeg3/s/^󰧮 /󰝚 /;/\.mpeg/s/^󰧮 / /;/\.mp4/s/^󰧮 / /;/\.flv/s/^󰧮 / /;/\.webm/s/^󰧮 / /;/\.mkv/s/^󰧮 / /;/\.avi/s/^󰧮 / /;/\.mov/s/^󰧮 / /;/\.wmv/s/^󰧮 / /;/\.ape/s/^󰧮 / /;/\.mpg/s/^󰧮 / /;/\.3gp/s/^󰧮 / /;/\.webp/s/^󰧮 / /;/\.jpg/s/^󰧮 / /;/\.jpeg/s/^󰧮 / /;/\.JPG/s/^󰧮 / /;/\.JPEG/s/^󰧮 / /;/\.gif/s/^󰧮 / /;/\.png/s/^󰧮 / /;/\.svg/s/^󰧮 / /;/\.zip/s/^󰧮 /󰿺 /;/\.rar/s/^󰧮 /󰿺 /;/\.tar/s/^󰧮 /󰿺 /;/\.gz/s/^󰧮 /󰿺 /;/\.md/s/^󰧮 /󰽛 /;/\.pdf/s/^󰧮 / /;/\.azw/s/^󰧮 / /;/\.mobi/s/^󰧮 / /;/\.epub/s/^󰧮 / /;/\.js/s/^󰧮 / /;/\.css/s/^󰧮 /󰅩 /;/\.doc/s/^󰧮 / /;/\.docx/s/^󰧮 / /;/\.odt/s/^󰧮 / /;/\.odp/s/^󰧮 / /;/\.pps/s/^󰧮 / /;/\.ppt/s/^󰧮 / /;/\.pptx/s/^󰧮 / /;/\.html/s/^󰧮 / /;/\.xml/s/^󰧮 / /;/\.deb/s/^󰧮 / /;/\.xls/s/^󰧮 / /;/\.xlsx/s/^󰧮 / /;/\.ods/s/^󰧮 / /;/\.sh/s/^󰧮 /󱆃 /;/\.conf.*/s/^󰧮 / /;/\.py/s/^󰧮 / /" ; draw_line  \
 ;elif [[ -f "$curly" ]] \
; then echo -e "${Green}""$curly" \
; echo -e "${Cyan}${curly##*.}""   ""$(ls -shQ "$curly"|sed "s/ .*$//g")""   "$(ls -l "$curly" |sed "s/ .*//")"    ${Cyan}""$(stat -c '%y' "$curly" |sed "s/ .*$//")" ; draw_line  \
;if [[ "$curly" == *".jpg" ]] || [[ "$curly" == *".jpeg" ]] ||[[ "$curly" == *".png" ]] || [[ "$curly" == *".svg" ]] ||[[ "$curly" == *".JPG" ]] || [[ "$curly" == *".JPEG" ]] \
;  then if [ ! -e $HOME/.cache/basht/thumbnails/"$(shasum "$curly"|sed "s/ .*//")".png ] && [ -s "$curly" ]; then convert -thumbnail x360 "$curly"  $HOME/.cache/basht/thumbnails/"$(shasum "$curly"|sed "s/ .*//")".png;fi \
;  icon=$HOME/.cache/basht/thumbnails/"$(shasum "$curly"|sed "s/ .*//")".png \
; elif [[ "$curly" == *".mpeg" ]]  || [[ "$curly" == *".gif" ]]|| [[ "$curly" == *".mpg" ]] || [[ "$curly" == *".mp4" ]] || [[ "$curly" == *".flv" ]] || [[ "$curly" == *".webm" ]] || [[ "$curly" == *".mkv" ]] || [[ "$curly" == *".avi" ]] ||[[ "$curly" == *".mov" ]] || [[ "$curly" == *".wmv" ]] || [[ "$curly" == *".ape" ]] || [[ "$curly" == *".3gp" ]]\
;  then if [ ! -e $HOME/.cache/basht/thumbnails/"$curly".png ] && [ -s "$curly" ] \
;  then ffmpegthumbnailer -i "$curly" -s 256 -o  $HOME/.cache/basht/thumbnails/"$curly".png;fi \
;  icon=$HOME/.cache/basht/thumbnails/"$curly".png \
; elif [[ "$curly" == *".txt" ]]||[[ "$curly" == *".desktop" ]]||[[ "$curly" == *".md" ]]||[[ "$curly" == *".xml" ]]||[[ "$curly" == *".json" ]]||[[ "$curly" == *".html" ]]||[[ "$curly" == *".js" ]]||[[ "$curly" == *".css" ]]||[[ "$curly" == *".c" ]]||[[ "$curly" == *".sh" ]]||[[ "$curly" == *".py" ]]||[[ "$curly" == *".csv" ]]||[[ "$curly" == *".tsv" ]]||[[ "$curly" == *".psv" ]]||[[ "$curly" == *".log" ]] \
;  then head -15 "$curly"|fold -w "$FZF_PREVIEW_COLUMNS" -s\
; elif  [[ "$curly" == *".odt" ]]  \
;  then odt2txt "$curly"|head -15|fold -w "$FZF_PREVIEW_COLUMNS" -s && draw_line   \
;  elif  [[ "$curly" == *".doc" ]]||[[ "$curly" == *".docx" ]]||[[ "$curly" == *".rtf" ]] \
;  then no_catdoc "$curly"|head -15 && draw_line \
; elif [[ "$curly" == *".epub" ]] \
;  then if [ ! -e $HOME/.cache/basht/thumbnails/"$(shasum "$curly"|sed "s/ .*//")".png ] && [ -s "$curly" ] \
;  then epub-thumbnailer "$curly"  $HOME/.cache/basht/thumbnails/"$(shasum "$curly"|sed "s/ .*//").png" 256; fi \
;  icon=$HOME/.cache/basht/thumbnails/"$(shasum "$curly"|sed "s/ .*//")".png \
; elif [[ "$curly" == *".pdf" ]]  \
;  then if [ ! -e $HOME/.cache/basht/thumbnails/"$(shasum "$curly"|sed "s/ .*//")".png ] && [ -s "$curly" ] \
;  then pdftoppm -f 1 -l 1 -scale-to-x 256  -scale-to-y -1  -singlefile  -png -tiffcompression png "$curly"  $HOME/.cache/basht/thumbnails/"$(shasum "$curly"|sed "s/ .*//")" ; fi \
;  icon=$HOME/.cache/basht/thumbnails/"$(shasum "$curly"|sed "s/ .*//")".png \
; fi;fi;if [[ "$icon" == "none" ]];then clear_image;else draw_preview $(("$FZF_PREVIEW_COLUMNS" + 6)) 4  $FZF_PREVIEW_COLUMNS $FZF_PREVIEW_LINES "$icon";fi ' )"
 clear_image
 TIMESTAMP=$(date +%s) #===== TIMESTAMP DEFINITION =======
 PP="$(echo "${P//[ 󰝚󰧮󰿺󰽛󱆃󰅩] /}"|tail +2)"
 TOTAL="$(echo -e "$PP"|wc -l)" #====== MULTI SELECTION =========
 i=1
 while [ $i -le $TOTAL ]
 do
  LINE="$(echo -e "$PP"|head -$i|tail +$i)" #==== IMPORTANT! =====
  if [[ -d "$LINE" ]] &&  [[ "$(echo "$P"|head -1)" = "" ]] #=== DIRECTORY PARSING ===
  then
   cd "$LINE"
  fi
  if [[ -f "$LINE" ]] #=== FILE PARSING ===
  then
   #==================== Definition of file EXTENSION ============================
   EXTENSION=$(echo "$LINE"|sed 's/^.*\.//')
   if [ $EXTENSION = txt ] || [[ $EXTENSION == *".txt" ]]||[[ $EXTENSION == *".desktop" ]]||[[ $EXTENSION == *".md" ]]||[[ $EXTENSION == *".xml" ]]||[[ $EXTENSION == *".json" ]]||[[ $EXTENSION == *".html" ]]||[[ $EXTENSION == *".js" ]]||[[ $EXTENSION == *".css" ]]||[[ $EXTENSION == *".c" ]]||[[ $EXTENSION == *".sh" ]]||[[ $EXTENSION == *".py" ]]||[[ $EXTENSION == *".csv" ]]||[[ $EXTENSION == *".tsv" ]]||[[ $EXTENSION == *".psv" ]]||[[ $EXTENSION == *".log" ]]
   then
    case $(echo "$P"|head -1) in
     "${V[_OPEN-WITH_]}")    APP="$(grep "_TEXT_APP" $HOME/.config/basht/config.psv|awk -F '|' '{print $4}'|fzf --layout=reverse  --height=100%  --preview-window=40%:noborder --border -i --prompt="Open with: ")"; echo "$(date +%c): ""Opened "$LINE" with "$APP"">>$HOME/.cache/basht/log.txt; "$APP" "$LINE"
    ;;
     "") eval ${V[_DEFAULTTEXT_APP_]} "'$LINE'" ; echo "$(date +%c): ""Opened "$LINE" with "${V[_DEFAULTTEXT_APP_]}"">>$HOME/.cache/basht/log.txt
     ;;
    esac
 elif [ $EXTENSION = md ]
   then
    case $(echo "$P"|head -1) in
     "${V[_OPEN-WITH_]}")    APP="$(echo -e "${V[_DEFAULT_MD_]}\n""$(grep "_TEXT_APP" $HOME/.config/basht/config.psv|awk -F '|' '{print $4}')"|fzf --layout=reverse  --height=100%  --preview-window=40%:noborder --border -i --prompt="Open with: ")"; echo "$(date +%c): ""Opened "$LINE" with "$APP"">>$HOME/.cache/basht/log.txt; "$APP" "$LINE"
    ;;
     "") eval ${V[_DEFAULT_MD_]} "'$LINE'" ; echo "$(date +%c): ""Opened "$LINE" with "${V[_DEFAULT_MD_]}"">>$HOME/.cache/basht/log.txt
     ;;
    esac
   elif [ $EXTENSION = wav ]||[ $EXTENSION = mp3 ]||[ $EXTENSION = m3u ]||[ $EXTENSION = flac ]||[ $EXTENSION = opus ]||[ $EXTENSION = best ]||[ $EXTENSION = aac ]||[ $EXTENSION = ogg ]||[ $EXTENSION = midi ]||[ $EXTENSION = m4a ]||[ $EXTENSION = WAV ]||[ $EXTENSION = mpeg3 ]||[ $EXTENSION = m4b ]
   then
    if [[ "$(echo "$P"|head -1)" == "${V[_OPEN-WITH_]}" ]]
    then
     APP="$(grep "_MEDIA_APP" $HOME/.config/basht/config.psv|awk -F '|' '{print $4}'|fzf --layout=reverse  --height=100%  --preview-window=40%:noborder --border -i --prompt="Open with: ")"
     "$APP" "$LINE"
     echo "$(date +%c): ""Opened "$LINE" with "$APP"">>$HOME/.cache/basht/log.txt
    elif [[ "$(echo "$P"|head -1)" = "" ]]
    then
     print_mpv_audio_shortcuts
     ${V[_DEFAUDIO_APP_]} "$LINE"
     echo "$(date +%c): ""Opened "$LINE" with "${V[_DEFAUDIO_APP_]}"">>$HOME/.cache/basht/log.txt
    fi
   elif [ $EXTENSION = mpeg ]||[ $EXTENSION = mp4 ]||[ $EXTENSION = flv ]||[ $EXTENSION = webm ]||[ $EXTENSION = mkv ]||[ $EXTENSION = avi ]||[ $EXTENSION = mov ]||[ $EXTENSION = wmv ]||[ $EXTENSION = ape ]||[ $EXTENSION = mpg ]||[ $EXTENSION = 3gp ]
   then
    if [[ "$(echo "$P"|head -1)" == "${V[_OPEN-WITH_]}" ]]
    then
     APP="$(grep "_MEDIA_APP" $HOME/.config/basht/config.psv|awk -F '|' '{print $4}'|fzf --layout=reverse  --height=100%   --border -i --prompt="Open with: ")"
     if [[ "$APP" == "mpv" ]];then print_mpv_video_shortcuts;fi
     eval "$APP" "'$LINE'"
     echo "$(date +%c): ""Opened "$LINE" with "$APP"">>$HOME/.cache/basht/log.txt
    elif [[ "$(echo "$P"|head -1)" = "" ]]
    then
     print_mpv_video_shortcuts
     ${V[_DEFVIDEO_APP_]} "$LINE"
     echo "$(date +%c): ""Opened "$LINE" with "${V[_DEFVIDEO_APP_]}"">>$HOME/.cache/basht/log.txt
    fi
   elif [ $EXTENSION = png ]||[ $EXTENSION = gif ]||[ $EXTENSION = jpg ]||[ $EXTENSION = jpeg ]||[ $EXTENSION = svg ]||[ $EXTENSION = JPG ]||[ $EXTENSION = JPEG ]
   then
    case "$(echo "$P"|head -1)" in
    "${V[_OPEN-WITH_]}" ) APP="$(grep "_IMAGE_APP" $HOME/.config/basht/config.psv|awk -F '|' '{print $4}'|fzf --layout=reverse  --height=100%  --preview-window=40%:noborder  --border -i --prompt="Open with: ")"
     eval "$APP" "'$LINE'"
     echo "$(date +%c): ""Opened "$LINE" with "$APP"">>$HOME/.cache/basht/log.txt
     ;;
    "" ) eval "${V[_DEFIMAGE_APP_]}" "'$LINE'"
     echo "$(date +%c): ""Opened "$LINE" with "${V[_DEFIMAGE_APP_]}"">>$HOME/.cache/basht/log.txt
    ;;
   esac
   elif [ $EXTENSION = xcf ]
   then
    if [[ "$(echo "$P"|head -1)" = "" ]]
    then
     gimp "$LINE" &
     echo "$(date +%c): ""Opened "$LINE" with gimp">>$HOME/.cache/basht/log.txt
    fi
   elif [ $EXTENSION = srt ]
   then
    if [[ "$(echo "$P"|head -1)" = "" ]]
    then
     eval ${V[_SUB_EDITOR_]} "'$LINE'"
     echo "$(date +%c): ""Opened "$LINE" with "${V[_SUB_EDITOR_]}"">>$HOME/.cache/basht/log.txt
    fi
   elif [ $EXTENSION = doc ]||[ $EXTENSION = docx ]||[ $EXTENSION = odt ]||[ $EXTENSION = abw ]||[ $EXTENSION = ods ]||[ $EXTENSION = xls ]||[ $EXTENSION = xlsx ]||[ $EXTENSION = ppt ]||[ $EXTENSION = pptx ]||[ $EXTENSION = pps ]||[ $EXTENSION = ppsx ]||[ $EXTENSION = odp ]||[ $EXTENSION = rtf ]
   then
    if [[ "$(echo "$P"|head -1)" = "" ]]
    then
     eval "${V[_DEF_OFFICE_]}" "'$LINE'" &
     echo "$(date +%c): ""Opened "$LINE" with "${V[_DEF_OFFICE_]}"">>$HOME/.cache/basht/log.txt
    fi
   elif [ $EXTENSION = pdf ]
   then
    if [[ "$(echo "$P"|head -1)" = "" ]]
    then
     eval ${V[_DEF_PDF_]} "'$LINE'"
     echo "$(date +%c): ""Opened "$LINE" with "${V[_DEF_PDF_]}"">>$HOME/.cache/basht/log.txt
    fi
   elif [ $EXTENSION = epub ]
   then
    if [[ "$(echo "$P"|head -1)" = "" ]]
    then
     eval ${V[_DEF_EPUB_]} "'$LINE'"
     echo "$(date +%c): ""Opened "$LINE" with "${V[_DEF_EPUB_]}"">>$HOME/.cache/basht/log.txt
    fi
   elif [ $EXTENSION = html ]
   then
    if [[ "$(echo "$P"|head -1)" == "${V[_OPEN-WITH_]}" ]]
    then
     APP="$(grep "_BROWSER" $HOME/.config/basht/config.psv|awk -F '|' '{print $4}'|fzf --layout=reverse  --height=100%  --preview-window=40%:noborder --border -i --prompt="Open with: ")"
     echo "$(date +%c): ""Opened "$LINE" with "$APP"" >>$HOME/.cache/basht/log.txt
     eval "$APP" "'$LINE'"
    elif [[ "$(echo "$P"|head -1)" = "" ]]
    then
     eval "${V[_DBROWSER_]}" "'$LINE'"
     echo "$(date +%c): ""Opened "$LINE" with "${V[_DBROWSER_]}"">>$HOME/.cache/basht/log.txt
    fi
   elif  [[ "$(echo "$P"|head -1)" = "" ]]
   then
    APP="$(ls /usr/share/|fzf --layout=reverse  --height=100%  --preview-window=40%:noborder --border -i --prompt="Open with: ")"
    echo "$(date +%c): ""Opened "$LINE" with "$APP"" >>$HOME/.cache/basht/log.txt
    eval "$APP"  "'$LINE'"
   fi
  fi
  #================== DEFINING COPY function (ctrl-c) ===============================
  case  "$(echo "$P"|head -1)" in
   "${V[_COPY_]}") if [ $TIMESTAMP != $FUNCTIONTIME ]
   then sed -i 'd' $HOME/.cache/basht/CUT.txt #ERASE CUT.txt contents
    sed -i 'd' $HOME/.cache/basht/COPY.txt #ERASE COPY.txt CONTENTS
    FUNCTIONTIME=$TIMESTAMP
   fi
   echo "$(realpath "$LINE")">>$HOME/.cache/basht/COPY.txt #write "$LINE" to COPY.txt
   echo "$(date +%c): ""*** COPY :""$LINE">>$HOME/.cache/basht/log.txt #write to log.txt
   echo -e "${Yellow}*** COPIED :${normal} ""$LINE" ;;
   #================== DEFINING PASTE function (ctrl-v) ===============================
   "${V[_PASTE_]}" ) if [ "$(cat $HOME/.cache/basht/COPY.txt|wc -l)" != 0 ]
    then
     #parse COPY.txt contents
     COPYLINES="$(cat $HOME/.cache/basht/COPY.txt|wc -l)"
     s=1
     while [ $s -le "$COPYLINES" ]
     do
      COPIED="$(cat $HOME/.cache/basht/COPY.txt|head -$s|tail +$s)"
      #define name of File/dir to be pasted
      PASTED="$(echo "$COPIED"|sed 's/^.*\///g')"
      f=1
      #if file already exists, rename it as "copy of"
      while [[ -f "$COPIED" && -f "$PWD""/""$PASTED" ]] || [[ -d "$COPIED" && -d "$PWD""/""$PASTED" ]]
      do
       PASTED="copy ""$f"" of ""$(echo "$COPIED"|sed 's/^.*\///g')"
       ((f++))
      done
      cp -r -v "$COPIED" "$PWD""/""$PASTED"
      echo -e "${Green}*** Pasted : ${normal}"$COPIED" to ""$PWD."
      echo "$(date +%c): ""PASTED "$PASTED" to "$PWD"">>$HOME/.cache/basht/log.txt
      ((s++))
     done
    elif [ "$(cat $HOME/.cache/basht/CUT.txt|wc -l)" != 0 ]
    then
     #parse CUT.txt
     CUTLINES="$(cat $HOME/.cache/basht/CUT.txt|wc -l)"
     s=1
     while [ $s -le "$CUTLINES" ]
     do
      CUT="$(cat $HOME/.cache/basht/CUT.txt|head -$s|tail +$s)"
      #define name of File/dir to be pasted
      PASTED="$(echo "$CUT"|sed 's/^.*\///g')"
      f=1
      #if file already exists, rename it as "copy of"
      while [[ -f "$CUT" && -f "$PWD""/""$PASTED" ]] || [[ -d "$CUT" && -d "$PWD""/""$PASTED" ]]
      do
       PASTED="copy ""$f"" of ""$(echo "$COPIED"|sed 's/^.*\///g')"
       ((f++))
      done
      mv "$CUT" "$PWD""/""$PASTED"
      echo "$(realpath "$PWD")""/""$PASTED">>$HOME/.cache/basht/COPY.txt #copy copied address to COPY.txt (for future copying)
      echo "$(date +%c): ""PASTED "$PASTED" to "$PWD"">>$HOME/.cache/basht/log.txt
      echo -e "${Green}***PASTED : ${normal}"$PASTED" to "$PWD""
      ((s++))
     done
     sed -i 'd' $HOME/.cache/basht/CUT.txt #erase CUT.txt content (already copied to COPY.txt)
    fi ;;
   #================== DEFINING CUT function (ctrl-x) =================================
   "${V[_CUT_]}")if [ $TIMESTAMP != $FUNCTIONTIME ] #specify if LINE belongs to the same selection with the previous LINE
    then sed -i 'd' $HOME/.cache/basht/CUT.txt
     sed -i 'd' $HOME/.cache/basht/COPY.txt #ERASE CLIP CONTENTS
     FUNCTIONTIME=$TIMESTAMP
    fi
    #write "$LINE" to CUT.txt
    echo "$(realpath "$LINE")">>$HOME/.cache/basht/CUT.txt
    echo "$(date +%c): ""*** CUT : ""$LINE">>$HOME/.cache/basht/log.txt
    echo -e "${Yellow}*** CUT : ${normal}""$LINE" ;;
   #================== DEFINING DELETE function (ctrl-d) ==============================
   "${V[_DELETE_]}" )echo -e "${Red}*** DELETE "$LINE" and move it to the TRASH? (y/n)${normal}" ##Uncomment if you want to be prompted for each file before deleting
    read -N 1 DEL_REPLY  ##Uncomment if you want to be prompted for each file before deleting
    if [ "$DEL_REPLY" == "y" ]||[ "$DEL_REPLY" == "Y" ] ##Uncomment if you want to be prompted for each file before deleting
    then ##Uncomment if you want to be prompted for each file before deleting
     if [[ -e $HOME/.local/share/Trash/files/"$LINE" ]] || [[ -d $HOME/.local/share/Trash/files/"$LINE" ]]
     then echo
      mv -v $HOME/.local/share/Trash/files/"$LINE" $HOME/.local/share/Trash/files/"$LINE"_$RANDOM
     fi
     mv -v "$LINE" $HOME/.local/share/Trash/files/
     echo "$(date +%c): ""*** DELETED ""$LINE">>$HOME/.cache/basht/log.txt
     echo -e "${Red}*** DELETED : ${normal}""$LINE"
    fi ##Uncomment if you want to be prompted for each file before deleting
   ;;
   #================== DEFINING RENAME function (ctrl-r) ===============================
   "${V[_RENAME_]}" )echo -e "${Yellow}*** Give a new name to rename ""$LINE"" :${normal}"
    read NEWNAME
    echo -e "${Yellow}*** RENAME "$LINE" as "$NEWNAME"? (y/n)${normal}"
    read -N 1 REN_REPLY
    if [ "$REN_REPLY" == "y" ] || [ "$REN_REPLY" == "Y" ]
    then
     if [ -e "$NEWNAME" ]
     then
      echo "$(date +%c): ""*** ABORTED: Name already exists.">>$HOME/.cache/basht/log.txt
     else
      mv "$LINE" "$NEWNAME"
      echo "$(date +%c): ""RENAMED "$LINE"  as " "$NEWNAME">>$HOME/.cache/basht/log.txt
      echo -e "${Green}*** RENAMED "$LINE"  as " "$NEWNAME""${normal}"
     fi
    else
     echo "$(date +%c): ""*** RENAME ABORTED.">>$HOME/.cache/basht/log.txt
     echo -e "${Red}*** RENAME ABORTED.${normal}"
    fi ;;
   #================= DEFINING SHOW SHORTCUTS function (alt-s) ====================================
   "${V[_SHORT_]}" ) clear;echo -e "${Yellow}SHORTCUTS"
   echo -e " | ${Green}ACTION   | |SHORTCUT${normal}\n | Select All : | |ctrl-a","\n | Deselect All : | |ctrl-alt-a\n | Accept : | |right arrow/enter\n""$(grep 'SHORTCUT ' $HOME/.config/basht/config.psv)"|column -t  -s '|'  --table-hide 1,3 --table-right 2
    echo -e "${Yellow}Press any key to return${normal}"
    read -N 1 READSHORT;;
   #================= DEFINING SHOW BOOKMARKS function (alt-b) ====================================
   "${V[_BOOK_]}" ) clear;
   echo -e "${Yellow}BOOKMARKS"
   echo -e " |${Green}DIRECTORY   | |SHORTCUT${normal}\n""$(grep 'BOOKMARK' $HOME/.config/basht/config.psv)"|column -t  -s '|' --table-hide 1,3 --table-right 2
   echo -e "${Yellow}Press any key to return${normal}"
    read -N 1 READBOOK;;
   #================= DEFINING SHOW PREFERRED APPLICATIONS function (alt-p) ====================================
   "${V[_PREFERENCES_]}" ) clear;
    echo -e "${Yellow}PREFERRED APPLICATIONS"
    echo -e " |${Green}DESCRIPTION  | |APPLICATION${normal}\n""$(grep APPLICATION ~/.config/basht/config.psv)"|column -t  -s '|'  --table-hide 1,3 --table-right 2
    echo -e "${Yellow}Press any key to return${normal}"
    read -N 1 READHELP;;
   #================= DEFINING EDIT PREFERENCES function (ctrl-p) ====================================
   "${V[_CONF_]}" ) eval ${V[_DEFAULTTEXT_APP_]} $HOME/.config/basht/config.psv;;
   #================= DEFINING view history function (alt-h) ====================================
   "${V[_HISTORY_]}" ) cat $HOME/.cache/basht/log.txt;
   echo -e "${Yellow}Press any key to return${normal}"
   read -N 1 READHELP;;
   #====================== DEFINING EMPTY TRASH function (ctrl-z) =======================
   "${V[_EMPTY-TRASH_]}" ) echo -e "${Yellow}*** TRASH contains :${normal}"
    echo "$(ls -A $HOME/.local/share/Trash/files/)"
    echo -e "${Red}*** EMPTY TRASH? Are you SURE? (y/n)${normal}"
    read -N 1 REPLY
    echo
    if [ "$REPLY" == "y" ]
    then
     TOTALTRASHLINES="$(ls -A $HOME/.local/share/Trash/files/|wc -l)"
     TRASHLINENUMBER=1
     while [ $TRASHLINENUMBER -le $TOTALTRASHLINES ]
     do
      TRASHLINE="$(ls -A $HOME/.local/share/Trash/files/|head -1)"
       rm -rv $HOME/.local/share/Trash/files/"$TRASHLINE"
      ((TRASHLINENUMBER++))
     done
     echo "$(date +%c): ""TRASH EMPTIED.">>$HOME/.cache/basht/log.txt
    fi;;
   #====================== DEFINING EMPTY CACHE function (ctrl-alt-z) =======================
   "${V[_EMPTY-CACHE_]}" ) echo -e "${Yellow}*** CACHE contains :${normal}"
    echo "$(ls -A $HOME/.cache/basht/thumbnails/)"
    echo -e "${Red}*** EMPTY CACHE? Are you SURE? (y/n)${normal}"
    read -N 1 REPLY
    echo
    if [ "$REPLY" == "y" ]
    then
     TOTALCACHELINES="$(ls -A $HOME/.cache/basht/thumbnails/|wc -l)"
     CACHELINENUMBER=1
     while [ $CACHELINENUMBER -le $TOTALCACHELINES ]
     do
      CACHELINE="$(ls -A $HOME/.cache/basht/thumbnails/|head -1)"
       rm -rv $HOME/.cache/basht/thumbnails/"$CACHELINE"
      ((CACHELINENUMBER++))
     done
     echo "$(date +%c): ""CACHE EMPTIED.">>$HOME/.cache/basht/log.txt
    fi;;
   #================= DEFINING MAKE NEW FILE (ctrl-n) =================================
   "${V[_CREATE-N-FILE_]}" )read -p "Enter name of new file :" NAME
    if [ -z "$NAME" ]
    then
     echo "$(date +%c): ""Action ABORTED.">>$HOME/.cache/basht/log.txt
    elif [ -f "$PWD""/""$NAME" ]
    then
     echo "$(date +%c): ""ABORTED: Name already in use." >>$HOME/.cache/basht/log.txt
    else
     touch "$NAME"
     echo "$(date +%c): ""CREATED ""$NAME"" file inside ""$PWD">>$HOME/.cache/basht/log.txt
    fi;;
   #================= DEFINING SELECT APP function (ctrl-alt-o) ========================
   "${V[_SELECT-APP_]}" ) APP="$(ls /usr/share/|fzf --layout=reverse  --height=100%  --preview-window=40%:noborder --border -i --prompt="Open with: ")"
    echo "$(date +%c): ""Opened "$LINE" with "$APP"" >>$HOME/.cache/basht/log.txt
    eval "$APP" "'$LINE'" ;;
   #================= DEFINING MAKE NEW DIRECTORY (ctrl-alt-n) =========================
    "${V[_CREATE-N-DIR_]}" ) read -p "Enter name of new directory :" NAME
    if [ -z "$NAME" ]
    then
     echo "$(date +%c): ""Action ABORTED, enter valid name">>$HOME/.cache/basht/log.txt
    elif [ -d "$PWD""/""$NAME" ]
    then
     echo "$(date +%c): ""ABORTED: Name already in use.">>$HOME/.cache/basht/log.txt
    else
     mkdir "$NAME"
     echo "$(date +%c): ""CREATED ""$NAME"" directory inside ""$PWD">>$HOME/.cache/basht/log.txt
    fi ;;
   #================= DEFINING MOVE to PREVIOUS Directory Bookmark alt-left =====================
   "${V[_PREVIOUS-DIR_]}" ) cd -;echo "MOVED BACK to $PWD">>$HOME/.cache/basht/log.txt;;
   #=== DEFINING Going to parent dir  (left) ===
   "${V[_PARENT_]}" ) cd .. ;echo "MOVED to $PWD">>$HOME/.cache/basht/log.txt;;
   "alt-"[0-9,z,x,c,v]) NEWDIR="$(grep $(echo "$P"|head -1) $HOME/.config/basht/config.psv|awk -F '|' '{print $2}'|sed 's/ : $//')" #=== DEFINING BOOKMARKS ===
    cd "$NEWDIR" ;;
   "${V[_THEME_]}") T=""; #=== DEFINING THEME function (ctrl-t) ===
    while [ "$T" != "Exit" ]
    do
     T="$(cat $HOME/.config/basht/themes.txt | awk '{print $1}'|fzf --layout=reverse  --height=100%  --preview-window=40%:noborder --border -i --prompt="Select Theme: " )"
     TC="$(grep "$T" $HOME/.config/basht/themes.txt|sed 's/^.*  //')"
     if [[ $T == 'None' ]];then TC="";fi
     if [ "$T" != "Exit" ]
     then
      export FZF_DEFAULT_OPTS="$TC"
      echo "$(date +%c): ""Selected Theme: $T">>$HOME/.cache/basht/log.txt
      echo "$FZF_DEFAULT_OPTS">$HOME/.config/basht/current_theme.txt
     fi
    done;;
   "${V[_OPENTERMINAL_]}" ) eval "${V[_PREFTERM_]}";; #=== DEFINING open terminal  (alt-t) ===
  esac
  ((i++))
 done
done
notify-send -t 4000 -i $HOME/.cache/basht/basht.png "Exited basht"
