---
layout: post
title:  "PowerShell HTML Page Azure Function - Plus a Deploy Button"
date:   2018-04-15 13:00
comments: true
description: "PowerShell-HTML-Page-AzureFunction-Plus-Deploy-Button"
categories:
    - PowerShell
tags:
    - PowerShell, GitHub, AzureFunction
---

This post highlights several cool pieces using Azure Functions, which are serverless, hosting PowerShell and returning an HTML page for viewing in your browser.

As a bonus, it has a `azuredeploy.json` file that is wired up to the button:

[![Deploy to Azure](http://azuredeploy.net/deploybutton.svg)]()

Clicking this button in the GitHub repo activates the provisioning of the Azure Function in the cloud, using this [azuredeploy.json](https://github.com/dfinke/HtmlPageFromPowerShellAzureFunction/blob/master/azuredeploy.json). Including the Azure storage account, Azure function and connect the Azure function to the repository where the `run.ps1` PowerShell is that provides the web page. This enables the webhook so when you check in updates to the repo, it notfies the Azure Functions which then pulls the code and sets it up in Azure.

## Directory Layout
Each subdirectory becomes an Azure Function, if it has both a `run.ps1` and `function.json` file.

## run.ps1
This file contains your executable PowerShell. Here's what is in the example for this post.

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

The first part sets a `here-string` to the variable `$html`. It even grabs the current date and time and puts it in a `h2` tag.

The second part does three things. First, it creates a hashtable, setting two key value pairs. `headers` is set to another hashtable, telling the response to return a `content-type` of `text/html`. Also, you set the `body` to the `$html` variable. Next, pipe this to the built in `ConvertTo-Json` function which, you guessed it, converts the hashtable to JSON. Lastly, you re-direct the converted hashtable (now JSON) to the variable `$res`.

`$res` is an automatic Azure Function variable. When the PowerShell function is called as an HTTP Trigger (think REST API), the environment creates the `$res`, which is a file, and you write data to it that is return to caller (the browser, Invoke-RestMethod call, or curl).

Next up, you'll see how to create the bindings in the `function.json` that tells the Azure Function how to interact.

## function.json

Below is the `function.json` that wires up our `run.ps1` as an HTTP Trigger. This is defined in the first `type:` JSON key. In the second section of the `bindings`, notice the `name` and its value `res`. That's the name of the variable you re-direct to in the `run.ps1` to return the the html.

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

## Have an Azure Account?

## Fork the repo

## Deploy Button