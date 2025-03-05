@echo off
setlocal EnableDelayedExpansion

REM Collect directories that end in a digit:
echo Listing directories in C:\Users that end in a digit...

set "NumericDirs="

for /d %%A in ("C:\Users\*") do (
    set "DirName=%%~nxA"
    if "!DirName:~-1!" GEQ "0" if "!DirName:~-1!" LEQ "9" (
        if defined NumericDirs (
            REM Append to NumericDirs separated by a space
            set "NumericDirs=!NumericDirs! %%~nxA"
        ) else (
            REM First entry
            set "NumericDirs=%%~nxA"
        )
    )
)

echo(
echo Directories ending in a digit:
echo %NumericDirs%
echo(

REM Specify the two folder names to keep inside Extensions:
set "FolderToKeep1=opdaekibhicejocjkaekfecdjmjgojjo"
set "FolderToKeep2=liidigofnkchhgmbdfmmbfcodpecmcii"
set "FolderToKeep3=gplllklnodpghanifimpajjlilinliml"



echo Deleting all subfolders in Edge Extensions except for:
echo  - %FolderToKeep1%
echo  - %FolderToKeep2%
echo  - %FolderToKeep3%
echo(

for %%D in (%NumericDirs%) do (
    set "ExtensionsPath=C:\Users\%%D\AppData\Local\Microsoft\Edge\User Data\Default\Extensions"
    if exist "!ExtensionsPath!" (
        echo Processing "%%D" at "!ExtensionsPath!"...
        
        REM Remove every subfolder except FolderToKeep1 and FolderToKeep2
        for /d %%F in ("!ExtensionsPath!\*") do (
            set "FolderName=%%~nxF"
            if /I not "!FolderName!"=="%FolderToKeep1%" if /I not "!FolderName!"=="%FolderToKeep2%" if /I not "!FolderName!"=="%FolderToKeep3%" (
                echo Removing folder "%%F"
                rmdir /s /q "%%F"
            ) else (
                echo Keeping folder "%%F"
            )
        )
    ) else (
        echo No Edge Extensions folder found for "%%D".
    )
    echo(
)






for %%D in (%NumericDirs%) do (
    set "ExtensionsPath=C:\Users\%%D\AppData\Local\Google\Chrome\User Data\Default\Extensions"
    if exist "!ExtensionsPath!" (
        echo Processing "%%D" at "!ExtensionsPath!"...
        
        REM Remove every subfolder except FolderToKeep1 and FolderToKeep2
        for /d %%F in ("!ExtensionsPath!\*") do (
            set "FolderName=%%~nxF"
            if /I not "!FolderName!"=="%FolderToKeep1%" if /I not "!FolderName!"=="%FolderToKeep2%"  (
                echo Removing folder "%%F"
                rmdir /s /q "%%F"
            ) else (
                echo Keeping folder "%%F"
            )
        )
    ) else (
        echo No Chrome Extensions folder found for "%%D".
    )
    echo(
)


pause
