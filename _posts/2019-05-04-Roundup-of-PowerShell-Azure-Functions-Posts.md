---
layout: post
title:  "Roundup of PowerShell Azure Functions Posts"
date:   2019-05-04 06:00
comments: true
description: "Roundup-of-PowerShell-Azure-Functions-Posts"
categories:
    - PowerShell, Azure Functions
tags:
    - PowerShell, Azure Functions
---

## PowerShell and Azure Functions

PowerShell Azure Functions v2 was announced and is a lot to be excited about. The new version is very much aligned with the PowerShell way of doing things and has move way past the proof of concept the first version. There are new capabilities, bindings and more.

This list also seeded the GitHub [Awesome Powershell Azure Functions](http://bit.ly/2VcTGuE) repo, intended as a place for "Curating the Best PowerShell Resources for Azure Functions."

Good news, the Visual Studio Code experience for crafting PowerShell Azure Functions, debugging them locally and deploying is top shelf.

##  Posts

- [Public Preview of PowerShell in Azure Functions 2.x](https://devblogs.microsoft.com/powershell/public-preview-of-powershell-in-azure-functions-2-x/)
- [Create your first PowerShell function in Azure](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-function-powershell?ocid=AID754288&wt.mc_id=CFID0454)
- [Azure Functions PowerShell developer guide](https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference-powershell)
- [Powershell Functions in Azure the easy way](https://agazoth.github.io/blogpost/2019/04/29/Powershell-Functions-In-Azure-The-Easy-Way.html)
- [Serverless automation using PowerShell preview in Azure Functions](https://azure.microsoft.com/en-us/blog/serverless-automation-using-powershell-preview-in-azure-functions/)

## Actual PowerShell Azure Functions

- [Event-Driven Serverless Containers with PowerShell Azure Functions and Azure Container Instances](https://dev.to/azure/event-driven-serverless-containers-with-powershell-azure-functions-and-azure-container-instances-e9b
)
- [Real-time Azure Resource Monitor](https://github.com/anthonychu/functions-resource-monitor) - Powered by PowerShell Azure Functions, Azure Event Grid, and Azure SignalR Service

![](https://raw.githubusercontent.com/anthonychu/functions-resource-monitor/master/powershell-func-resource-monitor.gif)

## Tweets

- [I'm confused, what's different here? I've been using PowerShell based Azure Functions for almost two years.](https://twitter.com/nthonyChu/status/1122543092534349824?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1122543092534349824&ref_url=https%3A%2F%2Fdevclass.com%2F2019%2F04%2F29%2Fpowershell-fans-swoon-as-microsoft-previews-azure-functions-support%2F)

## Videos

- [Serverless automation using PowerShell in Azure Functions - Azure Friday](https://www.youtube.com/watch?v=biTE9PgdOAs&feature=youtu.be&fbclid=IwAR0ES1S8vI8G5alUdjlGQDoR8BYz1G1uQeSaTGrb4dLzJPpPbWerZDcLafM)

## GitHub

- [Azure/azure-functions-powershell-worker](https://github.com/Azure/azure-functions-powershell-worker)

## Visual Studio Code

If you're working with PowerShell AzureFunctions in code, don't forget to enable it in the [Functions extension](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-function-powershell).

![](/images/posts/PowerShellAzureFunctionsVSC.png)

**via**- [Anthony Chu](https://twitter.com/nthonyChu/status/1123701007400296448)

## Docker

- `azure-functions/powershell:2.0` - the latest stable 2.0 function runtime for Linux with powershell worker runtime. The Dockerfile can be found [here](https://github.com/Azure/azure-functions-docker/blob/master/host/2.0/stretch/amd64/powershell.Dockerfile)

## C# and Azure Functions

- [Containerized Activities in Durable Workflows](https://markheath.net/post/serverless-containers-durable-workflows-4)