---
layout: post
title:  "PowerShell Tab Completion for the Pulumi cli"
date:   2018-11-11 09:00
comments: true
description: "PowerShell-Tab-Completion-for-the-Pulumi-cli"
categories:
    - PowerShell, Pulumi
tags:
    - PowerShell, Pulumi
---

## Pulumi and PowerShell tab completion

I've been using the Pulumi platform and thought it was worth investing time to create a PowerShell tab completion module. It makes it easier to use and discover in the PowerShell console.

Check it out. Plus I'm planning more posts on this new platform.

### Pulumi

*Any Code. Any Cloud. Any Team*

[Pulumi](https://www.pulumi.com/) provides a Cloud Native Development Platform to help teams achieve maximum productivity, unify DevOps practices, and get code to the cloud faster than ever before with a consistent programming model.

### Grab it  `Install-Module PSPulumi`

If you use PowerShell, this tab completion module makes it easier to use and discover.

* [PSPulumi on the PowerShell gallery](https://www.powershellgallery.com/packages/PSPulumi/1.0.2)
* [PSPulumi on GitHub Repo](https://github.com/dfinke/PSPulumi)

#### In Action

`Install-Module PSPulumi` downloads and installs the tab completion from the gallery for the Pulumi cli.

Here is how to install [Pulumi](https://pulumi.io/quickstart/install.html).

***Not published***, a PowerShell script that programmatically converts the Pulumi cli and help into the PowerShell tab completion. That script automates the conversion of the cli and can be used for each new Pulumi release.

![](https://raw.githubusercontent.com/dfinke/PSPulumi/master/images/PulumiArgumentCompletion.gif)