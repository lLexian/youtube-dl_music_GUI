#!/bin/bash

OPT=$(cat "$HOME/.config/youtube-dl_music.cfg")
URL=$(zenity --entry \
    --width 500 \
    --title "YouTube-DL Song Downloader" \
    --text "Enter YouTube URL:" \
    --entry-text ""); 

eval youtube-dl -o $OPT --add-metadata $URL

    zenity --info --text="Done!"