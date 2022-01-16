# Dependencies 
youtube-dl (obviously) 

zenity

# Instructions

$ git clone https://github.com/lLexian/youtube-dl_music_GUI.git

$ cd cd youtube-dl_music_GUI/

$ chmod +x youtube-dl_music.sh Setup.sh

Run Setup.sh first to designate your directory and choose your preferred of audio format.
Once the setup is complete you can run youtube-dl_music.sh.
Enter the YouTube URL of the song you wish to download and hit "Ok".
It will download in the background and notify you when the download is complete.

# Troubleshooting
When entering the URL make sure it's not a playlist.


Make sure the Download Directory is written correctly when running through the Setup. If there is a space in the directory path, you're required to enter a backslash ("\\") before the space. EXAMPLE:

    "/home/USER/My\ Music".
      
Failing to specify the space with a backslash will result it the script only reading:

    "/home/USER/My"
    
If you're able to download some song but not others, it may be because YouTube has implemented DRM for some video. I am not currently aware of any work-arounds (besides finding another video).

