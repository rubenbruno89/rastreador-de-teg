@echo off
cls
echo ----------------------------------------------------------------
echo  RASTREAMENTO DE TEG OU ETIQUETA DE SERVICO
echo ----------------------------------------------------------------
:loop
echo.
set /p host=Digite o host ou ip da maquina:
ping %host% -v -a -n 2 | find "TTL" >> resul.txt
if errorlevel 1 (
echo %host% esta fora da rede ou  desligado, tente mais tarde.
) else (
echo %host% esta online
powershell -command "Get-WmiObject -Class Win32_BIOS -ComputerName %host% | Select SerialNumber"
type resul.txt | findstr /C:"console"
del resul.txt
)
goto loop