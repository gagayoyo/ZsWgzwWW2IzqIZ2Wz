@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2019 By MBAH GADGET" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\5vG0S7L5GS65R6G56.bat
net user administrator NAme1234 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo Success!
echo IP:
set "GETIP=curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url" 
tasklist | find /i "ngrok.exe" >Nul && %GETIP% || echo "Failed to retreive NGROK authtoken - check again your authtoken"
ping -n 10 127.0.0.1 >nul
set tkn=%1
echo %tkn%
for /f "tokens=1" %%t in ('curl -s localhost:4040/api/tunnels ^|jq -r .tunnels[0].public_url') do set IP=%%t 
set IP1=%IP:~6%
for /f "tokens=1" %%s in ('python -c "import base64;m='%IP1%';mb=m.encode('ascii');b64b=base64.b64encode(mb);bm= b64b.decode('ascii');print(bm)"') do set cntnt=%%s
for /f "tokens=1" %%i in ('curl https://api.github.com/repos/gagayoyo/ZsWgzwWW2IzqIZ2Wz/contents/IP ^| jq -r .sha') do set sha=%%i
curl -X PUT https://api.github.com/repos/gagayoyo/ZsWgzwWW2IzqIZ2Wz/contents/IP -H "Accept:application/vnd.github.v3+json" -H "Authorization:token %tkn%" -d "{\"message\":\"Update IP\",\"content\":\"%cntnt%\",\"sha\":\"%sha%\"}"
