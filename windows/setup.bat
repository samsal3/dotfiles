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
