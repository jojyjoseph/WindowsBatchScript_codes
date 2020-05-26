SETLOCAL ENABLEEXTENSIONS

:: script global variables
SET me=%~n0
SET parent=%~dp0
SET log=%TEMP%\%me%.txt

::initializations
@echo off 
SETLOCAL 
CALL :logfunction %newline% %me%": log starting at %DATE%, %TIME%"

:: ################# Do Something here

ECHO Test support

:: ################################ END OF EXECUTION CODE ###############################################
ECHO Reached End of Execution
PAUSE
:: force execution to quit at the end of the "main" logic
EXIT /B %ERRORLEVEL%

:: ################################ FUNCTION DEFINITIONS #################################################

:: a function tee to do logging
:logfunction
ECHO %* >> "%log%"
ECHO %*
ECHO %log% : log file updated 
EXIT /B 0
