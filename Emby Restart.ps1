Stop-Process -Name "EmbyServer"
Stop-Process -Name "embytray"
Start-Sleep -Seconds 5
Start-Process -FilePath "C:\Users\danwatson\AppData\Roaming\Emby-Server\system\EmbyServer.exe"