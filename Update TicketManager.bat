@echo off
set "source_path=P:\Sistemas\Rafael\Rafael Programas\Tickets"
set "destination_path=C:\Tickets"

robocopy "%source_path%" "%destination_path%" /E

if %errorlevel% equ 0 (
    msg * El programa se actualizo correctamente.
) else (
    msg * Error!, no se pudo actualizar el programa. Contacte a sistemas.
)