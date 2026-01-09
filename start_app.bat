@echo off
echo Starting DateOrFall Server...
echo Opening http://localhost:8000
start http://localhost:8000
python -m http.server 8000
pause
