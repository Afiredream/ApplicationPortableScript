If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  Start-Process -FilePath $Env:PowerShell -ArgumentList $PSCommandPath -Verb RunAs
  Exit
}

$UserProfile = "$PSScriptRoot\UserProfile"
New-Item -ItemType Directory -Path $UserProfile -Force
$Env:UserProfile = $UserProfile

$AppData = "$UserProfile\AppData"
New-Item -ItemType Directory -Path $AppData -Force

$Roaming = "$AppData\Roaming"
New-Item -ItemType Directory -Path $Roaming -Force
$Env:AppData = $Roaming

$Program = "$UserProfile\Program"
New-Item -ItemType Directory -Path $Program -Force

$ProgramData = "$Program\ProgramData"
New-Item -ItemType Directory -Path $ProgramData -Force

$目标路径 = "$Env:ProgramData\RayLink"
$文件路径 = "$ProgramData\RayLink"
Remove-Item -Path $目标路径 -Recurse -Force
New-Item -ItemType Directory -Path $文件路径 -Force
New-Item -ItemType SymbolicLink -Path $目标路径 -Target $文件路径

$应用程序 = "$PSScriptRoot\Application\RayLink.exe"
Start-Process -FilePath $应用程序 -Wait

Stop-Process -Name "RayLinkWatch" -Force
Remove-Item -Path $目标路径 -Recurse -Force

Exit
