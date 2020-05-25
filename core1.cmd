:: Tutorial starts from line 7
:: it's prefered to add line 3-5 in the beginning. Will be discussed later.
SETLOCAL ENABLEEXTENSIONS
SET me=%~n0
SET parent=%~dp0

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

REM Outside the local scope, shows the global value of foo
echo %foo%

REM Command line arguments passed to the script can be read by %0, %1, %n (argument position), Maximum 9 arguments are supported
:: echo %0 , will echo the name of the script itself
echo %0
:: echo %1, will show the first argument passed
echo %1

:: Line 3-5 , SETLOCAL ENABLEEXTENSIONS - turns on command processors extension. variable me has the name of the script being called (without extension *.cmd) and parent holds the path of the script.
echo %me% : file without extension
echo %parent% : path to the file