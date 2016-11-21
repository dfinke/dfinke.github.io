---
layout: post
title:  "Quickly Install PowerShell Modules from GitHub"
date:   2016-11-21 09:05
comments: true
description: "Quickly Install PowerShell Modules from GitHub"
categories: 
    - PowerShell
tags: 
    - PowerShell, GitHub, Modules
---

## Challenge
Not all PowerShell Modules are published to the [PowerShellGallery](https://www.powershellgallery.com/), many are hosted on [GitHub](https://github.com/). Plus, many of the modules published to the gallery are also hosted on GitHub and in repo branches. PowerShell open source authors (like myself) have newer versions in source control that have not been promoted to the PowerShell gallery because they are not complete or fully tested.

There needs to be an easy way to get the latest updates from the repo.  

## Solution
`Install-ModuleFromGitHub`. This script works in a similar way to the PowerShell built-in cmdlet [`Install-Module`](https://msdn.microsoft.com/powershell/reference/5.1/PowerShellGet/Install-Module). It streamlines the multi-step process of downloading the zip from GitHub, unblocking it, unzipping it and copying it to a well known module directory. It also checks for a 'psd1' file, cracks is open and uses the `ModuleVersion` to create a directory for it to copy the bits to.

## Additional Benefits

### PowerShell Users
You can grab the lastest updates of your favorite PowerShell Module before the author publishes them to the gallery (*at your own risk*).

Plus, you don't need to navigate GitHub to find it. You can use `Find-Module` and pipe it `Install-ModuleFromGitHub`. If the author setup the `ProjectUri` setting when publishing the module, you'll be good to go. If not, open an issue on their repo and suggest a change.

### Example   

`Find-Module ImportExcel | Install-ModuleFromGitHub`

If your favorite PowerShell module is not on the gallery, no problem, just specify the repo and you're good to go.

`Install-ModuleFromGitHub -GitHubRepo dfinke/ImportExcel`

You can even install from a git branch.

`Install-ModuleFromGitHub -GitHubRepo dfinke/ImportExcel -Branch NewChartType`

### PowerShell Module Authors
Authors get several benefits too if they use GitHub to host their PowerShell modules. First, their users can quickly get the the latest bits without any additional work. `Install-ModuleFromGitHub` lays out their PowerShell module as is, in the write places and uses a version (if included in the psd1).

Another benefit is, private repos for companies doing PowerShell development. You can set up people in your organization to install from master or branches, no additional work on your part, aside from creating and maintaining the branch.

`Install-ModuleFromGitHub -GitHubRepo /psdev/CustomPSModule -Branch TestNewParams`

## Grab the PowerShell Module

[Install-ModuleFromGitHub]()

## Thank you
Thank you to [Damian Reeves](https://github.com/DamianReeves), his questions and suggestions typically lead to creating interesting ideas like ``Install-ModuleFromGitHub`. 