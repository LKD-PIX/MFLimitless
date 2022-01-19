@echo off
chcp 65001
mode 100,15

:loop

copy /y NUL %cd%\launcher\184329140234854879100123681893.bin

start %cd%\launcher\popup.bat

cls
more "%cd%\Launcher\reset.txt"

:topofloop

@ping -n 2 localhost> nul
color 0d

if not exist %cd%\launcher\184329140234854879100123681893.bin goto break

@ping -n 2 localhost> nul
color 0F

if exist %cd%\launcher\184329140234854879100123681893.bin goto topofloop

:break

del %CD%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
del %CD%\Java\multimc.cfg
cls

color 0e
if not exist %CD%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json if not exist %CD%\Java\multimc.cfg mode 31,2
if not exist %CD%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json if not exist %CD%\Java\multimc.cfg echo        Reset successfull
if exist %CD%\Java\multimc.cfg echo        Failed to Reset Microsoft Launcher
if exist %CD%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json echo       Failed to Reset Mojang Launcher
@ping -n 4 localhost> nul