# Check if winget is already installed
if (-Not (Get-Command winget -ErrorAction SilentlyContinue)) {
    # Download and install winget
    Invoke-WebRequest -Uri 'https://aka.ms/winget-cli' -OutFile "$env:TEMP\winget-cli.msix"
    Add-AppxPackage -Path "$env:TEMP\winget-cli.msixbundle"
    Start-Sleep -Seconds 5
    Remove-Item "$env:TEMP\winget-cli.msixbundle"
}

# Install packages using winget
$packages = @(
    "Brave.Brave",
    "Spotify.Spotify",
    "Oracle.VirtualBox",
    "Obsidian.Obsidian",
    "Microsoft.VisualStudioCode",
    "qBittorrent.qBittorrent",
    "Git.Git",
    "Audient.EVO",
    "tailscale.tailscale",
    "7zip.7zip",
    "SyncTrayzor.SyncTrayzor",
    "Valve.Steam",
    "YuzuEmu.Yuzu.Mainline",
    "Discord.Discord",
    "Balena.Etcher",
    "Microsoft.Powertoys"
)

Write-Host "Welcome to Heshel automatic set-up!"
Start-Sleep -Seconds 2
Write-Host "Starting package download..."
Start-Sleep -Seconds 2


foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install -e --id $package
}

Write-Host "Packages installation completed."
Write-Host "Removing pinned items on the task bar"

Remove-Item -Path "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Force -Recurse -ErrorAction SilentlyContinue
Stop-Process -ProcessName explorer -Force
Start-Process explorer


Write-Host "Starting to download ISOs..."
Write-Host "'Ctrl + C' to abort."
# Wait for 5 seconds
Start-Sleep -Seconds 20

# Define a list of URLs to open
$urls = @(
    "https://download.fedoraproject.org/pub/fedora/linux/releases/38/Server/aarch64/iso/Fedora-Server-dvd-aarch64-38-1.6.iso",
    "https://channels.nixos.org/nixos-23.05/latest-nixos-plasma5-x86_64-linux.iso"
)

# Loop through the list and open each URL in the default web browser
foreach ($url in $urls) {
    Start-Process $url
}

