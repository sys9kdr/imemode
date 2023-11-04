@echo off

rem Set the paths and filenames
set CC=cl
set LINKER=link
set RM=del
set SOURCE_FILE=imemode.c
set OUTPUT_FILE=imemode.exe

rem Set compiler and linker flags
set CFLAGS=/nologo /MD /EHsc /O2 /GL /GS- /Gy /Oi /Ot /Oy /Ob2 /fp:fast /D "_CRT_SECURE_NO_WARNINGS"
set LDFLAGS=/NOLOGO /LTCG /RELEASE /INCREMENTAL:NO /SUBSYSTEM:CONSOLE /OPT:ICF /OPT:REF

%CC% %CFLAGS% /c %SOURCE_FILE%
%LINKER% /OUT:%OUTPUT_FILE% %SOURCE_FILE:.c=.obj% %LDFLAGS% imm32.lib user32.lib

rem delete obj files.
%RM% imemode.obj

rem Exit the script
exit /B
