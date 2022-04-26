---
layout: post
title:  Melting Data in PowerShell - Or How I learned to UnPivot
date:   2021-10-18 16:00
comments: true
description: "Melting-Data-in-PowerShell-Or-How-I-learned-to-UnPivot"
categories:
    - PowerShell
tags:
    - PowerShell
---

Here you'll learn how to unpivot an array, in other words, how to break up an
aggregated collection of data into an unaggregated one. Another way to say it, turn an array of data into a [fact table](https://en.wikipedia.org/wiki/Fact_table).

>In data warehousing, a fact table consists of the measurements, metrics or facts of a business process. It is located at the center of a star schema or a snowflake schema surrounded by dimension tables.

## Sample data

Let's apply "wide vs narrow" thinking to our existing dataset. Our dataset is an example of a wide dataset.

```powershell
$data = ConvertFrom-Csv @'
name,age,education,salary
John,27,master,100000
Mel,32,doctor,120000
Peter,35,MBA,85000
Frank,31,bachelor,75000
Nik,29,MBA,95000
'@

$data

name  age education salary
----  --- --------- ------
John  27  master    100000
Mel   32  doctor    120000
Peter 35  MBA       85000
Frank 31  bachelor  75000
Nik   29  MBA       95000
```

Each row in the represents a single observation for a given variable. In
the previous example, "John" is the Name, 27 is the Age, Master is the Education, 100000 is a Salary amount.

Let’s take a look at how we can use the `Invoke-PSMelt` function to unpivot the dataset.

```powershell
$melted = Invoke-PSMelt -InputObject $data name -VarName attribute

$melted | select -First 7

name  attribute value
----  --------- -----
John  age       27
Mel   age       32
Peter age       35
Frank age       31
Nik   age       29
John  education master
Mel   education doctor
```

## Just the Education column

```powershell
Invoke-PSMelt -InputObject $data name -Vars education -VarName attribute

name  attribute value
----  --------- -----
John  education master
Mel   education doctor
Peter education MBA
Frank education bachelor
Nik   education MBA
```

## Melt the dataset with multiple indexes

`name, education` are the indexes.

```powershell
$melted = Invoke-PSMelt -InputObject $data name, education -VarName attribute

$melted

name  education attribute value
----  --------- --------- -----
John  master    age       27
Mel   doctor    age       32
Peter MBA       age       35
Frank bachelor  age       31
Nik   MBA       age       29
John  master    salary    100000
Mel   doctor    salary    120000
Peter MBA       salary    85000
Frank bachelor  salary    75000
Nik   MBA       salary    95000
```

Now the data can be easily visualized in Excel, and a pivot table.