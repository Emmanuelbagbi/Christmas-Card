
Add-Type -AssemblyName System.Drawing

$sourcePath = "C:\Users\chide\OneDrive\Desktop\EMAL\Assets\Christmas-card.png"
$destPath = "C:\Users\chide\OneDrive\Desktop\EMAL\Assets\Christmas-card.png"

# Load
$img = [System.Drawing.Image]::FromFile($sourcePath)

# Aggressive resize: 50%
$newWidth = [int]($img.Width * 0.5)
$newHeight = [int]($img.Height * 0.5)

$dest = New-Object System.Drawing.Bitmap($newWidth, $newHeight)
$graph = [System.Drawing.Graphics]::FromImage($dest)
$graph.DrawImage($img, 0, 0, $newWidth, $newHeight)

$img.Dispose()
$graph.Dispose()

# Save
$dest.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Png)
$dest.Dispose()

Write-Host "Aggressive compression done."
