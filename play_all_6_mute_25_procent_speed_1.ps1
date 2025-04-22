cls

# vytvori batku v adresari najde vsechny soubory a udela seznam na prehravani v mpv.exe a furt prehrava vsechno dokola

Write-Host -ForegroundColor Yellow "videa budou BEZ zvuku a bude 25 % puvodni rychlost"

#$pole_include = @("*.txt", "*.doc")
#$pole_include = @("*.fli","*.FLC") # toto nejni case senzitive ! ,"*. "

$pole_include = @("*.fli","*.FLC","*.mp4","*.avi","*.mpg") # toto nejni case senzitive ! ,"*. " FLC jako flc atd.

$files_celkem = @()
$files_celkem += @(Get-ChildItem -Name)

$files = @()
# $files += @(Get-ChildItem -Name) | Sort-Object
$files += @(Get-ChildItem -Include $pole_include -Name) | Sort-Object
$celkem_videi = $files.Length
$celkem_souboru = $files_celkem.Length

echo "celkem videi v adresari $celkem_videi"
echo "celkem vsech souboru v adresari $celkem_souboru"
sleep 5

#exit 1

$out_array = @()
$out_array += "@echo off"

$out_array += "play_all_mute_25_procent_speed.exe" # stimto nazvem to bude zkompilovany a pak v davce zavola toto a vlastne se akualizuje
# a spusti se uz s aktualnim seznamem videi ve slozce, drive su muselo napred ruzne aktualizovat a pak spustit davku
# takle se vsechno zjednodusuje, soubor *.exe pak nakopirovat nekam do cesty PATH a nebo treba do adrease Windows
$out_array += "REM ^ aktualizuje sam sebe pred spustenim aktualniho obsahu adresare,tento soubor do adresare Windows"

$out_array += "set /a p=1"
#$out_array += ":start" # udelav batce label :start
$out_array += "echo video %p%/$celkem_videi"
#$out_array += "set /a p=p+1"

for ( $aa=0; $aa -le $files.Length -1; $aa++) {
$out = 'mpv --mute -fs -speed=0.25 "'
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


if ( $celkem_videi -ne 0 ){
# zapise do souboru play_all.bat, jen kdyz je co zapisovat
$out_file_name = "_play_all_mute_25.bat"
Set-Content -Path $out_file_name -Encoding ASCII -Value $out_array
}

sleep 5

