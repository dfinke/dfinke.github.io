---
layout: post
title:  "PowerShell, Azure SQL and Dynamic Data Masking"
date:   2017-02-25 09:56:00
comments: true
description: "PowerShell, Azure SQL and Dynamic Data Masking"
categories: 
    - PowerShell
tags: 
    - PowerShell,Azure,SQL,Data Masking
---

We have large SQL tables, and contractors work for us which require them to have access to the data. The data is sensitive. One approach taken was to duplicate the tables and remove contents of the sensitive fields. This approach is time consuming, so it runs a schedule off hours. Not very agile.

A colleague, Gaspare Bonventre, came across [Dynamic Data Masking](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-dynamic-data-masking-get-started).

> SQL Database dynamic data masking limits sensitive data exposure by masking it to non-privileged users.


## PowerShell Cmdlets
A bit more digging turned up:

```powershell
Get-Command *AzureRmSqlDatabaseDataMaskingRule
```

```
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Get-AzureRmSqlDatabaseDataMaskingRule              2.3.0      AzureRM.Sql
Cmdlet          New-AzureRmSqlDatabaseDataMaskingRule              2.3.0      AzureRM.Sql
Cmdlet          Remove-AzureRmSqlDatabaseDataMaskingRule           2.3.0      AzureRM.Sql
Cmdlet          Set-AzureRmSqlDatabaseDataMaskingRule              2.3.0      AzureRM.Sql
```

Using the PowerShell Azure cmdlet `New-AzureRmSqlDatabaseDataMaskingRule`, after logging into Azure, made quick work of testing out if data masking worked on a particular column, in a table in a database on am Azure SQL Server.

```powershell
New-AzureRmSqlDatabaseDataMaskingRule `
    -ServerName        "TargetServer" `
    -DatabaseName      "TargetDB" `
    -ResourceGroupName "Target-RG" `
    -SchemaName        "dbo" `
    -MaskingFunction   Default `
    -TableName         "TargetTable" `
    -ColumnName        "TargetColumn"

```

# More Automation

```powershell
$p=@{
    ServerName        = "TargetServer"    
    DatabaseName      = "doug-us-product"
    ResourceGroupName = "Group-2"
}

$dataMasks=@{
    table1     = echo ip cash channelapikeysjson channelaccountmetadatajson
    table2 = echo ip emailencrypted emailpwdencrypted usernameencrypted passwordencrypted
    table3    = echo rateremail
    table4     = echo requestsenderemail
    table5 = echo ip appname fulfillmentapikeysjson fulfillmentaccountmetadatajson
    table6 = echo shipfirstname shiplastname shipphone shipline1 shipline2 shipline3 packagesjson
    table7      = echo shipfirstname shiplastname shipphone shipline1 shipline2 shipline3 buyeruserid buyeremail
    table8 = echo email
}

$dataMasks.GetEnumerator() |
    ForEach-Object {
        $tableName = $_.Key
        
        foreach ($columnName in $_.Value) {
            New-AzureRmSqlDatabaseDataMaskingRule @p `
                -SchemaName "dbo" `
                -MaskingFunction Default `
                -TableName $tableName `
                -ColumnName $columnName
        }
    }
```