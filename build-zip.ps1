$root = 'D:\Alex\Claude Code'
$zipPath = Join-Path $root 'truelove-spa-DEPLOY.zip'

if (Test-Path $zipPath) {
  Remove-Item -LiteralPath $zipPath -Force
}

$bs = [char]92
$fs = [char]47

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$entries = New-Object System.Collections.ArrayList

# Archivos sueltos en la raíz
$rootFiles = @('index.html', 'netlify.toml', 'sitemap.xml', 'robots.txt', 'favicon.ico', 'favicon.png', 'apple-touch-icon.png')
foreach ($f in $rootFiles) {
  $p = Join-Path $root $f
  if (Test-Path $p) {
    $null = $entries.Add(@{ Source = $p; Name = $f })
  }
}

# Carpetas a incluir recursivamente
foreach ($folder in @('img','videos','netlify')) {
  $folderRoot = Join-Path $root $folder
  if (Test-Path $folderRoot) {
    Get-ChildItem -LiteralPath $folderRoot -Recurse -File | ForEach-Object {
      $rel = $_.FullName.Substring($root.Length + 1)
      $relLinux = $rel.Replace($bs, $fs)
      $null = $entries.Add(@{ Source = $_.FullName; Name = $relLinux })
    }
  }
}

$zip = [System.IO.Compression.ZipFile]::Open($zipPath, [System.IO.Compression.ZipArchiveMode]::Create)
try {
  foreach ($e in $entries) {
    $entry = $zip.CreateEntry($e.Name, [System.IO.Compression.CompressionLevel]::Optimal)
    $entryStream = $entry.Open()
    try {
      $bytes = [System.IO.File]::ReadAllBytes($e.Source)
      $entryStream.Write($bytes, 0, $bytes.Length)
    } finally {
      $entryStream.Close()
    }
  }
} finally {
  $zip.Dispose()
}

Write-Output "=== ZIP RECONSTRUIDO ==="
$zip2 = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
try {
  $zip2.Entries | ForEach-Object {
    $kb = [math]::Round($_.Length / 1KB, 1)
    Write-Output ("{0,-58} {1,8} KB" -f $_.FullName, $kb)
  }
} finally {
  $zip2.Dispose()
}

$info = Get-Item -LiteralPath $zipPath
Write-Output ""
Write-Output ("Total ZIP: {0} MB" -f [math]::Round($info.Length / 1MB, 2))
