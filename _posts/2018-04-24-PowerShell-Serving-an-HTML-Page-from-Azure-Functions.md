---
layout: post
title:  "PowerShell Serving an HTML Page from an Azure Function"
date:   2018-04-24 10:00
comments: true
description: "PowerShell Serving an HTML Page from an Azure Functions."
categories:
    - PowerShell
tags:
    - PowerShell, GitHub, AzureFunction
---

This post shows several cool pieces using Azure Functions, they are serverless, are backed by PowerShell and returns an HTML page for viewing in your browser.

The bonus is an `azuredeploy.json` file that is wired up to the button for deployment:

[![Deploy to Azure](http://azuredeploy.net/deploybutton.svg)]()

Clicking this button in the GitHub repo kicks off the provisioning of the Azure Function in the cloud, using this [azuredeploy.json](https://github.com/dfinke/HtmlPageFromPowerShellAzureFunction/blob/master/azuredeploy.json). Includaed are am Azure storage account, Azure function, and it connects the Azure function to the repository where the `run.ps1` PowerShell is that provides the web page.

This enables the webhook so when you check in updates to the repo, it notfies the Azure Functions which then pulls the code and sets it up in Azure ready to run.

## Directory Layout
Each subdirectory in your repo becomes an Azure Function, if it has both a `run.ps1` and `function.json` file.

## run.ps1
This file contains your executable PowerShell. Here's what's in the example.

```powershell
$html = @"
<title>This is the title</title>
<h1>Hello world</h1>
<h2>$(Get-Date)</h2>
"@

@{
    headers = @{ "content-type" = "text/html" }
    body    = $html
} | ConvertTo-Json > $res
```

The first part sets a `here-string` to the variable `$html`. It grabs the current date and time and puts it in an `h2` tag.

The second part does three things. First, it creates a hashtable, setting two key value pairs. `headers` is set to another hashtable, telling the response to return a `content-type` of `text/html`. Then you set the `body` to the `$html` variable. Next, pipe this to the built in `ConvertTo-Json` function which, you guessed it, converts the hashtable to JSON. Lastly, you re-direct the converted hashtable (now JSON) to the variable `$res`.

`$res` is an automatic Azure Function variable. When the PowerShell function is called as an HTTP Trigger (think REST API), the environment creates the `$res`, which is a file, and you write data to it that is return to caller (the browser, Invoke-RestMethod call, or curl).

Next up, you'll see how to create the bindings in the `function.json` that tells the Azure Function how to interact.

## function.json

Below is the `function.json` that creates the bindings for your `run.ps1` as an HTTP Trigger. This is defined in the first `type:` JSON key. In the second section of the `bindings`, notice the `name` and its value `res`. That's the name of the variable you re-direct the `here-string` created in `run.ps1` to return the the html.

```json
{
    "disabled": false,
    "bindings": [
      {
        "authLevel": "anonymous",
        "type": "httpTrigger",
        "direction": "in",
        "name": "req"
      },
      {
        "type": "http",
        "direction": "out",
        "name": "res"
      }
    ]
  }
```

## In Action

### Have an Azure Account?
If not, get a free one [here](https://azure.microsoft.com/en-us/free/). Then click on the the button below

[![Deploy to Azure](http://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fdfinke%2fHtmlPageFromPowerShellAzureFunction%2fmaster%2fazuredeploy.json)

### Or Go to GitHub
[Head over to the repo](https://github.com/dfinke/HtmlPageFromPowerShellAzureFunction) and click on the button and also check out the live code.

### Or Check out PowerShell Returning HTML from and Azure Function
Here's the link pointing to the deployed Azure Function from GitHub, and auto wired to the repo [https://tryhtmlfromps.azurewebsites.net/api/HtmlPage](https://tryhtmlfromps.azurewebsites.net/api/HtmlPage).

If I update the code, it auto deploys to the Azure Function. Very cool!

## Fork the repo
Fork it, clone it, try it and change it. It's a great way to learn how this works. Also, this shows how to set up PowerShell behind an HTTP Trigger (think REST Endpoint). This example shows how to return an HTML Page. You can just as easily hit a database, another REST API and return it as JSON. This could also be set up as an Azure Timer Trigger. Just some tweaks to the `function.json`. Plus, you can leverage bindings to Azure Queues and more.

Check it out and have fun.