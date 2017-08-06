---
layout: post
title:  "Use Serverless PowerShell to Extend Slack"
date:   2017-05-10 17:05:07
comments: true
description: "Use Serverless PowerShell to Extend Slack"
categories: 
    - PowerShell,Azure Functions, Slack
tags: 
    - PowerShell,Azure Functions, Slack
---

## Use Serverless PowerShell to Extend Slack

Serverless functions are the future. Microsoft Azure Functions let you create PowerShell Http triggers. That means, you can put your PowerShell in the cloud and access it as a REST API. 

> Azure Function promises easy use of PowerShell as part of your cloud workflows without a dedicated server and enabling other services to invoke the PowerShell parts. 

This opens up a myriad of possiblities. Plus, you can also create other types of serverless PowerShell functions, like trigger, check out my post [Use PowerShell in Azure Functions to perform a scheduled clean-up task](https://dfinke.github.io/2017/Use-PowerShell-in-Azure-Functions-to-perform-a-scheduled-clean-up-task/).

## Slack, Azure functions and PowerShell

So, I figured I'd create a way that I could get stock data information in Slack. I have a PowerShell function that accesses the Yahoo REST API to get stock data but Slack is a web application. Slack lets you create a command that integrates to a REST API. Azure lets you create a function, for PowerShell, that is an Http Trigger, that can be accessed with a URL, which is a REST API.

### In Action

Here is the Slack/PowerShell Function in action. I named the command `tryAF`, and you can pass it a stock symbol.

![](/images/posts/SlackPSAF.gif)

It invokes the PowerShell REST endpoint, the PowerShell script parses the symbol passed from the Slack, the uses it in the call to the Yahoo stock REST API, and and finally the PowerShell transforms the stock data returned from the Yahoo service into a formatted Slack message and returns it for display in Slack.

## How to Build the PowerShell To Slack Integration

## PowerShell Azure Function
From a function resource you've created, click the `+` next to `Functions`.
![](/images/posts/FunctionAppsList.png)

From this next screen, click `Custom Function`.

![](/images/posts/FunctionAppCustomFunction.png)

Now, choose `PowerShell` as the Language, the `HttpTrigger-PowerShell` Template, set `Name your function` and choose `Anonymous` for the Authorization level.

![](/images/posts/FunctionHttpTrigger.png)

Click create.

Paste this PowerShell into the Azure editor.
```powershell
Out-File -Encoding Ascii -FilePath $res -inputObject "Hello from PowerShell in an Azure Function"
```

![](/images/posts/PasteHttpTriggerCode.png)

**Important:** cllick the `</> Get function URL` link in the top right and copy URL, you'll need it in the next section `Creating The Slack Command`

## Creating The Slack Command
[Build a Slack app](https://api.slack.com/apps?new_app=1). Name your app and select the **Development Slack Team**, click `Create App`.

![](/images/posts/SlackCreateApp.png)

Now click `Slash Commands` and the next screen click `Create New Command`.

![](/images/posts/CreateSlackCommand.png)

Here is where you paste the URL from the Azure Function, and define the name of the command `/sayHello` (be creative, name it whatever you'd like).
![](/images/posts/CreateSlackCommandLastStep.png)

Click `Save` in the bottom right.

Next, click `Install App` on the left and then click the `Install App to Team` button.
![](/images/posts/SlackInstallApp.png)

Last step, click the `Authorize` button and you are good to go.

![](/images/posts/SlackAuthorizeCommand.png)

## Exercise Your Command
Now, head over to the Slack Team where you installed the command, and give it a try.

![](/images/posts/SlackExerciseCommand.png)

## The Future

Being able to surface PowerShell as a rest endpoint (or a timer trigger) opens a world of possibilities. This now enables a broad reach to the PowerShell solutions you have built. Plus, it's only just begun.