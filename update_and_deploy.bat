@echo off
chcp 65001 >nul
title QuizLauncher Auto Deployer
echo ===================================================
echo     🚀 QuizLauncher - One-Click Auto Deployer
echo ===================================================
echo.
echo [1/4] Building and Obfuscating Code...
if exist source_index.html (
    node obfuscate_build.js
    if %errorlevel% neq 0 (
        echo [ERROR] Obfuscation build failed!
        pause
        exit /b 1
    )
) else (
    echo [INFO] No source_index.html found, skipping build step.
)
echo.
echo [2/4] Adding modified files...
git add .
echo.
echo [3/4] Committing changes...
git commit -m "Auto-update and protect quiz questions & engine"
echo.
echo [4/4] Pushing to GitHub...
git push -u origin main
echo.
if %errorlevel% equ 0 (
    echo ===================================================
    echo  SUCCESS! Changes pushed to GitHub.
    echo  Netlify will update your live site in ~15-20s!
    echo ===================================================
) else (
    echo ===================================================
    echo  NOTE: Please check your internet or GitHub connection.
    echo ===================================================
)
echo.
pause
