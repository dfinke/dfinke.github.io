---
layout: page

title: "Using PowerShell to Deploy to Azure Functions with Run-From-Zip"
date:   2018-02-17 18:00:00
comments: true
description: "Using PowerShell to Deploy to Azure Functions with Run-From-Zip"
categories:
    - PowerShell, Azure-Functions
tags:
    - PowerShell , Azure-Functions
---

Azure announced a new way to deploy applications to Azure Functions called Run-From-Zip.

> With Run-From-Zip, things are very different. There is no longer a deployment step which copies the individual files to wwwroot. Instead, you just point it to a zip file, and the zip gets mounted on wwwroot as a read-only file system.

Check out more [details here](https://github.com/Azure/app-service-announcements/issues/84).

## PowerShell PSRunFromZip
The `DeployRunFromZip.ps1` script simplifies several steps into a one button push operation.

```Powershell
.\DeployRunFromZip hw.zip runfromzip-rg runfromzip
```
It takes the name of your `zip` file containing your Azure Function, the `Azure Resource Group Name` and `Function App Name`. Then it:

1. Checks to see if your are logged into Azure
1. Copies the zip file to your blob storage
1. Creates a SAS token of the file uploaded
1. Sets the `WEBSITE_USE_ZIP` Application Setting in the Azure Function App to the file copied blob storage

Azure takes over, mounts the zip and your app is ready.

## Assumptions

- You have an Azure subscription
- Azure PowerShell is installed
- Az CLI is installed

**Already exists**:
A resource group named `DeployGallery-rg` with a Storage Account named `deploygallery` and a container name `zips`. These can also be passed in as parameters to `DeployRunFromZip.ps1` if you want it pointing to another storage account.

## Grab it on GitHub
Clone it [from here](https://github.com/dfinke/PSRunFromZip). You'll find the `DeployRunFromZip.ps1` script, the `HelloWorld` PowerShell HttpTrigger code, and the zip file ready to deploy.