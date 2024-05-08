# Get all processes containing the word "emby"
$embyProcesses = Get-Process | Where-Object { $_.ProcessName -like "*emby*" }

# Check if any emby processes are running
if ($embyProcesses) {
    foreach ($process in $embyProcesses) {
        Write-Host "Service $($process.ProcessName) is running."
    }
} else {
    Write-Host "No Emby services found."
}

# Get Emby installation path
$embyInstallationPath = Get-ChildItem -Path "$env:APPDATA\Emby-Server\system\EmbyServer.exe" | Select-Object -ExpandProperty Directory


if ($embyInstallationPath) {
    Write-Host "Emby installation path found: $embyInstallationPath"
    
    #Stopping the running Emby processes.
    Write-Host "Stopping Emby, please stand by."
    Stop-Process -Name "*Emby*" -ErrorAction SilentlyContinue
    
    # Pause for 2 seconds
    Start-Sleep -Seconds 2
    
    # Start Emby Services
    $embyServerPath = Join-Path -Path $embyInstallationPath -ChildPath "EmbyServer.exe"
    
    if (Test-Path $embyServerPath) {
        Write-Host "Emby is starting up, please try to connect in five minutes."
        Start-Process -FilePath $embyServerPath -NoNewWindow
    } else {
        Write-Host "EmbyServer.exe not found in the Emby installation directory."
    }
} else {
    Write-Host "Emby installation path not found."
}
