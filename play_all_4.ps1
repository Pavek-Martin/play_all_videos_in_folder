cls

# vytvori batku v adresari najde vsechny soubory a udela seznam na prehravani v mpv.exe a furt prehrava vsechno dokola

#$pole_include = @("*.txt", "*.doc")
#$pole_include = @("*.fli","*.FLC") # toto nejni case senzitive ! ,"*. "
$pole_include = @("*.fli","*.FLC","*.mp4","*.avi","*.mpg") # toto nejni case senzitive ! ,"*. " FLC jako flc atd.

$files = @()
# $files += @(Get-ChildItem -Name) | Sort-Object
$files += @(Get-ChildItem -Include $pole_include -Name) | Sort-Object
$celkem_videi = $files.Length
echo "celkem videi v adresari $celkem_videi"
sleep 3

#exit 1

$out_array = @()
$out_array += "@echo off"
$out_array += "set /a p=1"
#$out_array += ":start" # udelav batce label :start
$out_array += "echo video %p%/$celkem_videi"
#$out_array += "set /a p=p+1"

for ( $aa=0; $aa -le $files.Length -1; $aa++) {
$out = 'mpv --mute -fs "'
$out += $files[$aa]
$out += '"'
echo $out
$out_array += $out
#}

$out_array += "set /a p=p+1"
$out_array += "echo video %p%/$celkem_videi"
}

#$out_array += "goto start" # po prehrani vseho, udela skok zpatky na zacatek na label :start
$out_array += "@echo on"

# zapise do souboru play_all.bat
$out_file_name = "_play_all.bat"
Set-Content -Path $out_file_name -Encoding ASCII -Value $out_array

sleep 5

