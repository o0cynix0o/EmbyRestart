#Use USERNAME to set the name of the user emby is installed as.

#Stopping Emby processes.

Stop-Process -Name "EmbyServer"

Stop-Process -Name "embytray"

#Pause for process to close. 

Start-Sleep -Seconds 5

#Start Emby

Start-Process -FilePath "C:\Users\USERNAME\AppData\Roaming\Emby-Server\system\EmbyServer.exe"