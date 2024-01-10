# Enable File and Printer Sharing
Set-NetFirewallProfile -Profile Private,Public -Enabled True

# Enable Network Discovery
Set-NetConnectionProfile -NetworkCategory Private -NetworkDiscovery Enabled
Set-NetConnectionProfile -NetworkCategory Public -NetworkDiscovery Enabled

# Allow File and Printer Sharing through the firewall
Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

# Display the updated settings
Get-NetFirewallProfile | Select-Object Name,Enabled
Get-NetConnectionProfile | Select-Object Name,NetworkDiscovery
