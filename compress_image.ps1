
Add-Type -AssemblyName System.Drawing

$sourcePath = "C:\Users\chide\OneDrive\Desktop\EMAL\Assets\Christmas-card.png"
$destPath = "C:\Users\chide\OneDrive\Desktop\EMAL\Assets\Christmas-card.png"

# Load image
$img = [System.Drawing.Image]::FromFile($sourcePath)

# Calculate new dimensions (resizing to 80% to ensure size drop)
$newWidth = [int]($img.Width * 0.8)
$newHeight = [int]($img.Height * 0.8)

# Create new bitmap
$dest = New-Object System.Drawing.Bitmap($newWidth, $newHeight)
$graph = [System.Drawing.Graphics]::FromImage($dest)

# High quality resizing
$graph.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$graph.DrawImage($img, 0, 0, $newWidth, $newHeight)

# Dispose original so we can overwrite
$img.Dispose()
$graph.Dispose()

# Save
$dest.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Png)
$dest.Dispose()

Write-Host "Image compressed."
