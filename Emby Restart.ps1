#Use USERNAME to set the name of the user emby is installed as.

#Stopping the running Emby processes.

Write-Host "Stopping Emby Services. Please stand by."
Stop-Process -Name "EmbyServer"
Stop-Process -Name "embytray"

#Pause for process to close 

Start-Sleep -Seconds 1

#Start Emby Services

Write-Host "Starting Emby back up."

Start-Process -FilePath "C:\Users\USERNAME\AppData\Roaming\Emby-Server\system\EmbyServer.exe"

Start-Sleep -Seconds 5

#Script End

Write-Host "Should be good to go now."

Exit