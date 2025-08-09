$脚本路径 = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
$起始目录 = [System.IO.Path]::GetDirectoryName($脚本路径)
$用户目录 = $Env:UserProfile

$UserProfile = "$起始目录\UserProfile"
[void](New-Item -ItemType Directory -Path $UserProfile -Force)
$Env:UserProfile = $UserProfile

$Temp = "$UserProfile\Temp"
[void](New-Item -ItemType Directory -Path $Temp -Force)
$Env:Temp = $Temp
$Env:Tmp = $Temp

$AppData = "$UserProfile\AppData"
[void](New-Item -ItemType Directory -Path $AppData -Force)

$Roaming = "$AppData\Roaming"
[void](New-Item -ItemType Directory -Path $Roaming -Force)
$Env:AppData = $Roaming

$LocalAppData = "$AppData\Local"
[void](New-Item -ItemType Directory -Path $LocalAppData -Force)
$Env:LocalAppData = $LocalAppData
  
$应用程序 = "$起始目录\Application\Windows\Code.exe"
If ($Args) { $Args = @{ArgumentList = $Args}} Else {$Args = @{}}
Start-Process -FilePath $应用程序 -Wait @Args

[void](Remove-Item -Path "$用户目录\.vscode" -Recurse -Force)

Exit
