# Check if Windows Package Manager (winget) is already installed
if (-Not (Test-Path -Path "$env:ProgramFiles\WindowsApps\Microsoft.DesktopAppInstaller_1.*\appxbundlemanifest.xml")) {
    # Download the winget installer
    Invoke-WebRequest -Uri 'https://aka.ms/winget-cli' -OutFile "$env:TEMP\winget-cli.msixbundle"
    
    # Install winget
    Add-AppxPackage -Path "$env:TEMP\winget-cli.msixbundle"
    
    # Wait for a moment to ensure winget is registered
    Start-Sleep -Seconds 5
    
    # Clean up the installer
    Remove-Item "$env:TEMP\winget-cli.msixbundle"
}

# Install packages using winget
$packages = @(
    "Brave.Brave",
    "Spotify",
    "Oracle.VirtualBox",
    "Microsoft.VisualStudioCode",
    "Syncthing",
    "qBittorrent",
    "Git",
    "Audient.EvoControl",
    "Tailscale"
)

foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install -e --id $package
}

Write-Host "Packages installation completed."
