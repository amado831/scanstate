  @echo off


:backup
set /p uname= Type the profile name you want to backup:
c:
if not exist c:\users\%uname% (
goto :tryagain
)else if exist c:\users\%uname% goto :scanstate

rem scanstate backup process and copying profile onto a network drive and folder
:scanstate
pushd \\********\***

%cd%\newtools\amd64\scanstate.exe /genconfig:config.xml /o 
%cd%\newtools\amd64\scanstate.exe %cd%\users\%uname% /ui:*\%uname% /ue:*\* /i:%cd%\newtools\amd64\MigApp.xml /i:%cd%\newtools\amd64\MigUser.xml /i:%cd%\newtools\amd64\MigDocs.xml /o /c
rem w:\newtools\amd64\scanstate.exe /all /i:w:\newtools\amd64\MigApp.xml /i:w:\newtools\amd64\MigUser.xml /i:w:\newtools\amd64\MigDocs.xml /o /c
goto :end
:tryagain
@echo Profile not found. Please try again
goto :backup


:end
