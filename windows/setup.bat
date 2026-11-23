@echo off
setlocal

rem Links this repo's configs into place for git, Windows Terminal and Vim.
rem Anything already at a target (file, folder or old link) is DELETED and
rem replaced by a symlink. Symlinks need Developer Mode or an admin prompt.

rem Repo root (parent of this script's folder), as a clean absolute path.
for %%I in ("%~dp0..") do set "ROOT=%%~fI"

rem Stop early if this shell can't create symlinks.
set "PROBE=%TEMP%\dotfiles-symlink-test-%RANDOM%"
mklink "%PROBE%" "%~f0" >nul 2>&1 || (
    echo Cannot create symlinks. Enable Developer Mode or run as administrator.
    exit /b 1
)
del "%PROBE%"

rem --- git ---
call :link "%USERPROFILE%\.gitconfig"    "%ROOT%\.gitconfig"
call :link "%USERPROFILE%\.git_template" "%ROOT%\.git_template"

rem --- Windows Terminal (Store install) ---
set "WT=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
call :link "%WT%\settings.json" "%~dp0terminal\settings.json"
rem The "verde" color scheme is loaded as a fragment.
call :link "%LOCALAPPDATA%\Microsoft\Windows Terminal\Fragments\dotfiles\verde.json" "%~dp0terminal\verde.json"

rem --- Vim: on Windows it reads ~/vimfiles/vimrc and ~/vimfiles/pack ---
call :link "%USERPROFILE%\vimfiles" "%ROOT%\.config\vim"

echo Done.
endlocal
exit /b 0

rem Replace %1 with a symlink to %2 (a file or a folder).
:link
if not exist "%~2" (
    echo Missing source "%~2", skipping.
    exit /b 0
)
if not exist "%~dp1" mkdir "%~dp1"
rem Remove what's there. "path\*" exists only for folders (and folder links).
if exist "%~1\*" (
    rem A plain rmdir removes a link or empty folder without touching its target.
    rmdir "%~1" 2>nul || rmdir /s /q "%~1"
) else if exist "%~1" (
    del /f /q "%~1"
) else (
    rem Clear a broken link, which "if exist" can't see.
    rmdir "%~1" 2>nul
    del /f /q "%~1" 2>nul
)
if exist "%~2\*" (
    mklink /D "%~1" "%~2" >nul
) else (
    mklink "%~1" "%~2" >nul
)
if errorlevel 1 (
    echo FAILED: "%~1"
) else (
    echo Linked "%~1" -^> "%~2"
)
exit /b 0
