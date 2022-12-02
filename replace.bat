@ECHO OFF
color 06
echo All image files in current directory:
dir /b /a-d *.png *.jpg *.jpeg
echo.
set /p "name=? Enter Wallpaper name: "
del /f ".\TranscodedWallpaper"
copy ".\%name%" ".\%name%.bak"
rename ".\%name%" "TranscodedWallpaper"
IF %ERRORLEVEL% NEQ 0 (color 04 &echo Wallpaper was not found! &cmd /k)
copy ".\%name%.bak" ".\%name%"
del /f ".\%name%.bak"
copy /v /y TranscodedWallpaper %appdata%\Microsoft\Windows\Themes\
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True
cls
color 0A
echo Wallpaper changed!
echo.
echo Press any key to exit . . .
pause>nul