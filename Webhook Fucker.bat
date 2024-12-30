@echo off
cls 
chcp 65001 >nul
title MultiTool - Login

:login
cls
color c
echo.
echo.                               ██     ██ ███████ ██████  ██   ██  ██████   ██████  ██   ██ 
echo.                               ██     ██ ██      ██   ██ ██   ██ ██    ██ ██    ██ ██  ██     
echo.                               ██  █  ██ █████   ██████  ███████ ██    ██ ██    ██ █████  
echo.                               ██ ███ ██ ██      ██   ██ ██   ██ ██    ██ ██    ██ ██  ██
echo.                                ███ ███  ███████ ██████  ██   ██  ██████   ██████  ██   ██
echo.                                           ┌────────────────────────────────┐
echo.                                           │    Please log in to continue   │
echo.                                           └────────────────────────────────┘
echo.
set /p username= Enter Username: 
set /p password= Enter Password: 
if "%username%"=="max" if "%password%"=="123" goto mainmenu
if "%username%"=="max2" if "%password%"=="123" goto mainmenu
if "%username%"=="max3" if "%password%"=="123" goto mainmenu
echo Incorrect login. Please try again.
pause
goto login

:mainmenu
cls
color D
echo.
echo.                               ██     ██ ███████ ██████  ██   ██  ██████   ██████  ██   ██ 
echo.                               ██     ██ ██      ██   ██ ██   ██ ██    ██ ██    ██ ██  ██     
echo.                               ██  █  ██ █████   ██████  ███████ ██    ██ ██    ██ █████  
echo.                               ██ ███ ██ ██      ██   ██ ██   ██ ██    ██ ██    ██ ██  ██
echo.                                ███ ███  ███████ ██████  ██   ██  ██████   ██████  ██   ██ 
echo.
echo.
echo.                                           ┌────────────────────────────────┐
echo.                                           │ 1. Send a single message       │
echo.                                           │ 2. Send multiple messages      │
echo.                                           │ 3. Get webhook information     │
echo.                                           │ 4. Save webhook URL            │
echo.                                           │ 5. How to use and safety       │
echo.                                           │ 6. Credits                     │
echo.                                           │ 0. Quit                        │
echo.                                           └────────────────────────────────┘
echo.
echo.                                               Educational purposes only
echo.                                                Dont use to harm others. 
set /p input= Select an option: 

if "%input%"=="1" goto send_single
if "%input%"=="2" goto send_multiple
if "%input%"=="3" goto get_info
if "%input%"=="4" goto save_webhook
if "%input%"=="5" goto guide
if "%input%"=="6" goto credits
if "%input%"=="0" goto exit
goto mainmenu

:send_single
cls
echo.
echo.                               ██     ██ ███████ ██████  ██   ██  ██████   ██████  ██   ██ 
echo.                               ██     ██ ██      ██   ██ ██   ██ ██    ██ ██    ██ ██  ██     
echo.                               ██  █  ██ █████   ██████  ███████ ██    ██ ██    ██ █████  
echo.                               ██ ███ ██ ██      ██   ██ ██   ██ ██    ██ ██    ██ ██  ██
echo.                                ███ ███  ███████ ██████  ██   ██  ██████   ██████  ██   ██ 
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
set /p webhook_url=Enter the webhook URL: 
set /p message=Enter the message to send: 
curl -H "Content-Type: application/json" -d "{\"content\": \"%message%\"}" %webhook_url%
cls
echo [1] [Message sent]
pause
goto mainmenu

:send_multiple
cls
echo.
echo.                               ██     ██ ███████ ██████  ██   ██  ██████   ██████  ██   ██ 
echo.                               ██     ██ ██      ██   ██ ██   ██ ██    ██ ██    ██ ██  ██     
echo.                               ██  █  ██ █████   ██████  ███████ ██    ██ ██    ██ █████  
echo.                               ██ ███ ██ ██      ██   ██ ██   ██ ██    ██ ██    ██ ██  ██
echo.                                ███ ███  ███████ ██████  ██   ██  ██████   ██████  ██   ██ 
echo.⠀⠀⠀⠀⠀⠀⠀
set /p webhook_url=Enter the webhook URL: 
set /p count=How many messages do you want to send? 
set /p message=Enter the message to send: 
for /L %%i in (1,1,%count%) do (
	cls
    curl -H "Content-Type: application/json" -d "{\"content\": \"%message%\"}" %webhook_url%
    echo [%%i] [Message sent]
)
pause
goto mainmenu

:get_info
set /p webhook_url=Enter the webhook URL: 
curl -X GET %webhook_url%
pause
goto mainmenu

:save_webhook
set /p webhook_url=Enter the webhook URL to save: 
set /p filename=Enter the filename (without extension): 
set "filepath=data\%filename%.txt"

:: Create the data directory if it doesn't exist
if not exist data (
    mkdir data
)

echo %webhook_url% > "%filepath%"
echo Webhook URL saved to %filepath%.
pause
goto mainmenu


:guide
cls
color b
echo.
echo.                                           ┌────────────────────────────────┐
echo.                                           │        GUIDE AND SAFETY        │
echo.                                           └────────────────────────────────┘
echo.
echo.
echo.
echo. [Send single message] = Sends a single message with given webhook URL.
echo. [Send multiple messages] = Send/spam the same message multiple times.
echo. [Get webhook information] = Shows information about the webhook, and the server its in.
echo. [Save webhook URL] = Allows you to save the webhook url to the data folder
echo. [Guide] = Opens this guide
echo. [Credits] = Shows credits of the tool.
echo.
echo.
echo. This tool is meant for educational purposes only, dont use it to harm others.
echo. Keep in mind if you use this tool maliciously you can recieve termination from discord.
echo. Use your brain when using this tool.
echo.
pause
goto mainmenu


:credits
cls
color b
echo.
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⢿⣧⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣶⣶⡀⠀⠀⢀⡴⠛⠁⠀⠘⣿⡄⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣷⣤⡴⠋⠀⠀⠀⠀⠀⢿⣇⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⢸⣿⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠈⣿⡀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢏⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣿⡇
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣷⣾⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⢿⡇⠀⠀⠀⠀CREDIT
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⢸⡇⠀⠀Marcus.4440
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠁⢹⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⢸⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠟⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⢸⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠋⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠃
echo.
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀DO NOT USE THE TOOL TO HARM OTHERS
echo.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀MADE FOR PERSONAL USE, EDUCATIONAL PURPOSES
echo.
echo.
echo.
echo.
pause
goto mainmenu

:exit
cls
color 4
echo.
echo.
echo.
echo.                                           ┌────────────────────────────────┐
echo.                                           │          ARE YOU SURE?         │
echo.                                           └────────────────────────────────┘
echo.
echo.                                                         1 = Yes
echo.                                                         2 = No
set /p input= Select an option: 

if "%input%"=="1" exit
if "%input%"=="2" goto mainmenu