cls
<#
mpv --help

 --start=<time>    seek to given (percent, seconds, or hh:mm:ss) position
 --no-audio        do not play sound
 --no-video        do not play video
 --fs              fullscreen playback
 --sub-file=<file> specify subtitle file to use
 --playlist=<file> specify playlist file

 --list-options    list all mpv options
 --h=<string>      print options which contain the given string in their name
#>

#$path = "C:\Users\DELL\Videos\anri_okita\"

$path = "C:\Users\DELL\Videos\expand\"


#$mpv = ("C:\Program Files (x86)\mpv-x86_64\mpv.exe") # nesmi bejt mpv.exe janak pusti vsechny videa na jednou a ne po sobe !!!
$mpv = ("C:\Program Files (x86)\mpv-x86_64\mpv") # takle funguje pousteni jedno po druhym

if (-not (Test-Path $mpv)){
Write-Warning "nenalezen soubor $mpv"
sleep 3
exit
}

$files = Get-ChildItem -path $path -include *.mp4,*.avi -recurse 

foreach($file in $files){
"Playing $($file.BaseName)" 
& $mpv "$file" # nejde --fs ??
sleep 1
}


