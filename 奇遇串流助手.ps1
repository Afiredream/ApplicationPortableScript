$UserProfile = "$PSScriptRoot\UserProfile"
New-Item -ItemType Directory -Path $UserProfile -Force
$Env:UserProfile = $UserProfile

$AppData = "$UserProfile\AppData"
New-Item -ItemType Directory -Path $AppData -Force

$Roaming = "$AppData\Roaming"
New-Item -ItemType Directory -Path $Roaming -Force
$Env:AppData = $Roaming

$Local = "$AppData\Local"
New-Item -ItemType Directory -Path $Local -Force
$Env:AppData = $Local

$应用程序 = "$PSScriptRoot\Application\奇遇VR串流助手.exe"
Start-Process -FilePath $应用程序

Exit
