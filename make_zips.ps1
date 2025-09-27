# make_zips.ps1 — build curated + optional full zips into dist/
# Default: curated (text-first) zip for ChatGPT uploads
# Use -Full to also build a full "assistant" zip
param([switch]$Full)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoName = Split-Path $repoRoot -Leaf
$stamp = Get-Date -Format "yyyy.MM.dd-HHmmss"
$distDir = Join-Path $repoRoot "dist"
New-Item -ItemType Directory -Force -Path $distDir | Out-Null

# --- Paths ---
$curatedZip = Join-Path $distDir ("{0}_curated_latest.zip" -f $repoName)
$assistantZip = Join-Path $distDir ("{0}_assistant_latest.zip" -f $repoName)
$indexJson = Join-Path $distDir "index.json"
$archReport = Join-Path $distDir "archivist_report.json"

# --- Helpers ---
function New-ZipSafe {
  [CmdletBinding()]
  param([string]$ZipPath, [System.IO.FileInfo[]]$Files)

  if (Test-Path $ZipPath) { Remove-Item $ZipPath -Force }

  $paths = $Files | ForEach-Object { $_.FullName }
  if (-not $paths -or $paths.Count -eq 0) {
    # create a valid empty zip
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $fs = [System.IO.File]::Open($ZipPath, [System.IO.FileMode]::CreateNew)
    $fs.Close()
    $zip = [System.IO.Compression.ZipFile]::Open($ZipPath, [System.IO.Compression.ZipArchiveMode]::Update)
    $zip.Dispose()
    return
  }
  Compress-Archive -Path $paths -DestinationPath $ZipPath -CompressionLevel Optimal
}

function Test-ZipReadable {
  param([string]$ZipPath)
  try {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
    $n = $zip.Entries.Count
    $sample = $zip.Entries | Select-Object -First ([Math]::Min(3, $n)) | ForEach-Object { $_.FullName }
    $zip.Dispose()
    return @{ ok = $true; count = $n; sample = $sample }
  }
  catch {
    return @{ ok = $false; error = $_.Exception.Message }
  }
}

function Hash([string]$Path) {
  if (-not (Test-Path $Path)) { return "" }
  (Get-FileHash -Algorithm SHA256 -Path $Path).Hash
}

# --- Collect files (exclude build/runtime/tooling dirs) ---
$excludeRegex = '\\\.git\\|\\bdist\\b|\\bexports\\b|\\bjson\\b|\\\.venv\\|\\\.vscode\\|\\__pycache__\\|\\\.pytest_cache\\|\\bnode_modules\\b|Thumbs\.db$|\\\.DS_Store$'
$allFiles = Get-ChildItem -Path $repoRoot -Recurse -File -ErrorAction Stop |
Where-Object { $_.FullName -notmatch $excludeRegex }

# curated = text-first (small upload)
$textExt = @(
  '.md', '.txt', '.json', '.yml', '.yaml', '.py', '.ps1', '.psm1', '.psd1',
  '.code-workspace', '.gitignore', '.gitattributes', '.csv', '.tsv',
  '.toml', '.ini', '.cfg', '.bat', '.cmd', '.sh', '.xml'
)
$curatedFiles = $allFiles | Where-Object { $textExt -contains $_.Extension.ToLower() }

# --- Build curated zip ---
New-ZipSafe -ZipPath $curatedZip -Files $curatedFiles
$curatedCheck = Test-ZipReadable -ZipPath $curatedZip
if (-not $curatedCheck.ok) { Write-Error "Curated zip failed: $($curatedCheck.error)" }
$curatedHash = Hash $curatedZip

# also keep timestamped copy & prune
$curatedDated = Join-Path $distDir ("{0}_curated_{1}.zip" -f $repoName, $stamp)
Copy-Item $curatedZip $curatedDated -Force
Get-ChildItem $distDir -Filter "${repoName}_curated_*.zip" |
Sort-Object LastWriteTime -Descending | Select-Object -Skip 2 | Remove-Item -Force

# --- Optional full zip ---
$assistantHash = ""
$assistantCheck = $null
if ($Full) {
  New-ZipSafe -ZipPath $assistantZip -Files $allFiles
  $assistantCheck = Test-ZipReadable -ZipPath $assistantZip
  if (-not $assistantCheck.ok) { Write-Error "Assistant zip failed: $($assistantCheck.error)" }
  $assistantHash = Hash $assistantZip

  $assistantDated = Join-Path $distDir ("{0}_assistant_{1}.zip" -f $repoName, $stamp)
  Copy-Item $assistantZip $assistantDated -Force
  Get-ChildItem $distDir -Filter "${repoName}_assistant_*.zip" |
  Sort-Object LastWriteTime -Descending | Select-Object -Skip 2 | Remove-Item -Force
}

# --- Write index.json ---
$index = [ordered]@{
  repo             = $repoName
  generated_at     = $stamp
  curated_zip      = (Split-Path -Leaf $curatedZip)
  curated_sha256   = $curatedHash
  curated_count    = $curatedCheck.count
  curated_sample   = $curatedCheck.sample
  assistant_zip    = if ($Full) { (Split-Path -Leaf $assistantZip) } else { $null }
  assistant_sha256 = if ($Full) { $assistantHash } else { $null }
  archivist_report = (Test-Path $archReport)
}
$index | ConvertTo-Json -Depth 5 | Set-Content -Path $indexJson -Encoding UTF8

# --- Console summary ---
Write-Host ""
Write-Host "Build Summary:"
Write-Host ("  CURATED:   {0}  SHA256={1}" -f (Split-Path -Leaf $curatedZip), $curatedHash)
if ($Full) { Write-Host ("  ASSISTANT: {0}  SHA256={1}" -f (Split-Path -Leaf $assistantZip), $assistantHash) }
Write-Host ("  INDEX:     {0}" -f (Split-Path -Leaf $indexJson))
if (Test-Path $archReport) { Write-Host "  REPORT:    archivist_report.json (present)" } else { Write-Host "  REPORT:    (none yet)" }
