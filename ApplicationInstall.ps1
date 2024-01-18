# Function to check if a program is installed
function IsInstalled($programName) {
    return Get-Command $programName -ErrorAction SilentlyContinue
}

# Install Google Chrome
$chromeInstallerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
Invoke-WebRequest -Uri $chromeInstallerUrl -OutFile "$env:TEMP\chrome_installer.exe"
Start-Process -Wait -FilePath "$env:TEMP\chrome_installer.exe" -ArgumentList
Remove-Item "$env:TEMP\chrome_installer.exe" -Force
Write-Host "Google Chrome installed successfully."



# Install Visual Studio Code
$vscodeInstallerUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
Invoke-WebRequest -Uri $vscodeInstallerUrl -OutFile "$env:TEMP\vscode_installer.exe"
Start-Process -Wait -FilePath "$env:TEMP\vscode_installer.exe"
Remove-Item "$env:TEMP\vscode_installer.exe" -Force
Write-Host "Visual Studio Code installed successfully."


# Install Thunderbird (Email Client)
$thunderbirdInstallerUrl = "https://download.mozilla.org/?product=thunderbird-115.6.1-SSL&os=win64&lang=en-US"
Invoke-WebRequest -Uri $thunderbirdInstallerUrl -OutFile "$env:TEMP\thunderbird_installer.exe"
Start-Process -Wait -FilePath "$env:TEMP\thunderbird_installer.exe"
Remove-Item "$env:TEMP\thunderbird_installer.exe" -Force
Write-Host "Thunderbird installed successfully."
