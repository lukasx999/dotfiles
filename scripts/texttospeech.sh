#!/usr/bin/env bash




echo 'Welcome to the world of speech synthesis!' | piper-tts --model /usr/share/piper-voices/en/en_US/lessac/low/en_US-lessac-low.onnx --output_file welcome.wav
