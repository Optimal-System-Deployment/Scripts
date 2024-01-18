# Function to check if a program is installed
function IsInstalled($programName) {
    return Get-Command $programName -ErrorAction SilentlyContinue
}

# Install Google Chrome
$chromeInstallerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
Invoke-WebRequest -Uri $chromeInstallerUrl -OutFile "$env:TEMP\chrome_installer.exe"
Start-Process -Wait -FilePath "$env:TEMP\chrome_installer.exe" -ArgumentList "/silent"
Remove-Item "$env:TEMP\chrome_installer.exe" -Force
Write-Host "Google Chrome installed successfully."



# Install Visual Studio Code
$vscodeInstallerUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
Invoke-WebRequest -Uri $vscodeInstallerUrl -OutFile "$env:TEMP\vscode_installer.exe"
Start-Process -Wait -FilePath "$env:TEMP\vscode_installer.exe"
Remove-Item "$env:TEMP\vscode_installer.exe" -Force
Write-Host "Visual Studio Code installed successfully."


# Install Thunderbird (Email Client)
$thunderbirdInstallerUrl = "https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/latest/win64/en-US/Thunderbird%20Setup%20Latest.exe"
Invoke-WebRequest -Uri $thunderbirdInstallerUrl -OutFile "$env:TEMP\thunderbird_installer.exe"
Start-Process -Wait -FilePath "$env:TEMP\thunderbird_installer.exe"
Remove-Item "$env:TEMP\thunderbird_installer.exe" -Force
Write-Host "Thunderbird installed successfully."

# Download MDT installer
$mdtInstallerUrl = "https://download.microsoft.com/download/9/1/3/9138773A-505D-43E2-AC08-9A77E1E0490B/MicrosoftDeploymentToolkit_x64.msi"
$mdtInstallerPath = "$env:TEMP\MDTInstaller.msi"

Invoke-WebRequest -Uri $mdtInstallerUrl -OutFile $mdtInstallerPath

# Install MDT
Start-Process -Wait -FilePath msiexec.exe -ArgumentList "/i `"$mdtInstallerPath`" /quiet /norestart"

# Clean up temporary files
Remove-Item -Path $mdtInstallerPath -Force

Write-Host "MDT installation completed successfully."
