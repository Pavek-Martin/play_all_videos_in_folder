cls
<#
 --start=<time>    seek to given (percent, seconds, or hh:mm:ss) position
 --no-audio        do not play sound
 --no-video        do not play video
 --fs              fullscreen playback
 --sub-file=<file> specify subtitle file to use
 --playlist=<file> specify playlist file

 --list-options    list all mpv options
 --h=<string>      print options which contain the given string in their name
#>

#$mpv = ("C:\Program Files (x86)\mpv-x86_64\mpv.exe") # bez vypisu
$mpv = ("C:\Program Files (x86)\mpv-x86_64\mpv") # s vypisem

if (-not (Test-Path $mpv)){
Write-Warning "nenalezen soubor $mpv"
sleep 1
#Exit
}else{
& $mpv " --fs" "C:\Users\DELL\Videos\Kral lenochu 1989.mp4" # nejde --fs nevim proc
}

echo "zde"

#& $mpv "C:\Users\DELL\Videos\Kral lenochu 1989.mp4"

