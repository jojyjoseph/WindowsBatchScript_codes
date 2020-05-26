:: Tutorial starts from line 10
:: it's prefered to add SETLOCAL ENABLEEXTENSIONS in the beginning. Will be discussed later.
SETLOCAL ENABLEEXTENSIONS

:: script global variables
SET me=%~n0
SET parent=%~dp0
SET log=%TEMP%\%me%.txt

::initializations
@echo off 
SETLOCAL 
CALL :logfunction %newline% %me%": log starting at %DATE%, %TIME%"

ECHO Initialization over. Comments section next.
PAUSE

REM This is comments

:: ############## Comments #######################
REM ############## Comments #######################

:: ECHO OFF starts with @, following that echo is turned off
@ECHO OFF
REM This comment will not be shown

:: Following comment will be shown after the ECHO is turned ON.
ECHO ON
REM This comment will be shown.

REM Following comments can be used as code comments and won't be executed unlike REM which echo in the command editor.
:: Remarks, code comments.

ECHO Comment section over. Variable section next.
PAUSEE


:: ############## Variables ######################
REM ############## Variables ######################

:: set a variable
SET foo=barbar
:: no space bar is allowed, e.g. set foo = bar is incorrect

:: If an evaluation has to be done, during assignment. Use lowercase for variable names as uppercases are used for System environment varaiables.
SET /A four=2+2
echo %four%
:: assign variable another variable
SET foo2=%foo%

:: value of a variable can be known by echo with %VariableName%, eg, %four% as shown above.
:: It's a good idea to check if the variable is already use, For. e.g.
echo %temp%
:: DOS is case insensitive, Thus, %TEMP% and %temp% gives the same output.
:: DOS also has few dynamic command like variables as shown. Be carefull not to override it.

REM DATE
echo %DATE%
REM RANDOM
echo %RANDOM%
REM CD
echo %CD%

REM To see all the variable, simply call SET
SET

REM The above list only shows the System environment variable, But to see the dynamic system variables  use SET /?
::SET /?

REM Scope of Variables
SET foo=bar
:: foo had been defined earlier, but reassigning overrides the previous definition.
:: foo in the global namespace has the value 'bar'
echo %foo%

:: a local scope can be created to change the variable value locally. A local scope is created by SETLOCAL, and ended by ENDLOCAL 
SETLOCAL
REM shows the local value of foo
set foo=barbarbar
echo %foo%
::This can be used to set some environment variable like PATH and help locate a command in specific path.
set PATH=D:/
echo %PATH%
ENDLOCAL

ECHO Initialization done. Move ahead
PAUSE

:: Outside the local scope, shows the global value of foo
echo %foo%

:: Command line arguments passed to the script can be read by %0, %1, %n (argument position), Maximum 9 arguments are supported
:: echo %0 , will echo the name of the script itself
echo %0
:: echo %1, will show the first argument passed
echo %1

:: Line 3-5 , SETLOCAL ENABLEEXTENSIONS - turns on command processors extension. variable me has the name of the script being called (without extension *.cmd) and parent holds the path of the script.
echo %me% : file without extension
echo %parent% : path to the file

:: delayed expansion eg.
@echo off
SETLOCAL EnableDelayedExpansion
Set "_var=first"
Set "_var=second" & Echo %_var% !_var!

:: Swapping example with delayed example
Rem Delayed Expansion example
set var1=first
set var2=second
set "var1=%var2%" & set "var2=%var1%"
echo Var1 : %var1%
echo Var2 : %var2%

ECHO Variable section over. Function section next.
PAUSE

:: ############## Functions ######################
REM ############## Functions ######################

:: functions to be defined after the main exit code

:: This next 3 lines is the way to invoke a function
@echo off 
SETLOCAL 
CALL :logfunction "%me%: Hello, world!"

:: This next 3 lines is the way to invoke a function with 2 parameters
@echo off 
SETLOCAL 
CALL :Display 5,10

:: Function to return value
@echo off 
SETLOCAL 
CALL :SetValue value1,value2

:: Test the return values
echo on
echo "Return Value1 : %value1%"
echo "Return Value2 : %value2%"
@echo off

ECHO Function section over. Loop section next
PAUSE
:: ############## Loop ######################
REM ############## Loop ####################

:: Basic loop (1,1,100) means lowervalue =1 , increment =1, uppervalue =100, \L indicates that it's a loop; %%x is for variable declaration in loop.
for /L %%x in (1, 1, 100) do (
   echo %%x
)

ECHO Loop section over. Invoking other Batch script file section next
PAUSE
:: ############## Invoking Other Batch script file ######################
REM ################ Invoking Other Batch script file ######################

CALL core1_support1.cmd argument1 argument2

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

:: a function called with 2 parameters
:Display
echo The value of parameter 1 is %~1
echo The value of parameter 2 is %~2
EXIT /B 0

:: a function with 2 return values
:SetValue
set "%~1=5"
set "%~2=String"
EXIT /B 0




