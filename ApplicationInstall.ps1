# Function to check if a program is installed
function IsInstalled($programName) {
    return Get-Command $programName -ErrorAction SilentlyContinue
}

# Install Google Chrome
if (-not (IsInstalled "chrome.exe")) {
    Write-Host "Installing Google Chrome..."
    $chromeInstallerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
    Start-Process -Wait -FilePath "$env:TEMP\chrome_installer.exe" -ArgumentList "/silent" -PassThru
    Remove-Item "$env:TEMP\chrome_installer.exe" -Force
    Write-Host "Google Chrome installed successfully."
} else {
    Write-Host "Google Chrome is already installed."
}


# Install Visual Studio Code
if (-not (IsInstalled "code.exe")) {
    Write-Host "Installing Visual Studio Code..."
    $vscodeInstallerUrl = "https://aka.ms/win32-x64-user-stable"
    Start-Process -Wait -FilePath "$env:TEMP\vscode_installer.exe" -ArgumentList "/VERYSILENT /NORESTART" -PassThru
    Remove-Item "$env:TEMP\vscode_installer.exe" -Force
    Write-Host "Visual Studio Code installed successfully."
} else {
    Write-Host "Visual Studio Code is already installed."
}

# Install Thunderbird (Email Client)
if (-not (IsInstalled "thunderbird.exe")) {
    Write-Host "Installing Thunderbird..."
    $thunderbirdInstallerUrl = "https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/latest/win64/en-US/Thunderbird%20Setup%20Latest.exe"
    Start-Process -Wait -FilePath "$env:TEMP\thunderbird_installer.exe" -ArgumentList "/S" -PassThru
    Remove-Item "$env:TEMP\thunderbird_installer.exe" -Force
    Write-Host "Thunderbird installed successfully."
} else {
    Write-Host "Thunderbird is already installed."
}

# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as an administrator."
    Exit
}

# Download MDT installer
$mdtInstallerUrl = "https://download.microsoft.com/download/9/1/3/9138773A-505D-43E2-AC08-9A77E1E0490B/MicrosoftDeploymentToolkit_x64.msi"
$mdtInstallerPath = "$env:TEMP\MDTInstaller.msi"

# Download MDT installer
Invoke-WebRequest -Uri $mdtInstallerUrl -OutFile $mdtInstallerPath

# Install MDT
Start-Process -Wait -FilePath msiexec -ArgumentList "/i $mdtInstallerPath /quiet /norestart"

# Clean up temporary files
Remove-Item -Path $mdtInstallerPath

Write-Host "MDT installation completed successfully."
