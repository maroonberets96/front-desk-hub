@echo off
rem Rebuilds "Front Office.exe" (in the folder above this one) from front_office.py, rent.py,
rem keys.py, post.py, visitors.py and logbook.py.
rem Needs Python with: pip install pyserial pyinstaller pillow reportlab openpyxl opencv-python-headless
rem Optional: put your own logo.png (and app.ico) in this folder to bundle them into the .exe;
rem a logo.png next to the .exe overrides the bundled one.
rem Optional: put SumatraPDF.exe (sumatrapdfreader.org) here too, so rent receipts print straight
rem to the default printer; without it the receipt PDF opens to print by hand.
rem Close the app before building: Windows won't let a running .exe be replaced.
cd /d "%~dp0"
set EXTRA=
if exist "%~dp0logo.png" set EXTRA=%EXTRA% --add-data "%~dp0logo.png;."
if exist "%~dp0app.ico" set EXTRA=%EXTRA% --icon "%~dp0app.ico"
if exist "%~dp0SumatraPDF.exe" set EXTRA=%EXTRA% --add-binary "%~dp0SumatraPDF.exe;."
python -m PyInstaller --noconfirm --onefile --windowed --name "Front Office" %EXTRA% ^
  --hidden-import rent --hidden-import keys --hidden-import post --hidden-import visitors --hidden-import logbook ^
  --distpath "%~dp0.." --workpath "%TEMP%\front_office_build" --specpath "%TEMP%\front_office_build" ^
  front_office.py
if exist "%~dp0__pycache__" rmdir /s /q "%~dp0__pycache__"
pause
