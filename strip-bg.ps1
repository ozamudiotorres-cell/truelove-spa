Add-Type -AssemblyName System.Drawing

$source = 'D:\Alex\Claude Code\img\logo\logo.jpg'
$dest = 'D:\Alex\Claude Code\img\logo\logo.png'

$src = [System.Drawing.Bitmap]::FromFile($source)
$bmp = New-Object System.Drawing.Bitmap($src.Width, $src.Height, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.DrawImage($src, 0, 0, $src.Width, $src.Height)
$g.Dispose()
$src.Dispose()

$rect = New-Object System.Drawing.Rectangle 0, 0, $bmp.Width, $bmp.Height
$data = $bmp.LockBits($rect, [System.Drawing.Imaging.ImageLockMode]::ReadWrite, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$ptr = $data.Scan0
$bytes = New-Object byte[] ($data.Stride * $bmp.Height)
[System.Runtime.InteropServices.Marshal]::Copy($ptr, $bytes, 0, $bytes.Length)

# BGRA format
$threshold = 235
for ($i = 0; $i -lt $bytes.Length; $i += 4) {
  $b = $bytes[$i]
  $green = $bytes[$i + 1]
  $r = $bytes[$i + 2]
  if ($r -gt $threshold -and $green -gt $threshold -and $b -gt $threshold) {
    # Pixel cerca de blanco -> transparente
    $bytes[$i + 3] = 0
  }
}

[System.Runtime.InteropServices.Marshal]::Copy($bytes, 0, $ptr, $bytes.Length)
$bmp.UnlockBits($data)
$bmp.Save($dest, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()

Write-Output "Logo procesado:"
Get-Item -LiteralPath $dest | Select-Object Name, @{N='KB';E={[math]::Round($_.Length/1KB,1)}}, FullName
