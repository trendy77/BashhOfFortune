REM     HEY - in batch, this is a comment!
REM             The first non-comment line of a batch file is usually a command to turn off printing (ECHO’ing) of each batch file line.
@ECHO OFF
::      hack comment...'@' is a special operator to suppress printing of the command line. You restore printing of commands in your script with:
ECHO ON
SETLOCAL ENABLEEXTENSIONS
SET me=%~n0
SET whereInTree=%~dp0
REM             The SETLOCAL command ensures that I don’t clobber any existing variables after my script exits. 
REM             The ENABLEEXTENSIONS argument turns on a very helpful feature called command processor extensions. Trust me, you want command processor extensions. 
REM             I also store the name of the script (without the file extension) in a variable named %me%; I also store the parent path to the script in a variable named %parent%. 
REM             I use this variable to make fully qualified filepaths to any other files in the same directory as our script.

SET /A errno=0 
SET /A ERROR_HELP_SCREEN=1
SET /A ERROR_FILE_NOT_FOUND=2
SET /A ERROR_FILE_READ_ONLY=4
SET /A ERROR_UNKNOWN=8
IF %ERRORLEVEL% NEQ 0 SET /A errno^|=%ERROR_SOMECOMMAND_NOT_FOUND%

REM             see all set vars for sesh,,,
SET /?
REM             the current dir is... and to port into temp.txt....
DIR > results.txt
%me% >> results.txt
REM             or append...
C:\Program Files\Git\bin\sh .\algo 2>> results.txt
REM                     redirect stderr by using the file number 2 in front of the operator:

IF %ERRORLEVEL% NEQ 0 (
    SET /A errno^|=%ERROR_OTHERCOMMAND_FAILED%
    ECHO %~n0: /A
)
SET thisVar=%DATE%
SET cd=%CD%
ECHO %thisVar%
ECHO %~n0: cd is ....%cd%
ECHO %~n0: CD however, is ...%CD%
EXIT /B %errno%




REM             %USERPROFILE%\HelloWorld.cmd



::      run the script as %COMPSPEC% /C /D "C:\Users\User\SomeScriptPath.cmd" Arg1 Arg2 Arg3