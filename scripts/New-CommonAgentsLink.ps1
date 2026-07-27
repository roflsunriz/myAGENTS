#Requires -Version 5.1

[CmdletBinding(SupportsShouldProcess)]
param(
    [string[]]$RootPaths = @(
        "$env:USERPROFILE\Documents",
        "C:\filter-matome"
    ),

    [string]$CommonAgentsPath,

    [string]$LinkName = "COMMON-AGENTS.md",

    [switch]$IncludeForeignRemotes
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not $CommonAgentsPath) {
    $CommonAgentsPath = (Resolve-Path (Join-Path $PSScriptRoot "..\AGENTS.md")).Path
}

function Test-IsAdministrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]::new($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Get-GitRepositories {
    param([string[]]$Paths)

    foreach ($root in $Paths) {
        if (-not (Test-Path -LiteralPath $root)) {
            Write-Warning "Root path not found: $root"
            continue
        }

        $item = Get-Item -LiteralPath $root -Force
        if (Test-Path -LiteralPath (Join-Path $item.FullName ".git")) {
            $item.FullName
            continue
        }

        Get-ChildItem -LiteralPath $item.FullName -Directory -Force |
            Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName ".git") } |
            ForEach-Object { $_.FullName }
    }
}

function Get-OriginUrl {
    param([string]$RepositoryPath)

    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    $origin = git -C $RepositoryPath remote get-url origin 2>$null
    $ErrorActionPreference = $previousErrorActionPreference

    if ($LASTEXITCODE -ne 0) {
        return ""
    }

    return ($origin | Select-Object -First 1)
}

if (-not (Test-IsAdministrator) -and -not $WhatIfPreference) {
    throw "Administrator PowerShell is required to create symbolic links."
}

if (-not (Test-Path -LiteralPath $CommonAgentsPath)) {
    throw "Common AGENTS file was not found: $CommonAgentsPath"
}

$repositories = Get-GitRepositories -Paths $RootPaths | Sort-Object -Unique
$commonRepositoryPath = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path

foreach ($repo in $repositories) {
    if ((Resolve-Path $repo).Path -eq $commonRepositoryPath) {
        Write-Host "SKIP common repository: $repo"
        continue
    }

    $origin = Get-OriginUrl -RepositoryPath $repo
    $isOwnRepo = $origin -match "github\.com[:/]roflsunriz/"

    if (-not $IncludeForeignRemotes -and $origin -and -not $isOwnRepo) {
        Write-Host "SKIP foreign remote: $repo ($origin)"
        continue
    }

    $linkPath = Join-Path $repo $LinkName

    if (Test-Path -LiteralPath $linkPath) {
        $existing = Get-Item -LiteralPath $linkPath -Force
        if ($existing.LinkType -eq "SymbolicLink" -and $existing.Target -eq $CommonAgentsPath) {
            Write-Host "OK existing link: $linkPath"
            continue
        }

        Write-Warning "Skip existing non-matching path: $linkPath"
        continue
    }

    if ($PSCmdlet.ShouldProcess($linkPath, "Create symbolic link to $CommonAgentsPath")) {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $CommonAgentsPath | Out-Null
        Write-Host "CREATED: $linkPath -> $CommonAgentsPath"
    }
}
