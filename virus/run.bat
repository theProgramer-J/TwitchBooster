@echo off
call :isAdmin
 if %errorlevel% == 0 (
    goto :run
 ) else (
    goto :UACPrompt
 )

 exit /b

 :isAdmin
    fsutil dirty query %systemdrive% >nul
 exit /b

 :UACPrompt
   echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
   echo UAC.ShellExecute "cmd.exe", "/c cd %CD%&%~s0", "", "runas", 1 >> "%temp%\getadmin.vbs"
   "%temp%\getadmin.vbs"
   del "%temp%\getadmin.vbs"
  exit /B`
:run
wscript.exe "invisible.vbs" "Hidden.bat"
