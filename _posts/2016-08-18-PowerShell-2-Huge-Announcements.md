---
layout: post
title:  "PowerShell - 2 Huge Announcements"
date:   2016-08-18 15:19
comments: true
description: PowerShell - 2 Huge Announcements.
categories: 
    - PowerShell
tags: 
    - PowerShell
    - Linux
    - macOS
---

* [It runs on macOS and Linux](https://github.com/PowerShell/PowerShell#get-powershell)
* [It's open source](https://github.com/PowerShell/PowerShell)

> [PowerShell is like Semantic Bash](https://twitter.com/SwiftOnSecurity/status/747554376827338754). Tweeted by *SwiftOnSecurity*

That's right, PowerShell is now a cross-platform (Windows, Linux and OS X) command-line shell and associated scripting language.

## Here it is in Action

Running on Windows 10, in Hyper-V on Ubuntu 16.04 Desktop.

* Showing  `$PSVersionTable` displaying information about the version, build and compatibility
* Using `Get-Command` to get the number of `PowerShell` cmdlets currently shipping
* Launching Visual Studio Code
* Finally, calling `python` code inline in a `PowerShell` script

![](/images/posts/animation.gif)


## Wait there's more
Microsoft's Visual Studio Code Editor [runs on Linux too](https://code.visualstudio.com/download) (and on Windows). Plus, there's a [PowerShell Code extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell). Your editing experience is now the same across platforms (and check out the [VS Code marketplace](https://marketplace.visualstudio.com/VSCode) for even more extensions )

> This extension provides rich PowerShell language support for Visual Studio Code.
Now you can write and debug PowerShell scripts using the excellent IDE-like interface that VS Code provides.

### Features
* Syntax highlighting
* Code snippets
* IntelliSense for cmdlets and more
* Rule-based analysis provided by PowerShell Script Analyzer
* Go to Definition of cmdlets and variables
* Find References of cmdlets and variables
* Document and workspace symbol discovery
* Run selected selection of PowerShell code using F8
* Launch online help for the symbol under the cursor using Ctrl+F1
Local script debugging and basic interactive console support!

## PowerShell is Open source
You can read it, and you can contribute. It's going to be interesting to watch the pull requests. I'm looking at some of the source on some cmdlets for the first time without using a disassembler.

## PowerShell Package Management
Package managers are central to promoting code discovery and re-use. The [PowerShellGallery](https://www.powershellgallery.com/) (announced in 2015) is hosted by Microsoft.

> The PowerShell Gallery is the central repository for PowerShell content. You can find new PowerShell commands or Desired State Configuration (DSC) resources in the Gallery

There's been over 2 million downloads of the packages and tremendous community engagement. It's about to get bigger. Give `Find-Module` and `Install-Module` a try.

> What can you make with these building blocks?

Plus, there is `Find-Package` and `Install-Package`, these integrate with [Nuget](https://www.nuget.org/) and [Chocolatey](https://chocolatey.org/) package feeds.

## New variables
This is just a sampling showing the next release of PowerShell is positioned to truly work across platforms.
![](https://github.com/dfinke/GifCam/blob/master/stuff/image001.png?raw=true)
