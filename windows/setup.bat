@echo off
setlocal

rem Repo root (parent of this script's folder), as a clean absolute path.
for %%I in ("%~dp0..") do set "ROOT=%%~fI"

rem Backups for this run go in windows\tmp\backup-N (first unused number).
set /a N=1
:next_backup
if exist "%~dp0tmp\backup-%N%" (
    set /a N+=1
    goto next_backup
)
set "BACKUP=%~dp0tmp\backup-%N%"

rem --- nvim: link repo config to where Neovim looks on Windows ---
call :backup "%LOCALAPPDATA%\nvim"
mklink /J "%LOCALAPPDATA%\nvim" "%ROOT%\.config\nvim"

rem --- .git_template: folder, so a junction works ---
call :backup "%USERPROFILE%\.git_template"
mklink /J "%USERPROFILE%\.git_template" "%ROOT%\.git_template"

rem --- .gitconfig: a file, so it needs a file symlink (mklink without /J;
rem     requires Developer Mode or an elevated prompt). Contents are never
rem     edited: the old file is backed up and replaced by the link.
call :backup "%USERPROFILE%\.gitconfig"
mklink "%USERPROFILE%\.gitconfig" "%ROOT%\.gitconfig" || (
    echo Could not create the symlink. Run as admin or enable Developer Mode.
    if exist "%BACKUP%\.gitconfig" (
        echo Restoring the original .gitconfig.
        move "%BACKUP%\.gitconfig" "%USERPROFILE%\.gitconfig" >nul
    )
)

rem --- Windows Terminal: settings and the verde scheme (fragment). File
rem     symlinks, so the same Developer Mode / admin rule applies. Whatever is
rem     there is replaced without a backup.
set "WT_SETTINGS=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
set "WT_FRAGMENTS=%LOCALAPPDATA%\Microsoft\Windows Terminal\Fragments\dotfiles"
call :link_file "%WT_SETTINGS%" "settings.json" "%ROOT%\windows\terminal\settings.json"
call :link_file "%WT_FRAGMENTS%" "verde.json" "%ROOT%\windows\terminal\verde.json"

endlocal
exit /b 0

rem Move an existing file/folder into this run's backup folder so nothing is lost.
:backup
if exist "%~1" (
    if not exist "%BACKUP%" mkdir "%BACKUP%"
    echo Backing up "%~1" to "%BACKUP%\%~nx1"
    move "%~1" "%BACKUP%\%~nx1" >nul || exit 1
)
exit /b 0

rem Replace %1\%2 with a file symlink to %3, creating folder %1 if needed.
:link_file
if not exist "%~1" mkdir "%~1"
rem No "if exist": it follows the link, so a dangling old link would be kept.
del /f /q "%~1\%~2" 2>nul
mklink "%~1\%~2" "%~3" || echo Could not link "%~1\%~2". Run as admin or enable Developer Mode.
exit /b 0
