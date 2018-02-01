---
layout: post
title:  "Microsoft PowerShell, Yaml and VSTS"
date:   2017-11-30 17:45:00
comments: true
description: "Microsoft PowerShell, Yaml and VSTS"
categories:
    - PowerShell
tags:
    - PowerShell
---

The Microsoft VSTS team released the preview of "Build YAML definitions". We can now move away from using a UI for creating build definitions and storing our Continuous Integration defintions in a file that gets checked into source control.

> The ability to store your CI build in source control has been a long running request for VSTS

## Wait there's more
You can run full on PowerShell in a `- powershell` tag!

### Hello World
In a new VSTS projcect create a `.vsts-ci.yml`, add this, commit and you're off to the races.
```yaml
steps:
- powershell: Write-Host "Hello World"
```

```
2017-11-30T22:57:58.8644190Z ##[section]Starting: PowerShell Script
2017-11-30T22:57:58.8994174Z ==============================================================================
2017-11-30T22:57:58.8994174Z Task         : PowerShell
2017-11-30T22:57:58.8994174Z Description  : This is an early preview. Run a PowerShell script on Windows, macOS, or Linux.
2017-11-30T22:57:58.8994174Z Version      : 2.125.0
2017-11-30T22:57:58.8994174Z Author       : Microsoft Corporation
2017-11-30T22:57:58.8994174Z Help         : [More Information](https://go.microsoft.com/fwlink/?LinkID=613736)
2017-11-30T22:57:58.8994174Z ==============================================================================
2017-11-30T22:58:00.9194365Z Generating script.
2017-11-30T22:58:01.0514288Z ##[command]"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Unrestricted -Command ". 'd:\a\_temp\31967c5c-641a-498b-bf25-4d235146c4cc.ps1'"
2017-11-30T22:58:01.7155522Z Hello World
2017-11-30T22:58:01.8245470Z ##[section]Finishing: PowerShell Script
```

It'll even run on a build for macOS or Linux.

### Access to many things
This version is running PowerShell 5.1, so, along side your code you can run your custom PowerShell scripts, functions and modules you build locally, in your CI/CD pipelines.

That spells ***Flexibility*** with a capital ***F***!

```yaml
steps:
- powershell: |
    gcm | measure
    (gcm).source | sort -unique | measure
    gmo -list azurerm
```

That's access to 4259 PowerShell functions, 133 PowerShell modules, unfortunately an older version of the Azure PowerShell module.

```
2017-11-30T23:12:03.5338128Z Name              : AzureRM
2017-11-30T23:12:03.5338128Z Path              : C:\Program Files\WindowsPowerShell\Modules\AzureRM\2.1.0\AzureRM.psd1
2017-11-30T23:12:03.5338128Z Description       : Azure Resource Manager Module
```

## I'm a fan
I like Yaml, I like PowerShell. Check out my posts on it. Bringing Yaml to VSTS is a perfect match!

[The Troika : PowerShell, YAML and PowerShell Classes](https://dfinke.github.io/powershell/2016/08/10/The-Troika-PowerShell-YAML-and-PowerShell-Classes.html)

[Part 2 - The Troika : PowerShell, YAML and PowerShell Classes](https://dfinke.github.io/powershell/2016/08/12/part-2-the-troika-powershell-yaml-and-powershell-classes.html)

[Part 3 - The Troika : PowerShell, YAML and PowerShell Classes](https://dfinke.github.io/powershell/2016/08/13/part-3-the-troika-powershell-yaml-and-powershell-classes.html)