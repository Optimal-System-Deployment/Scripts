# Function to check if a program is installed
function IsInstalled($programName) {
    return Get-Command $programName -ErrorAction SilentlyContinue
}

# Install Google Chrome
if (-not (IsInstalled "chrome.exe")) {
    Write-Host "Installing Google Chrome..."
    $chromeInstallerUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
    Start-Process -Wait -FilePath "$env:TEMP\chrome_installer.exe" -ArgumentList "/silent /install" -PassThru
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
