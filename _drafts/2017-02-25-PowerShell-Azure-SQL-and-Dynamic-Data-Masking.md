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

My colleague, Gaspare Bonventre, came across [Dynamic Data Masking](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-dynamic-data-masking-get-started).

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

Using two PowerShell hashtables, `$sqlSvrParams` for the Azure information, and `$dataMasks` to target the tables and fields to be masked.

This quicly masks 30 fields across several tables in an Azure SQL server in a particular Azure Resource Group.

```powershell
$sqlSvrParams=@{
    ServerName        = "TargetServer"    
    DatabaseName      = "TargetDB"
    ResourceGroupName = "Target-RG"
}

$dataMasks=@{
    table1 = echo ip field1 field2 field3
    table2 = echo ip field1 field2 field3 field4
    table3 = echo field1
    table4 = echo field1
    table5 = echo ip field1 field2 blobField1
    table6 = echo field1 field2 field3 field4 field5 field6 field7
    table7 = echo field1 field2 field3 field4 field5 field6 field7 field8
    table8 = echo email
}

$dataMasks.GetEnumerator() |
    ForEach-Object {
        $tableName = $_.Key
        
        foreach ($columnName in $_.Value) {
            New-AzureRmSqlDatabaseDataMaskingRule @sqlSvrParams `
                -SchemaName "dbo" `
                -MaskingFunction Default `
                -TableName $tableName `
                -ColumnName $columnName
        }
    }
```

For the `MaskingFunction` parameter I went with `Default`. There are others `CreditCardNumber, Email, Number, Text, Default, NoMasking, SocialSecurityNumber` which make it very flexible.

## Summary
Dynamic Data Masking is viable solution for sensitive data. Coupled with PowerShell, you can quickly experiment with masking data in a variety of ways. Plus, with Powershell you can use `Get-AzureRmSqlDatabaseDataMaskingRule` and `Remove-AzureRmSqlDatabaseDataMaskingRule` to quickly figure out what masks are applied, and then remove them.

## Bonus Points
This approach *signinficantly* faster then removing data, making our process much more agile. Rather than running this task off hours once a day we now provide on demand delivery and it can be run multiples times in a day. 