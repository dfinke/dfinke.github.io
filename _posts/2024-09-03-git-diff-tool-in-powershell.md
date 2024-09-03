---
layout: post
title:  "Building a Git-like Diff Tool in PowerShell with ChatGPT"
comments: true
description: "Building-a-Git-like-Diff-Tool-in-PowerShell-with-ChatGPT"
date:   2024-09-03 09:30:00
categories:
    - PowerShell, AI, ChatGPT, CodeGen
tags:
    - PowerShell, AI, ChatGPT, CodeGen
---

![alt text](/images/posts/git-diff-tool-in-powershell.png)

# Building a Git-like Diff Tool in PowerShell with ChatGPT

As someone who has spent years mastering PowerShell, I'm always looking for ways to push the boundaries of what we can achieve with automation. Recently, I decided to explore how AI, specifically ChatGPT, could help in creating a PowerShell tool inspired by Python's `difflib`, but with a twist – making it more like a Git diff. 

## The Prompt

To kick things off, I used the following prompt to guide ChatGPT:

```
how would i write a diff lib tool in powershell like the difflib tool for python
more like a git diff
put it all in one file
```

This simple yet precise prompt led to the generation of a robust PowerShell script that compares two files, highlights the differences, and displays them in a way that's familiar to anyone who uses Git.

## The Generated Code

Here's the code that ChatGPT generated:

```powershell
# Git-like Diff Tool in PowerShell

function Compare-Files {
    param (
        [string]$OldFilePath,
        [string]$NewFilePath,
        [int]$ContextLines = 3
    )

    $oldFile = Get-Content -Path $OldFilePath
    $newFile = Get-Content -Path $NewFilePath

    $diffs = [System.Collections.Generic.List[PSObject]]::new()

    $oldIndex = 0
    $newIndex = 0

    while ($oldIndex -lt $oldFile.Count -or $newIndex -lt $newFile.Count) {
        $oldLine = if ($oldIndex -lt $oldFile.Count) { $oldFile[$oldIndex] } else { $null }
        $newLine = if ($newIndex -lt $newFile.Count) { $newFile[$newIndex] } else { $null }

        if ($oldLine -eq $newLine) {
            $oldIndex++
            $newIndex++
        }
        else {
            $diffs.Add([pscustomobject]@{
                    ChangeType    = if ($null -eq $oldLine) { 'Added' } elseif ($newLine -eq $null) { 'Deleted' } else { 'Modified' }
                    OldLineNumber = if ($null -ne $oldLine) { $oldIndex + 1 } else { $null }
                    NewLineNumber = if ($null -ne $newLine) { $newIndex + 1 } else { $null }
                    OldLine       = $oldLine
                    NewLine       = $newLine
                })
            if ($null -ne $oldLine) { $oldIndex++ }
            if ($null -ne $newLine) { $newIndex++ }
        }
    }

    return $diffs
}

function Write-Diff {
    param (
        [psobject[]]$Diffs,
        [string[]]$OldFile,
        [string[]]$NewFile,
        [int]$ContextLines = 3
    )

    foreach ($diff in $Diffs) {
        if ($diff.ChangeType -eq 'Modified') {
            Write-Host "Line $($diff.OldLineNumber),$($diff.NewLineNumber) Modified:" -ForegroundColor Yellow
            for ($i = [Math]::Max(0, $diff.OldLineNumber - $ContextLines - 1); $i -lt [Math]::Min($OldFile.Count, $diff.OldLineNumber + $ContextLines); $i++) {
                Write-Host "  $($OldFile[$i])"
            }
            Write-Host "- $($diff.OldLine)" -ForegroundColor Red
            Write-Host "+ $($diff.NewLine)" -ForegroundColor Green
        }
        elseif ($diff.ChangeType -eq 'Added') {
            Write-Host "Line $($diff.NewLineNumber) Added:" -ForegroundColor Green
            Write-Host "+ $($diff.NewLine)" -ForegroundColor Green
        }
        elseif ($diff.ChangeType -eq 'Deleted') {
            Write-Host "Line $($diff.OldLineNumber) Deleted:" -ForegroundColor Red
            Write-Host "- $($diff.OldLine)" -ForegroundColor Red
        }
    }
}

function Show-GitLikeDiff {
    param (
        [string]$OldFilePath,
        [string]$NewFilePath,
        [int]$ContextLines = 3
    )

    $oldFile = Get-Content -Path $OldFilePath
    $newFile = Get-Content -Path $NewFilePath

    $diffs = Compare-Files -OldFilePath $OldFilePath -NewFilePath $NewFilePath -ContextLines $ContextLines
    Write-Diff -Diffs $diffs -OldFile $oldFile -NewFile $newFile -ContextLines $ContextLines
}

# Example usage:
Show-GitLikeDiff -OldFilePath './old.ps1' -NewFilePath './new.ps1'
```

## Why This Matters

You might wonder, why go through the trouble of generating this with AI? The answer lies in efficiency and learning. Leveraging AI tools like ChatGPT can significantly reduce the time it takes to develop scripts, especially for repetitive tasks or when you need inspiration for structuring your code.

Moreover, it serves as a powerful learning tool. By reviewing and understanding the code generated, you can gain insights into different approaches and techniques that you might not have considered before.

## Call to Action

Want to dive deeper into PowerShell, AI, and automation? Check out my premium [livestreams](https://www.meetup.com/nycpowershellmeetup/) where I go beyond the basics and explore advanced topics. You can also subscribe to my [YouTube channel](https://www.youtube.com/@dougfinke) for more tutorials, tips, and tricks.

## About Me

Doug Finke isn’t just another PowerShell expert. As a 15-time Microsoft MVP and author of _PowerShell for Developers_, he has been at the forefront of innovation, helping professionals like you push the boundaries of what’s possible with PowerShell and AI. My goal is to empower you to be the automator, not the automated.

## Stay Connected

Stay curious!

[Twitter](https://x.com/dfinke) | [LinkedIn](https://www.linkedin.com/in/douglasfinke/) | [YouTube](https://www.youtube.com/@dougfinke)
