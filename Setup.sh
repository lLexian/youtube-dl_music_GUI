#!/bin/bash 

main () {

    zenity --info \
    --title "Welcome to the Setup!" \
    --width 550 \
    --height 300\
    --text "    This information will be stored in ' $HOME/.config/youtube-dl_music.cfg '\n\
    Please enter the Directory where you wish to save your music and your \n\
    preference of audio format (.m4a or .mp3).\n\n\
    Please be sure to add a backslash before any spaces in your directory path.\n\
    EXAMPLE: $HOME/My\\\ Music/\n\n\
    Also, please only tick one format. Ticking both will default to .mp3 and \n\
    possibly result it errors.\n\n\
    This is important!"

    if [ $? = 0 ] ; then		
		directory		
	elif [ $? = 1 ] ; then
		exit	
	fi
}

directory () {
    NAME=$(echo %\(title\)s.%\(ext\)s)
	DIR=$(zenity --entry \
    --width 500 \
    --title "Music Directory" \
    --text "Enter the Directory you wish to download to:" \
    --entry-text ""); 

	if [ $? = 0 ] ; then		
		format		
	elif [ $? = 1 ] ; then
		exit	
	fi
}

format () {
    FOR=$(zenity --question \
    --width 200 \
    --text="Download Video Thumbnail?" \
    --default-cancel \
    --cancel-label=No \
    --ok-label="Yes" 2>/dev/null);

    if [ $? = 0 ] ; then		
		PIC=$(echo --embed-thumbnail)
	elif [ $? = 1 ] ; then
		PIC=$()
	fi

    response=$(zenity \
    --height=250 \
    --list \
    --checklist \
    --title='File Format' \
    --column=Boxes \
    --column=Format \
    TRUE .m4a FALSE .mp3)

    [[ $response = .m4a* ]] && FOR=$(echo -f bestaudio[ext=m4a]) && CON=$(echo .m4a)
    [[ $response = *.mp3 ]] && FOR=$(echo -f bestaudio[ext=mp3]) && CON=$(echo .mp3)
    [[ "$response" ]] || exit

    zenity --question \
    --title "Confirmation." \
    --width 400 \
    --text "Are you sure the Directory and Format is correct?\n\n\
    Directory = $DIR \n\
    Format = $CON" \n\

    if [ $? = 0 ] ; then		
		echo \"$DIR$NAME\" $FOR > $HOME/.config/youtube-dl_music.cfg | \
        chmod +x $HOME/.config/youtube-dl_music.cfg
	elif [ $? = 1 ] ; then
		directory
	fi

    install
}

install () {
    zenity --info \
    --title "Welcome to the Setup!" \
    --width 300 \
    --text "Setup Complete!\n\n\
If the directory path was entered correctly, 'youtube-dl_music.sh' should be ready to use!"

    exit
}


main