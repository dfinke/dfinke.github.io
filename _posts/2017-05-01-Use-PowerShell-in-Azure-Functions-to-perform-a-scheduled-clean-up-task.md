---
layout: post
title:  "Use PowerShell in Azure Functions to perform a scheduled clean-up task"
date:   2017-05-01 16:04:07
comments: true
description: "Use PowerShell in Azure Functions to perform a scheduled clean-up task"
categories: 
    - PowerShell, Azure, Functions
tags: 
    - PowerShell, Azure, Functions
---

This post shows you how to use Azure Functions to create a function in PowerShell running on timer to execute SQL against a database in the cloud.

## The Azure Portal
Log into Azure and navigate to one of your existing function apps or create a new one.

![](..\images\posts\FunctionAppsList.png)

Click on the `+` to create a new function.

![](..\images\posts\FunctionAppCustomFunction.png)

Then click on `Custom function`.

![](..\images\posts\FunctionAppDetail.png)

Choose `PowerShell` in the `Language` drop down. Then the `TimerTrigger-PowerShell`. Notice the `Schedule`, this is a [cron](https://en.wikipedia.org/wiki/Cron#Overview) format. You can set it here or update it later. Now, click `Create`.

## Here is where you paste your PowerShell

Your all set to go. You can paste any valid PowerShell here (note: valid PowerShell v4.0), save it and the function will run it based on the schedule you set.

![](..\images\posts\FunctionAppsScript.png)

Now let's see what PowerShell we can use to access an SQL database in the Azure cloud.

## Use Invoke-Sql
This is a shorter version of Lee Holmes' version, I removed the part that can read Excel or Access files.

```powershell
function Invoke-Sql {
    ##############################################################################
    ##
    ## Invoke-SqlCommand.ps1
    ##
    ## From Windows PowerShell Cookbook (O'Reilly)
    ## by Lee Holmes (http://www.leeholmes.com/guide)
    ##
    ##############################################################################

    param(
        [string] $dataSource,
        [string] $database,
        [string] $sqlCommand,
        [System.Management.Automation.PsCredential] $credential
    )

    ## Prepare the authentication information. By default, we pick
    ## Windows authentication
    $authentication = "Integrated Security=SSPI;"

    ## If the user supplies a credential, then they want SQL
    ## authentication
    if ($credential) {
        $plainCred = $credential.GetNetworkCredential()
        $authentication = 
        ("uid={0};pwd={1};" -f $plainCred.Username, $plainCred.Password)
    }

    ## Prepare the connection string out of the information they
    ## provide
    $connectionString = "Provider=sqloledb; " + 
    "Data Source=$dataSource; " + 
    "Initial Catalog=$database; " + 
    "$authentication; "

    ## Connect to the data source and open it
    $connection = New-Object System.Data.OleDb.OleDbConnection $connectionString
    $command = New-Object System.Data.OleDb.OleDbCommand $sqlCommand, $connection
    $connection.Open()

    ## Fetch the results, and close the connection
    $adapter = New-Object System.Data.OleDb.OleDbDataAdapter $command
    $dataset = New-Object System.Data.DataSet
    [void] $adapter.Fill($dataSet)
    $connection.Close()

    ## Return all of the rows from their query
    $dataSet.Tables | Select-Object -Expand Rows
}
```
Next up, let's call it with some parameters.

## Calling Invoke-Sql
Here we go, specify the `uid` and `pwd`. Construct your `sqlcommand`, specify your `datasource` (here you can also point to an Azure database), finally identify the `database` and you have an Azure function that runs on a timer and deletes rows from a table in your database.

```powershell
$uid = '<The SQL User ID>'
$pwd = '<The Password>'

$securePassword = $pwd | ConvertTo-SecureString -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $uid, $securePassword

$sqlcommand="DELETE from <TargetTable> WHERE <Flag='True'>"

Invoke-Sql `
    -datasource "<AzureCloudDB>.database.windows.net" `
    -database "<TargetDatabase>" `
    -credential $cred `
    -sqlcommand $sqlcommand
```

## Note
This post was inspired by this [C# version](https://docs.microsoft.com/en-us/azure/azure-functions/functions-scenario-database-table-cleanup)