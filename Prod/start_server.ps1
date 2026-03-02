# Simple HTTP Server for the Date or Fall game
Write-Host "Starting server at http://localhost:8000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""
Write-Host "Serving from: c:\DEV_AI\DateOrFall" -ForegroundColor Cyan
Write-Host ""

# Navigate to the repository root where index.html is located
Set-Location "c:\DEV_AI\DateOrFall"

# Start Python HTTP server
python -m http.server 8000
