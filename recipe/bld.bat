@echo on

:: makefile.vc / nmake.opt are pre-patched copies (the original source.patches
:: fail to apply on Windows due to a conda-build patch line-ending issue).
copy /y "%RECIPE_DIR%\win\makefile.vc" makefile.vc
if errorlevel 1 exit 1
copy /y "%RECIPE_DIR%\win\nmake.opt" nmake.opt
if errorlevel 1 exit 1

nmake /f makefile.vc
if errorlevel 1 exit 1

nmake /f makefile.vc install
if errorlevel 1 exit 1
