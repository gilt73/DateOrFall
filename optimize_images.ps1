# Image Optimization Script - Convert PNG to WebP
# This script converts all dice images to WebP format with 85% quality

$images = @(
    "cheers_man.png",
    "cheers_woman.png",
    "deep_man.png",
    "deep_woman.png",
    "wild_man.png",
    "wild_woman.png"
)

Write-Host "🎨 Starting Image Optimization..." -ForegroundColor Cyan
Write-Host ""

# Check if we have magick (ImageMagick) installed
$magickPath = Get-Command magick -ErrorAction SilentlyContinue

if (-not $magickPath) {
    Write-Host "❌ ImageMagick not found. Installing via winget..." -ForegroundColor Yellow
    winget install ImageMagick.ImageMagick
    
    # Refresh PATH
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

$totalSavings = 0

foreach ($img in $images) {
    $pngPath = "c:\DEV_AI\DateOrFall\$img"
    $webpPath = "c:\DEV_AI\DateOrFall\$($img -replace '\.png$', '.webp')"
    
    if (Test-Path $pngPath) {
        $originalSize = (Get-Item $pngPath).Length
        
        Write-Host "Converting: $img" -ForegroundColor White
        
        # Convert to WebP with 85% quality
        magick convert "$pngPath" -quality 85 "$webpPath"
        
        if (Test-Path $webpPath) {
            $newSize = (Get-Item $webpPath).Length
            $savings = $originalSize - $newSize
            $totalSavings += $savings
            
            $originalMB = [math]::Round($originalSize / 1MB, 2)
            $newKB = [math]::Round($newSize / 1KB, 2)
            $percent = [math]::Round(($savings / $originalSize) * 100, 1)
            
            Write-Host "  ✅ $originalMB MB → $newKB KB (saved $percent%)" -ForegroundColor Green
        }
        else {
            Write-Host "  ❌ Conversion failed" -ForegroundColor Red
        }
    }
    else {
        Write-Host "  ⚠️  File not found: $img" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "🎉 Optimization Complete!" -ForegroundColor Green
Write-Host "Total savings: $([math]::Round($totalSavings / 1MB, 2)) MB" -ForegroundColor Cyan
