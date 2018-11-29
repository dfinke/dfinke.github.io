---
layout: post
title:  "Setup PowerShell Azure Authentication for Pulumi"
date:   2018-11-29 09:00
comments: true
description: "Setup-PowerShell-Azure-Authentication-for-Pulumi"
categories:
    - PowerShell, Pulumi
tags:
    - PowerShell, Pulumi
---

## Create an Azure service principal with Azure CLI

This can be done using the Azure CLI or the Azure Portal. Here is the "How To" Azure documentation

* [Using the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)
* [Using the Azure Portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal?view=azure-cli-latest)

## Setup the Environment Variables

Once created, you need to set up these PowerShell environment variables. I place these in my PowerShell `$Profile`.

```powershell
$env:ARM_CLIENT_ID       = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
$env:ARM_CLIENT_SECRET   = "YYYYYYYY-YYYY-YYYY-YYYY-YYYYYYYYYYYY"
$env:ARM_TENANT_ID       = "ZZZZZZZZ-ZZZZ-ZZZZ-ZZZZ-ZZZZZZZZZZZZ"
$env:ARM_SUBSCRIPTION_ID = "SSSSSSSS-SSSS-SSSS-SSSS-SSSSSSSSSSSS"
```

You can use the same values in [Pulumi configuration variables](https://pulumi.io/quickstart/azure/setup.html#creating-a-service-principal), if you prefer that they be stored alongside your Pulumi stack for easy multi-user access.

```sh
$ pulumi config set azure:clientId "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
$ pulumi config set azure:clientSecret "YYYYYYYY-YYYY-YYYY-YYYY-YYYYYYYYYYYY" --secret
$ pulumi config set azure:tenantId "ZZZZZZZZ-ZZZZ-ZZZZ-ZZZZ-ZZZZZZZZZZZZ"
```

