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

$LocalAppData = "$AppData\Local"
New-Item -ItemType Directory -Path $LocalAppData -Force
$Env:LocalAppData = $LocalAppData

$LocalLowAppData = "$AppData\LocalLow"
New-Item -ItemType Directory -Path $LocalLowAppData -Force
$Env:LocalLowAppData = $LocalLowAppData
  
$应用程序 = "$PSScriptRoot\Application\UbisoftConnect.exe"
Start-Process -FilePath $应用程序

Exit
