$UserProfile = "$PSScriptRoot\UserProfile"
New-Item -ItemType Directory -Path $UserProfile -Force
$Env:UserProfile = $UserProfile

$Temp = "$UserProfile\Temp"
New-Item -ItemType Directory -Path $Temp -Force
$Env:Temp = $Temp
$Env:Tmp = $Temp

$AppData = "$UserProfile\AppData"
New-Item -ItemType Directory -Path $AppData -Force

$Roaming = "$AppData\Roaming"
New-Item -ItemType Directory -Path $Roaming -Force
$Env:AppData = $Roaming

$Local = "$AppData\Local"
New-Item -ItemType Directory -Path $Local -Force
$Env:AppData = $Local

$LocalLow = "$AppData\LocalLow"
New-Item -ItemType Directory -Path $LocalLow -Force
$Env:AppData = $LocalLow

$应用程序 = "$PSScriptRoot\Application\steam.exe"
Start-Process -FilePath $应用程序

Exit
