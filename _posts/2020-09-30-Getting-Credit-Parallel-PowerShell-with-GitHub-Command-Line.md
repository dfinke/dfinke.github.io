---
layout: post
title:  Getting Credit - Parallel PowerShell with GitHub Command Line
date:   2020-09-30 18:00
comments: true
description: "2020-09-30-Getting-Credit-Parallel-PowerShell-with-GitHub-Command-Line"
categories:
    - PowerShell
tags:
    - PowerShell, GitHub CLI
---

```powershell
$repos = $(
    'powershell/powershell'
    'dotnet/interactive'
    'microsoft/vscode'
    'powershell/vscode-powershell'
    'powershell/PowerShellEditorServices'
)

$repos | ForEach-Object -parallel { 
    [pscustomobject]@{
        repository = $_
        credits    = gh repo credits $_ 
    }
 } | Sort-Object repository
```

```
repository                          credits
----------                          -------
dotnet/interactive                  {colombod, jonsequitur, brettfo, akshita31…}   
microsoft/vscode                    {bpasero, joaomoreno, jrieken, mjbvz…}
powershell/powershell               {andschwa, daxian-dbw, TravisEz13, vors…}      
powershell/PowerShellEditorServices {daviwil, TylerLeonhardt, rkeithhill, rjmholt…}
powershell/vscode-powershell        {daviwil, TylerLeonhardt, rkeithhill, rjmholt…}
```