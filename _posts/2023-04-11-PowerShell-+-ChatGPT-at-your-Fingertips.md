---
layout: post
title:  PowerShell + ChatGPT at your Fingertips!
date:   2023-04-11 09:00
comments: true
description: "PowerShell-+-ChatGPT-at-your-Fingertips!"
categories:
    - PowerShell, PowerShellAI, OpenAI, Azure OpenAI
tags:
    - PowerShell, PowerShellAI, OpenAI, Azure OpenAI
---

# PowerShell + ChatGPT at your Fingertips! ✨

## Check out the video

> PowerShellAI Meets Azure OpenAI Service: ChatGPT Integration
<center><a href="https://youtu.be/xyoR7FbU7T8"><img src="https://img.youtube.com/vi/xyoR7FbU7T8/0.jpg" width="400"/></a></center>

## Overview

Microsoft announced general availability of Azure OpenAI Service and expanded access to large, advanced AI models with added enterprise benefits.

I integrated it into my PowerShellAI, so you can chat with ChatGPT right in your console to your Azure OpenAI Enterprise Service.

Plus, PowerShellAI continues to work with OpenAIs offering ChatGPT. As easy as:

```powershell
Set-ChatAPIProvider OpenAI # talks to your ChatGPT OpenAI API key
# or
Set-ChatAPIProvider AzureOpenAI # talks to your privat eAzure OpenAI Service
```

## Prerequisites and Installation

- [How to Set up and Use ChatGPT in Windows Terminal using PowerShellAI](https://dfinke.github.io/powershellai,%20powershell,%20chatgpt,%20windows%20terminal/2023/03/24/How-to-Set-up-and-Use-ChatGPT-in-Windows-Terminal-using-PowerShellAI.html)

All of this without leaving the console. Plus, you can call ChatGPT from your PowerShell scripts.
And it works on Linux and Mac.

## ChatGPT using PowerShell 

This article gets you setup for both OpenAI and Azure OpenAI Service with the PowerShellAI module showing the simple steps for configuring using the Azure OpenAI Service.

Check out the section for [Installing Azure OpenAI Service on Azure](#installing-azure-openai-service-on-azure) for a detailed walkthrough for the setup and how to get the following details needed for the configuration.

## What you need

Find your Azure OpenAI Service API in the Azure portal. You need these four values:

1. Endpoint - This value can be found in the Keys & Endpoint section when examining your resource from the Azure portal.
1. DeploymentName = This value will correspond to the custom name you chose for your deployment when you deployed a model.
1. ApiKey - This value can be found in the Keys & Endpoint section when examining your resource from the Azure portal. You can use either KEY1 or KEY2.
1. ApiVersion - `2023-03-15-preview`. Microsoft docs will be updated as these are changed.

```powershell
Set-AzureOpenAI `
    -Endpoint  https://yourinstance.openai.azure.com ` #'<Azure OpenAI endpoint>' 
    -DeploymentName 'myopenai' ` # <The name for the model you deployed>'
    -ApiVersion '2023-03-15-preview' `
    -ApiKey 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'
```

Running `Set-AzureOpenAI` will configure this values and do `Set-ChatAPIProvider AzureOpenAI` for you. Now you are ready to chat to your private enterprise Azure OpenAI Service.

Try:

```powershell
chat 'what is the capital of Spain?'
```

You can easily switch back to OpenAI by running `Set-ChatAPIProvider OpenAI` and you are back to using the free ChatGPT service.

More details can be found here: [Wiki Docs for PowerShellAI](https://github.com/dfinke/PowerShellAI/wiki/AzureOpenAI)

## Installing Azure OpenAI Service on Azure

Here is a great write up by [Alex Holmeset](https://twitter.com/AlexHolmeset) for [Getting started with Azure OpenAI and PowerShell](https://alexholmeset.blog/2023/02/09/getting-started-with-azure-openai-and-powershell/)

## Additional Resources

1. [Apply large language models and generative AI to a variety of use cases](https://azure.microsoft.com/en-us/products/cognitive-services/openai-service/)
1. [What is Azure OpenAI Service?](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/overview)
1. [Introducing GPT-4 in Azure OpenAI Service](https://azure.microsoft.com/en-us/blog/introducing-gpt4-in-azure-openai-service/)
1. [OpenAI Samples on GitHub](https://github.com/Azure/openai-samples)
1. [Azure OpenAI Service REST API reference](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference)
1. [Azure OpenAI Service Documentation](https://learn.microsoft.com/en-us/azure/cognitive-services/openai/)