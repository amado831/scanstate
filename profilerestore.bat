@echo off
:restore
pushd \\fs.sc.fsu.edu\usmt
set /p uname= Type the name of the profile you wish to restore
if not exist %cd%\users\%uname% (
goto :tryagain
)else if exist %cd%\users\%uname% goto :loadstate
:loadstate
%cd%\newtools\amd64\loadstate %cd%\users\%uname% /i:%cd%\newtools\amd64\migdocs.xml /i:%cd%\newtools\amd64\miguser.xml
rem v:\newtools\amd64\loadstate v:\users\%uname% /i:v:\newtools\amd64\migdocs.xml /i:v:\newtools\amd64\miguser.xml
goto :end
:tryagain
@echo Profile not found. Please try again
goto :restore
:end

