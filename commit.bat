   for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set day=%%i
     set month=%%j
     set year=%%k
   )
set datestr=%month%_%day%_%year%
git add *
git status
git commit -m "%datestr%"
git push origin main
pause
