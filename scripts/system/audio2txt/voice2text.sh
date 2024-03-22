#!/usr/bin/env bash


outputfile=/tmp/transcript.txt
tmpfile=/tmp/recording.m4a

#module=vosk-model-en-us-0.42-gigaspeech # takes longer, but is better
module=vosk-model-small-en-us-0.15 # faster, but often incorrect

rm $tmpfile >/dev/null 2>&1
rm $outputfile >/dev/null 2>&1

inputdev=$(pactl list short sources | tac | awk 'NR==1 {print $2}')

#ffmpeg -y -f alsa -i default -acodec pcm_s16le -ac 1 -ar 44100 -t 4 -f wav /tmp/audiorecording.wav
#ffmpeg -f pulse -i alsa_input.usb-SteelSeries_Arctis_Nova_7-00.3.mono-fallback -t -ac 1 recording.m4a

#echo "recording audio..."
ffmpeg -f pulse -i $inputdev -t 10 -ac 1 $tmpfile >/dev/null 2>&1 &&

#echo "interpreting audio..."
#vosk-transcriber -i audio.mp4 -o $outputfile -m $module
vosk-transcriber -i $tmpfile -o $outputfile -m $module >/dev/null 2>&1 &&

#echo "done!"
cat $outputfile

#vosk-transcriber -i audio.mp4 -m ~/scripts/system/audio2txt/vosk-model-en-us-0.42-gigaspeech
