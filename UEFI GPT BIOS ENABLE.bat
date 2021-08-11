@echo off
color 1f
cls
REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1
IF %ERRORLEVEL% EQU 0 goto chlan
IF %ERRORLEVEL% EQU 1 ECHO 

echo =====================================================
echo Este app precisa ser executado como administrador.
echo This app needs to be run as an administrator.
echo =====================================================
echo.
pause
exit

color 1f
cls
:chlan
color 1f
cls
echo ESCOLHA SUA LINGUAGEM
echo CHOOSE YOUR LANGUAGE
echo [1] PORTUGUES BRASIL
echo [2] ENGLISH
echo [3] CANCEL
echo [4] CANCELAR
set /p lanch=-----
if %lanch% equ 1 goto brazil
if %lanch% equ 2 goto english
if %lanch% equ 3 goto exit
if %lanch% equ 4 goto exit
goto chlan

:exit
exit

:brazil
color 1f
cls
color cf
echo EU NAO VOU SER RENSPONSAVEL POR NADA QUE VCS FIZEREM
echo FASSA SE VC TIVER CERTEZA QUE A SUA PLACA MAE SUPORTA UEFI E GPT
echo SE NAO VC VAI TENQUE ATUALIZAR A BIOS OU TROCAR DE PLACA MAE
echo [1] SIM EU QUERO FAZER COM OS RISCO
echo [2] NAO EU TENHO MEDO QUE PODE ACONTECER COM MEU COMPUTADOR
echo [3] CANCELAR
set /p risbra=-----
if %risbra% equ 1 goto simquefaz
if %risbra% equ 2 goto exit
if %risbra% equ 3 goto exit
goto brazil

:simquefaz
cls
color cf
echo TEM CERTEZA QUE QUER FAZER
echo ISSO PODE DANIFICAR SEU SISTEMA
echo NAO DESLIGUE SEU SISTEMA OU ESTA JANELA QUANDO TIVER FAZENDO O PROCESSO
echo QUANDO TERMINA A CONVERTESSAO DO LEGACY PARA UEFI
echo SEU COMPUTADOR VAI SER PRECISA A REINCIAR
echo [Y] SIM [N] NAO
set /p simquefazss=-----
if %simquefazss% equ Y goto instalargptuefi
if %simquefazss% equ y goto instalargptuefi
if %simquefazss% equ N goto exit
if %simquefazss% equ n goto exit
goto simquefaz

:instalargptuefi
cls
color 6f
echo NAO DESLIGUE SEU SISTEMA OU ESTA JANELA
cd %windir%\system32
mbr2gpt.exe /convert /allowfullos
cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
echo/msgbox "LEGACY PARA UEFI FOI COMPLETADO COMPLETAMENTE DO SEU COMPUTADOR VOCE PODE USAR APPLICATIVOS QUE SUPORTA UEFI", vbinformation, "finished" > finished.vbs
echo/@echo off >> fechar.bat
echo/color 2f >> fechar.bat
echo/cls >> fechar.bat
echo/start finished.vbs >> fechar.bat
echo/echo LIMPANDO ARQUIVOS DE LOG EM 3 SEGUNDOS >> fechar.bat
echo/timeout /t 3 >> fechar.bat
echo/cd /d "%~dp0" >> fechar.bat
echo/del *.* /S /Q >> fechar.bat
echo/exit >> fechar.bat
color 2f
echo PROCESSO DE CONVERTECAO LEGACY MBR PARA UEFI GPT
echo NAO FOI COMPLETADO 100 POR CENTO PORQUE O SISTEMA
echo NAO FOI REINCIADO, PRECIONE 1 PARA REINICIAR O WINDOWS
echo [1] REINICIAR AGORA
echo [2] REINICIAR MAIS TARDE
set /p chreini=-----
if %chreini% equ 1 goto reboot
if %chreini% equ 2 goto exit
goto instalargptuefi

:reboot
shutdown -r -t 0
exit

:english
color cf
cls
color cf
echo I WILL NOT BE RESPONSIBLE FOR ANYTHING YOU DO
echo DO IT IF YOU ARE SURE YOUR MOTHER CARD SUPPORTS UEFI AND GPT
echo IF NOT YOU WILL HAVE TO UPDATE THE BIOS OR CHANGE THE MOTHER BOARD
echo [1] SIM EU QUERO FAZER COM OS RISCO
echo [2] NAO EU TENHO MEDO QUE PODE ACONTECER COM MEU COMPUTADOR
echo [3] CANCELAR
set /p risbra=-----
if %risbra% equ 1 goto yesquefaz
if %risbra% equ 2 goto exit
if %risbra% equ 3 goto exit
goto english

:yesquefaz
color cf
cls
echo ARE YOU SURE YOU WANT TO DO
echo THIS MAY DAMAGE YOUR SYSTEM
echo DO NOT TURN OFF YOUR SYSTEM OR THIS WINDOW WHILE RUNNING THE PROCESS
echo WHEN THE LEGACY TO UEFI CONVERSION ENDS
echo YOUR COMPUTER WILL NEED A RESTART
echo [Y] YES [N] NO
set /p simquefazss=-----
if %simquefazss% equ Y goto installgptuefi
if %simquefazss% equ y goto installgptuefi
if %simquefazss% equ N goto exit
if %simquefazss% equ n goto exit
goto yesquefaz

:installgptuefi
cls
color 6f
echo DO NOT TURN OFF YOUR SYSTEM OR THIS WINDOW
cd %windir%\system32
mbr2gpt.exe /convert /allowfullos
cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
echo/msgbox "LEGACY BIOS FOR UEFI BIOS HAS BEEN COMPLETELY COMPLETED FROM YOUR COMPUTER YOU CAN USE APPS THAT SUPPORT UEFI", vbiformation, "finished" > finished.vbs
echo/@echo off >> fechar.bat
echo/color 2f >> fechar.bat
echo/cls >> fechar.bat
echo/start finished.vbs >> fechar.bat
echo/echo CLEARING LOG FILES IN 3 SECONDS >> fechar.bat
echo/timeout /t 3 >> fechar.bat
echo/cd /d "%~dp0" >> fechar.bat
echo/del *.* /S /Q >> fechar.bat
echo/exit >> fechar.bat
color 2f
echo LEGACY MBR TO UEFI GPT CONVERT PROCESS
echo NOT COMPLETED 100 PERCENT BECAUSE THE SYSTEM
echo NOT RESTARTED, PRICE 1 TO RESTART WINDOWS
echo [1] REBOOT SYSTEM NOW
echo [2] REBOOT LATER
set /p chreini=-----
if %chreini% equ 1 goto reboot
if %chreini% equ 2 goto exit
goto installgptuefi