cls

# vytvori batku v adresari najde vsechny soubory a udela seznam na prehravani v mpv.exe a furt prehrava vsechno dokola

Write-Host -ForegroundColor Yellow "videa budou BEZ zvuku"

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


if ( $celkem_videi -ne 0 ){
# zapise do souboru play_all.bat, jen kdyz je co zapisovat
$out_file_name = "_play_all.bat"
Set-Content -Path $out_file_name -Encoding ASCII -Value $out_array
}

sleep 5

