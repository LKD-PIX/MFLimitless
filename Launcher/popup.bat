@echo off
chcp 65001
mode 40,3
color 60
::echo    [30m [103mContinue ?[0m
echo [30m              ᴄᴏɴᴛɪɴᴜᴇ ?
echo [30m
@ping -n 3 localhost> nul
pause
del  %cd%\launcher\184329140234854879100123681893.bin
exit