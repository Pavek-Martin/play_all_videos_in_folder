@echo off
play_all_mute_50_procent_speed.exe
REM ^ aktualizuje sam sebe pred spustenim aktualniho obsahu adresare,tento soubor do adresare Windows
set /a p=1
echo video %p%/3
mpv --mute -fs -speed=0.5 "video_1.mp4"
set /a p=p+1
echo video %p%/3
mpv --mute -fs -speed=0.5 "video_2.mp4"
set /a p=p+1
echo video %p%/3
mpv --mute -fs -speed=0.5 "video_3.mp4"
set /a p=p+1
echo video %p%/3
@echo on
