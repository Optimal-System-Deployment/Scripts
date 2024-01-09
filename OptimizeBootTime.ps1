# Disable unnecessary startup programs
Get-CimInstance Win32_StartupCommand | ForEach-Object {
    Disable-ScheduledTask -TaskName $_.Name -Confirm:$false
}

# Disable unnecessary services
$servicesToDisable = @(
    "AdobeARMservice",
    "wuauserv",         # Windows Update
    "wercplsupport",    # Problem Reports and Solutions Control Panel Support
    "WerSvc",           # Windows Error Reporting Service
    "DiagTrack",        # Diagnostics Tracking Service
    "DoSvc",            # Delivery Optimization
    "MapsBroker",       # Downloaded Maps Manager
    "TrustedInstaller"  # Windows Modules Installer
)

foreach ($service in $servicesToDisable) {
    Stop-Service -Name $service -Force
    Set-Service -Name $service -StartupType Disabled
}

# Set power plan to high performance
powercfg /L | Select-String 'Power Setting Index: \d+' | ForEach-Object {
    $powerSettingIndex = $_.Matches[0].Value -replace '\D'
    powercfg /S $powerSettingIndex
}
