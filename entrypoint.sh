#!/bin/sh
set -e
export STEM=$2
youtube-dl --extract-audio --audio-format mp3 --write-info-json --no-color --output "audio.%(ext)s" --exec ~/post-process-file.sh $1