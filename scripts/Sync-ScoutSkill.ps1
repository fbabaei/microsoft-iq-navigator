[CmdletBinding()]
param(
    [switch]$Apply,
    [string]$SkillPath = (Join-Path $env:USERPROFILE '.scout\m-skills\microsoft-iq-navigator\SKILL.md')
)

# Compares (or with -Apply, rewrites) the installed Scout skill body from the
# canonical agent plus scout\prompt-shortcuts.md. Scout's frontmatter is kept.
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$nl = "`n"

function Get-Parts([string]$text) {
    $text = $text -replace "`r`n", $nl
    $m = [regex]::Match($text, '\A(---\n.*?\n---\n)(.*)\z', 'Singleline')
    if (-not $m.Success) { throw 'Expected YAML frontmatter.' }
    [pscustomobject]@{ Frontmatter = $m.Groups[1].Value; Body = $m.Groups[2].Value.Trim() }
}

$agent = Get-Parts (Get-Content -Raw -Encoding UTF8 (Join-Path $root '.github\agents\microsoft-iq-navigator.agent.md'))
$shortcuts = (Get-Content -Raw -Encoding UTF8 (Join-Path $root 'scout\prompt-shortcuts.md')) -replace "`r`n", $nl
$marker = '## Route by the authoritative source'
$at = $agent.Body.IndexOf($marker)
if ($at -lt 0) { throw "Marker not found in agent: $marker" }

$expectedBody = $agent.Body.Substring(0, $at) + $shortcuts.TrimEnd() + $nl + $nl + $agent.Body.Substring($at)
$installed = Get-Parts (Get-Content -Raw -LiteralPath $SkillPath -Encoding UTF8)

if ($installed.Body -ceq $expectedBody) {
    Write-Output 'Scout skill body matches the repository.'
    return
}

if (-not $Apply) {
    Write-Output 'Scout skill body differs from the repository. Re-run with -Apply to update it.'
    exit 1
}

Copy-Item -LiteralPath $SkillPath -Destination "$SkillPath.bak" -Force
$content = $installed.Frontmatter + $nl + $expectedBody + $nl
[IO.File]::WriteAllText($SkillPath, $content, (New-Object Text.UTF8Encoding $false))
Write-Output "Updated $SkillPath (backup: $SkillPath.bak)."
