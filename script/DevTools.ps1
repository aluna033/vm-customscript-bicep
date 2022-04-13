$ErrorActionPreference="SilentlyContinue"
$LogPath = 'C:\WindowsAzure\Logs\devtools.log'
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path $LogPath -append
Install-WindowsFeature -name Web-Server -IncludeManagementTools
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install microsoft-edge -y --no-progress --log-file=$LogPath
choco install azcopy10 -y --no-progress --log-file=$LogPath
choco install vscode -y --no-progress --log-file=$LogPath
choco install vscode-java -y --no-progress --log-file=$LogPath
choco install vscode-powershell -y --no-progress --log-file=$LogPath
choco install vscode-git -y --no-progress --log-file=$LogPath
choco install sql-server-management-studio -y --no-progress --log-file=$LogPath