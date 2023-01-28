#!/bin/sh
set -e
AUDIO_IN=/
AUDIO_OUT=/
MODEL_DIRECTORY=/models
MODEL_PATH=/models
cp audio.info.json /tmp/output/audio.info.json
cp audio.mp3 /tmp/output/audio.mp3
spleeter separate -i audio.mp3 -p spleeter:$STEM
cd /tmp/separated_audio/audio
rm -rf /tmp/output/drums.mp3
if test -f "drums.wav"; then
    ffmpeg -i drums.wav -vn -ar 44100 -ac 2 -b:a 192k drums.mp3
    cp drums.mp3 /tmp/output/drums.mp3
fi
rm -rf /tmp/output/bass.mp3
if test -f "bass.wav"; then
    ffmpeg -i bass.wav -vn -ar 44100 -ac 2 -b:a 192k bass.mp3
    cp bass.mp3 /tmp/output/bass.mp3
fi
rm -rf /tmp/output/piano.mp3
if test -f "piano.wav"; then
    ffmpeg -i piano.wav -vn -ar 44100 -ac 2 -b:a 192k piano.mp3
    cp piano.mp3 /tmp/output/piano.mp3
fi
rm -rf /tmp/output/vocals.mp3
if test -f "vocals.wav"; then
    ffmpeg -i vocals.wav -vn -ar 44100 -ac 2 -b:a 192k vocals.mp3
    cp vocals.mp3 /tmp/output/vocals.mp3
fi
rm -rf /tmp/output/other.mp3
if test -f "other.wav"; then
    ffmpeg -i other.wav -vn -ar 44100 -ac 2 -b:a 192k other.mp3
    cp other.mp3 /tmp/output/other.mp3
fi
rm -rf /tmp/output/accompaniment.mp3
if test -f "accompaniment.wav"; then
    ffmpeg -i accompaniment.wav -vn -ar 44100 -ac 2 -b:a 192k accompaniment.mp3
    cp accompaniment.mp3 /tmp/output/accompaniment.mp3
fi

