$FileName = Read-Host -Prompt "File name"
$ContentTitle = Read-Host -Prompt "Content Title"

$Year = (Get-Date).Year
$Month = (Get-Date).Month
$Day = (Get-Date).Day
$Today = "$Year-$Month-$Day"

mkdir -p "$Year/$Month"


$DefaultContent = @"
---
title: "$ContentTitle"
date: "$Today"
lastmod: "$Today"
tags:
  -
categories:
  - programming, Performance
---

# $ContentTitle

- [$ContentTitle](#$ContentTitle)

## はじめに

##

## おわりに
"@

$DefaultContent | Out-File "content/jp/posts/$Year/$Month/$FileName.md"
if ($?) {
  Write-Host "Created: " -ForegroundColor Green -NoNewline
  Write-Host "content/jp/posts/$Year/$Month/$FileName.md"
}

$DefaultContent | Out-File "content/en/posts/$Year/$Month/$FileName.md"
if ($?) {
  Write-Host "Created: " -ForegroundColor Green -NoNewline
  Write-Host "content/en/posts/$Year/$Month/$FileName.md"
}
