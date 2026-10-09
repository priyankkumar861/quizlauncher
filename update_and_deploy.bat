@echo off
chcp 65001 >nul
title QuizLauncher Auto Deployer
echo ===================================================
echo     🚀 QuizLauncher - One-Click Auto Deployer
echo ===================================================
echo.
echo [1/3] Adding modified files...
git add .
echo.
echo [2/3] Committing changes...
git commit -m "Auto-update quiz questions and engine"
echo.
echo [3/3] Pushing to GitHub...
git push -u origin main
echo.
if %errorlevel% equ 0 (
    echo ===================================================
    echo  SUCCESS! Changes pushed to GitHub.
    echo  Cloudflare Pages will update the live site in ~15s!
    echo ===================================================
) else (
    echo ===================================================
    echo  NOTE: Please check your internet or GitHub connection.
    echo ===================================================
)
echo.
pause
