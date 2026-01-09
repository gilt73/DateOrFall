# Simple HTTP Server for the Date or Fall game
Write-Host "Starting server at http://localhost:8000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow

# Change to parent directory where index.html is located
Set-Location ..

# Start Python HTTP server
python -m http.server 8000
