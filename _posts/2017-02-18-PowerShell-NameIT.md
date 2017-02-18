---
layout: post
title:  "A Overlooked PowerShell Module For Generating Data"
date:   2017-02-18 09:05
comments: true
description: "An Overlooked PowerShell Module For Generating Data"
categories: 
    - PowerShell
tags: 
    - PowerShell
---

## Introduction
This is a two part series about the PowerShell NameIT module, published on the [PowerShell Gallery](https://www.powershellgallery.com/packages/NameIT/1.8.0). Chris Hunt, co-contributor, has a companion post on his blog [AutomatedOps](https://www.automatedops.com/blog/).

I came across a GitHub repo where [Mitch Denny](https://github.com/mitchdenny/namerer) created a tool that is a simple tool to generate names and check them for availability. He wrote it in [TypeScript](https://www.typescriptlang.org/) and I was interested because of the template language he built to interact with the tool.

So, I ported it to PowerShell, Chris jumped on it and we just continued to add features.

*Note* : You can get up and running with it like this.

```powershell
Find-Module nameit
Find-Module nameit | Install-Module

Invoke-Generate
```

`Invoke-Generate` is also aliased to `ig`.

## Creating PowerShell Objects from Custom Data
Using a PowerShell hashtable, you create key value pairs. The key can be used in a `NameIT` template which looks up the values and chooses a random item. In the template, you specify what you want in this format `Name=[key]`. The `[key]` is the key in the hashtable you pass in the `CustomData` parameter to `Invoke-Generate`.

### An Example
Here you set up the hashtable with your `CustomData`. Then, define the template for how you want it generated, call `Invoke-Generate` and create three items.

```powershell
$data = @{
    Region = echo North East South West
    Item   = echo Banana Apple Pear Beans Peas
}

$template = @"
Region=[Region]
Item=[Item]
"@

Invoke-Generate $template -CustomData $data -Count 3
```

### Generates this output
Here is what `Invoke-Generate` generates. Three pairs of data.

```
Region=South
Item=Pear
Region=South
Item=Banana
Region=North
Item=Banana
```

### Emitting Objects
Now, let's move from creating text to creating PowerShell objects. Just add the `-AsPSObject` switch.

```powershell
Invoke-Generate $template -CustomData $data -Count 3 -AsPSObject
```

`Invoke-Generate` returns and array of PowerShell objects each with the properties you defined in the template and randomly populates it with the data you supplied.

```
Region Item 
------ ---- 
South  Beans
West   Beans
West   Beans
```

## Built-In Custom Data
`Invoke-Generate` ships with built-in custom data, one of the is a list of US States. Here's how you specify it in your template.

```powershell
$template = @"
State=[State]
Region=[Region]
Item=[Item]
"@

Invoke-Generate $template -CustomData $data -Count 3 -AsPSObject
```

Here it is with randomly generated data.

```
State	    Item	Region
-----       ----    ------
Colorado	Peas	North
Minnesota	Banana	South
Connecticut	Peas	North
```

## Tie Into the PowerShell Ecosystem
When `NameIT` got the feature to create PowerShell Objects, you could now pipe it to other tools. Another module I have [published on the gallery](https://www.powershellgallery.com/packages/ImportExcel) one that lets you import/export Excel spreadsheets, without Excel.

*Note* : You can get up and running with it like this.

```powershell
Find-Module ImportExcel
Find-Module ImportExcel | Install-Module

Invoke-Generate
```

Here you go, just pipe the results from `Invoke-Generate` to `Export-Excel -Now`, it'll create a `xlsx` file, populate it the random data and then open the file in Excel.

I changed the `-Count` from 3 to 30.

```powershell
Invoke-Generate $template -CustomData $data -Count 30 -AsPSObject | Export-Excel -Now
```

![](/images/posts/NameITExcel.png)

## Summary - Data Generating Made Easy
I've been pleasanltly surprise how often I use this tool and its flexiblity. Recently I used it to generate JSON messages for a backend system to send random data to.

So, grab the both modules `NameIT` and `ImportExcel` and give the a try.

For bonus points, check out PowerShell that makes this happen on my GitHub
[NameIT](https://github.com/dfinke/NameIT)
[ImportExcel](https://github.com/dfinke/ImportExcel)

For extra bonus points, fork them, add features and make a PR (Pull Request).

Happy PowerShelling!
