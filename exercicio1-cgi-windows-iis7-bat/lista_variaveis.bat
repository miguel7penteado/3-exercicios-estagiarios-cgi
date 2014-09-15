@echo off

rem cabecalho CGI
echo Content-Type: text/html
echo.

rem Corpo CGI
echo ^<HTML^>
echo ^<BODY^>
echo ^<PRE^>Suas variaveis de sistema sao:
set
echo ^</PRE^>
echo ^</BODY^>
echo ^</HTML^>