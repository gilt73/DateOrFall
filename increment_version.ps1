$file = "c:\DEV_AI\DateOrFall\index.html"
$content = Get-Content $file -Raw

# Pattern to look for: v<span id="app-version">1.0.0</span>
# We capture the three numbers: Major.Minor.Patch
if ($content -match 'v<span id="app-version">(\d+)\.(\d+)\.(\d+)</span>') {
    $major = $matches[1]
    $minor = $matches[2]
    $patch = [int]$matches[3]

    # Increment Patch Version
    $newPatch = $patch + 1
    $newVersion = "$major.$minor.$newPatch"

    # Replace old version string with new one in BOTH locations
    $newContent = $content -replace 'v<span id="app-version">\d+\.\d+\.\d+</span>', "v<span id=`"app-version`">$newVersion</span>"
    $newContent = $newContent -replace '<meta name="app-version" content="\d+\.\d+\.\d+">', "<meta name=`"app-version`" content=`"$newVersion`">"
    
    Set-Content $file $newContent
    Write-Host "✅ Version successfully updated to: $newVersion" -ForegroundColor Green
    Write-Host "   Updated in footer display and meta tag" -ForegroundColor Cyan
}
else {
    Write-Host "❌ Error: Could not find version tag in index.html" -ForegroundColor Red
}
