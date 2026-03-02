# Advanced Image Optimization - Resize to Display Size

Write-Host "🚀 Advanced Image Optimization Starting..." -ForegroundColor Cyan
Write-Host ""

$optimizations = @(
    @{ input = "CubeMaster.png"; output = "CubeMaster_optimized.webp"; size = "256x256"; quality = 75 },
    @{ input = "cheers_man.webp"; output = "cheers_man_opt.webp"; size = "256x256"; quality = 75 },
    @{ input = "cheers_woman.webp"; output = "cheers_woman_opt.webp"; size = "256x256"; quality = 75 },
    @{ input = "deep_man.webp"; output = "deep_man_opt.webp"; size = "256x256"; quality = 75 },
    @{ input = "deep_woman.webp"; output = "deep_woman_opt.webp"; size = "256x256"; quality = 75 },
    @{ input = "wild_man.webp"; output = "wild_man_opt.webp"; size = "256x256"; quality = 75 },
    @{ input = "wild_woman.webp"; output = "wild_woman_opt.webp"; size = "256x256"; quality = 75 }
)

$totalSavings = 0

foreach ($opt in $optimizations) {
    $inputPath = "c:\DEV_AI\DateOrFall\$($opt.input)"
    $outputPath = "c:\DEV_AI\DateOrFall\$($opt.output)"
    
    if (Test-Path $inputPath) {
        $originalSize = (Get-Item $inputPath).Length
        
        Write-Host "Optimizing: $($opt.input)" -ForegroundColor White
        Write-Host "  Resizing to: $($opt.size)" -ForegroundColor Gray
        
        magick "$inputPath" -resize "$($opt.size)" -quality $($opt.quality) "$outputPath"
        
        if (Test-Path $outputPath) {
            $newSize = (Get-Item $outputPath).Length
            $savings = $originalSize - $newSize
            $totalSavings += $savings
            
            $originalKB = [math]::Round($originalSize / 1KB, 2)
            $newKB = [math]::Round($newSize / 1KB, 2)
            $percent = [math]::Round(($savings / $originalSize) * 100, 1)
            
            Write-Host "  ✅ $originalKB KB → $newKB KB (saved $percent%)" -ForegroundColor Green
            
            Remove-Item $inputPath -Force
            Rename-Item $outputPath $inputPath
            Write-Host "  📝 Replaced original" -ForegroundColor Cyan
        }
        else {
            Write-Host "  ❌ Optimization failed" -ForegroundColor Red
        }
    }
    else {
        Write-Host "  ⚠️  File not found: $($opt.input)" -ForegroundColor Yellow
    }
    Write-Host ""
}

Write-Host "🎉 Advanced Optimization Complete!" -ForegroundColor Green
Write-Host "Total additional savings: $([math]::Round($totalSavings / 1MB, 2)) MB" -ForegroundColor Cyan
