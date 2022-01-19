set newcmdcmdline=%cmdcmdline:"=-%
echo %newcmdcmdline% | find /i "cmd /c --%~dpf0%-"
set "result=%errorlevel%"
@echo off
chcp 65001
mode 100,15
if exist %cd%\launcher\9909238479069007618302462056203520340239423750297529892347.bin goto :EXIT
if not exist %cd%\launcher\15409823704958720394750098234.bin goto recaster
del  %cd%\launcher\15409823704958720394750098234.bin
::setx JAVA_HOME "%cd%\Java\"
SET JAVA_HOME="%cd%\Java\"
::setx PATH "%cd%\Java\bin\javaw.exe"
SET PATH=%PATH%;%cd%\Java\bin
where /q Java || ECHO Java konnte nicht gefunden werden. && EXIT /B
echo Java Verzeichnis:
echo %JAVA_HOME%
timeout /t 1 
cls
set varJarPath=%cd:\=\\%
if not exist %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json (
echo %varJarPath%
echo { > %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo   "profiles": { >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo     "MFLimitless": { >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo       "name": "MFLimitless", >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo       "lastVersionId": "FabrPix-Loader-1.18.1", >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo       "javaDir": "%varJarPath%\\Java\\bin\\javaw.exe", >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo       "javaArgs": "-Xmx9G -XX:-UseAdaptiveSizePolicy -Xmn128M -XX:+UnlockExperimentalVMOptions -XX:+UseLargePages -XX:ParallelGCThreads\u003d3  -XX:+OptimizeStringConcat  -XX:+RangeCheckElimination -XX:+UseSuperWord -XX:+DoEscapeAnalysis -XX:+EliminateLocks", >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo       "useHopperCrashService": false, >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo       "launcherVisibilityOnGameClose": "keep the launcher open" >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo     } >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo   }, >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo   "selectedProfile": "MFLimitless", >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo   "authenticationDatabase": {}, >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo   "launcherVersion": { >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo     "name": "1.6.93", >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo     "format": 21, >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo     "profilesFormat": 1 >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo   } >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json
echo } >> %cd%\Java\instances\Magical_Friends_Limitless\.minecraft\launcher_profiles.json

)
set varJarPath=%cd:\=\\%
if not exist %cd%\Java\multimc.cfg (
echo %varJarPath%
echo Analytics=false >> %cd%\Java\multimc.cfg
echo AnalyticsClientID=b347b696-4cbc-448f-8000-c3f143f02a3d >> %cd%\Java\multimc.cfg
echo AnalyticsSeen=2 >> %cd%\Java\multimc.cfg
echo ApplicationTheme=dark >> %cd%\Java\multimc.cfg
echo AutoCloseConsole=false >> %cd%\Java\multimc.cfg
echo AutoUpdate=false >> %cd%\Java\multimc.cfg
echo CentralModsDir=mods >> %cd%\Java\multimc.cfg
echo ConsoleFont=Courier >> %cd%\Java\multimc.cfg
echo ConsoleFontSize=10 >> %cd%\Java\multimc.cfg
echo ConsoleMaxLines=100000 >> %cd%\Java\multimc.cfg
echo ConsoleOverflowStop=false >> %cd%\Java\multimc.cfg
echo ConsoleWindowGeometry=AdnQywACAAAAAAQEAAACQgAAB2gAAASoAAAEDAAAAmEAAAdgAAAEoAAAAAAAAAAACgA= >> %cd%\Java\multimc.cfg
echo ConsoleWindowState=AAAA/wAAAAD9AAAAAAAAA1UAAAJAAAAABAAAAAQAAAAIAAAACPwAAAAA >> %cd%\Java\multimc.cfg
echo IconTheme=pe_light >> %cd%\Java\multimc.cfg
echo IconsDir=icons >> %cd%\Java\multimc.cfg
echo InstSortMode=Name >> %cd%\Java\multimc.cfg
echo InstanceDir=instances >> %cd%\Java\multimc.cfg
echo JProfilerPath= >> %cd%\Java\multimc.cfg
echo JVisualVMPath= >> %cd%\Java\multimc.cfg
echo JavaArchitecture=64 >> %cd%\Java\multimc.cfg
echo JavaPath=%varJarPath%\\Java\\bin\\javaw.exe >> %cd%\Java\multimc.cfg
echo JavaTimestamp=1612725458592 >> %cd%\Java\multimc.cfg
echo JavaVersion=17.0.1 >> %cd%\Java\multimc.cfg
echo JsonEditor= >> %cd%\Java\multimc.cfg
echo JvmArgs=-XX:-UseAdaptiveSizePolicy -XX:+UnlockExperimentalVMOptions -XX:+UseLargePages -XX:ParallelGCThreads=3  -XX:+OptimizeStringConcat  -XX:+RangeCheckElimination -XX:+UseSuperWord -XX:+DoEscapeAnalysis -XX:+EliminateLocks >> %cd%\Java\multimc.cfg
echo Language=de >> %cd%\Java\multimc.cfg
echo LastHostname=Gaming-Computer-FL9SQQP >> %cd%\Java\multimc.cfg
echo LastUsedGroupForNewInstance= >> %cd%\Java\multimc.cfg
echo LaunchMaximized=true >> %cd%\Java\multimc.cfg
echo MCEditPath= >> %cd%\Java\multimc.cfg
echo MainWindowGeometry=AdnQywACAAAAAASUAAACXwAACCYAAAT9AAAEnAAAAn4AAAgeAAAE9QAAAAAAAAAACgA= >> %cd%\Java\multimc.cfg
echo MainWindowState=AAAA/wAAAAD9AAAAAAAAAvMAAAIcAAAABAAAAAQAAAAIAAAACPwAAAADAAAAAQAAAAEAAAAeAGkAbgBzAHQAYQBuAGMAZQBUAG8AbwBsAEIAYQByAwAAAAD/////AAAAAAAAAAAAAAACAAAAAQAAABYAbQBhAGkAbgBUAG8AbwBsAEIAYQByAQAAAAD/////AAAAAAAAAAAAAAADAAAAAQAAABYAbgBlAHcAcwBUAG8AbwBsAEIAYQByAQAAAAD/////AAAAAAAAAAA= >> %cd%\Java\multimc.cfg
echo MaxMemAlloc=9000 >> %cd%\Java\multimc.cfg
echo MinMemAlloc=9000 >> %cd%\Java\multimc.cfg
echo MinecraftWinHeight=480 >> %cd%\Java\multimc.cfg
echo MinecraftWinWidth=854 >> %cd%\Java\multimc.cfg
echo NewInstanceGeometry=AdnQywACAAAAAAPdAAADDQAABsYAAATQAAAD5QAAAywAAAa+AAAEyAAAAAAAAAAACgA= >> %cd%\Java\multimc.cfg
echo PagedGeometry=AdnQywACAAAAAAOwAAABngAAB34AAAQRAAADuAAAAb0AAAd2AAAECQAAAAAAAAAACgA= >> %cd%\Java\multimc.cfg
echo PasteEEAPIKey=multimc >> %cd%\Java\multimc.cfg
echo PermGen=128 >> %cd%\Java\multimc.cfg
echo PostExitCommand= >> %cd%\Java\multimc.cfg
echo PreLaunchCommand= >> %cd%\Java\multimc.cfg
echo ProxyAddr=127.0.0.1 >> %cd%\Java\multimc.cfg
echo ProxyPass= >> %cd%\Java\multimc.cfg
echo ProxyPort=8080 >> %cd%\Java\multimc.cfg
echo ProxyType=None >> %cd%\Java\multimc.cfg
echo ProxyUser= >> %cd%\Java\multimc.cfg
echo RecordGameTime=true >> %cd%\Java\multimc.cfg
echo SelectedInstance= >> %cd%\Java\multimc.cfg
echo ShowConsole=true >> %cd%\Java\multimc.cfg
echo ShowConsoleOnError=true >> %cd%\Java\multimc.cfg
echo ShowGameTime=true >> %cd%\Java\multimc.cfg
echo ShowGlobalGameTime=true >> %cd%\Java\multimc.cfg
echo ShownNotifications= >> %cd%\Java\multimc.cfg
echo UpdateChannel=stable >> %cd%\Java\multimc.cfg
echo UseNativeGLFW=false >> %cd%\Java\multimc.cfg
echo UseNativeOpenAL=false >> %cd%\Java\multimc.cfg
echo WrapperCommand= >> %cd%\Java\multimc.cfg
)
@echo off
copy /y NUL %cd%\launcher\184329140234854879100123681893.bin
start %cd%\launcher\popup.bat
cls
more "%cd%\launcher\warn.txt"
:topofloop
@ping -n 2 localhost> nul
color 0c
if not exist %cd%\launcher\184329140234854879100123681893.bin goto break
@ping -n 2 localhost> nul
color 0F
if exist %cd%\launcher\184329140234854879100123681893.bin goto topofloop
:break

:choice
cls
color 0F
more "%cd%\launcher\choice.txt"
set choice=
set /p choice=Gib deine Wahl ein und Drücke Enter: 
if '%choice%'=='1' goto :Mojank
if '%choice%'=='2' goto :Mijank
echo Wähl ne vernünftige Zahl du Depp.
@ping -n 2 localhost> nul
goto :choice
:Mojank
color 20
cls
mode 1000,1000
start "%cd%\Java\bin\javaw.exe" "%cd%\Launcher\launcher.jar" -Djavafx.userAgentStylesheetUrl=modena --workDir "%cd%\Java\instances\Magical_Friends_Limitless\.minecraft" --javaDir "%cd%\Java\bin\javaw.exe"
goto :EXIT
:Mijank
cls
color 40
cls
mode 1000,1000
start %cd%\Java\MultiMC.exe
goto :EXIT
:recaster
start %cd%\launcher\recaster.bat
:EXIT
exit
