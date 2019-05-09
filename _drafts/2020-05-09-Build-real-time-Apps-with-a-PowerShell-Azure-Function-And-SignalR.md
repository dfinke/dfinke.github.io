---
layout: post
title:  "Build real-time Apps with a PowerShell Azure Function And SignalR"
date:   2019-05-09 02:00
comments: true
description: "Build-real-time-Apps-with-a-PowerShell-Azure-Function-And-SignalR"
categories:
    - PowerShell, Azure Functions, SignalR
tags:
    - PowerShell, Azure Functions, SignalR
---

# PowerShell Azure Function Using SignalR

There's a new PowerShell Azure Function preview. There was an old one, done as a proof of concept and now it's been rebuilt, and it is better. So let's take it for a spin and try out some of the new bindings, like SignalR. To get started, you need to check out the [Prerequisites](#Prerequisites) section to setup your environment. It's a one time shot and then you're ready to got to the races building Azure Functions. Serverless functions are the future, I believe learning how to wield them is time well spent.

## Prerequisites

To complete this quick start:

- Install the Azure PowerShell “Az” Module - `Install-Module -Name Az`
- Install [PowerShell Core](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell#powershell-core)
- Install [Visual Studio Code](https://code.visualstudio.com/) on one of the [supported platforms](https://code.visualstudio.com/docs/supporting/requirements#_platforms).
- Install [PowerShell extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell).
- Install [.NET Core SDK 2.2+](https://www.microsoft.com/net/download) (required by Azure Functions Core Tools and available on all supported platforms).
- Install version 2.x of the [Azure Functions Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local#v2).

You also need an active Azure subscription.

If you don't have an [Azure subscription](https://docs.microsoft.com/azure/guides/developer/azure-developer-guide#understanding-accounts-subscriptions-and-billing), create a [free account](https://azure.microsoft.com/free/?ref=microsoft.com&utm_source=microsoft.com&utm_medium=docs&utm_campaign=visualstudio) before you begin.

# Let's Go

Once the prerequisites are installed, you'll be able to do two key things, first, build, run and test PowerShell Azure Functions locally. Then, when you're ready, you'll be able to publish it to Azure and host it in the cloud.

# First, Create a SignalR Serverless Instance

We'll use a few `PowerShell Az` functions to do this:

- Log into your Azure account - `Connect-AzAccount`
- Spin up a new SignalR instance - `New-AzSignalR -ResourceGroupName MyAzSignalR-rg -Name MySignalRInstance -Location eastus -Sku Free_F1`

```
HostName                                           Location       ServerPort PublicPort ProvisioningState Version
--------                                           --------       ---------- ---------- ----------------- -------
mysignalrinstance.service.signalr.net              eastus         443        443        Succeeded         -0
```

- Now get the connection string - `Get-AzSignalRKey -ResourceGroupName MyAzSignalR-rg -Name MySignalRInstance`
    - Grab the `PrimaryConnectionString`, you'll need that to set it in your configuration for the PowerShell Azure Function.

# Grab the PowerShell Code

## Clone or Get the Zip
- `git clone https://github.com/dfinke/signalr-service-quickstart-powershell-serverless-chat.git`
- `https://github.com/dfinke/signalr-service-quickstart-powershell-serverless-chat/archive/master.zip`


## Install SignalRService Extension

You need the extension in order to work, here's how to install it.

`func extensions install -p Microsoft.Azure.WebJobs.Extensions.SignalRService -v 1.0.0`

## Rename The Settings File

- Rename `local.settings.sample.json` `local.settings.json`
- Next, paste the `PrimaryConnectionString` you got from the `Get-AzSignalRKey` in the file in this key-value pair
    - `"AzureSignalRConnectionString": "<signalr-connection-string>"`

## Now You'll Spin Up the PowerShell Function

From a `PowerShell Console` navigate to where you cloned or unzipped the `PowerShell` code. You need to be a this level in the directory `signalr-service-quickstart-powershell-serverless-chat\PSChat`.

Now, type `func start` and press enter. Lots of messages should scroll by and at the end, you should see something like this.

![image](/images/posts/SignalRFuncStart.png)


Let's give it an end to end spin.

## Chat Web App

Launch the `Serverless chat` web app.

`https://azure-samples.github.io/signalr-service-quickstart-serverless-chat/demo/chat-v2/`

You'll get two prompts, the first you can take the default, press enter. The second prompts for a user name, to be used in the chat, here's your chance to be creative, type one and press enter.

If all goes well, you should see this screen:

![image](\images\posts\SignalRChatWebPage.png)

Type in `Hello World`  and press enter and this should show up.

![image](\images\posts\SignalRChatWebPageHelloWorld.png)

## Success

You've just locally tested your real-time PowerShell Azure Function. Sending it a message, that outputs it to your Azure SignalR service which then broadcasted it to clients that were registered to it.

Don't close the this web page!

Next, let's tweak the message that gets returned.

## Tweak It

Open the `run.ps` file in the `PSChat\messages` directory. You'll replace the code.

From this

```
$message = [PSCustomObject]@{
    Target    = "newMessage"
    Arguments = @($Request.Body)
}
```

**with this**

```
$result = $Request.Body
$result.text += " [from my PowerShell Azure Function]"

$message = [PSCustomObject]@{
    Target    = "newMessage"
    Arguments = @($result)
}
```

Now, save it and head back to the `Sererless chat` web page.

Type `Hello again` and press enter. You should see this.

![image](\images\posts\SignalRChatWebPageHelloAgain.png)

## Notice

You didn't have to refresh the page or do another `func start`. When you did the `func start`, it set up a `watch`, and when you modify code or settings, it will automatically "reset" and make your PowerShell Function ready to go.

That's slick and makes your development loop very productive.

## Wrap Up

In the next post you'll see how to take this PowerShell Azure Function and publish is to the Azure Cloud so you can share it with friends and family.

Meanwhile, happy PowerShelling.

## Other Resources

Working Version - C:\Users\Douglas\Documents\GitHub\PSChat\signalr-service-quickstart-serverless-chat\src\chat\powershellλ

- [Roundup of PowerShell Azure Functions Posts](https://dfinke.github.io/powershell,%20azure%20functions/2019/05/04/Roundup-of-PowerShell-Azure-Functions-Posts.html)
