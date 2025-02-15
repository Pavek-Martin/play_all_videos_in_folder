@echo off
echo "zadej cestu k video souborum "
echo "napr. C:\Users\DELL\Videos\Baudisova"
set /p cesta=""
echo "cesta = %cesta%"
pause
powershell -File ./play_video_dir_5_args_1.ps1 %cesta%
pause
echo on
