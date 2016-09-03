---
layout: post
title:  "The  Troika -  PowerShell,  YAML and PowerShell Classes"
date:   2016-08-10 15:19
comments: true
description: The  Troika :  PowerShell,  YAML and PowerShell ClassesAnnouncements.
categories: 
    - PowerShell
tags: 
    - PowerShell
    - YAML
    - PowerShell Classes
---

**YAML Ain't Markup Language**, its purpose is a data-oriented, rather than document markup. Combining this with PowerShell is potent, adding PowerShell classes, well its like adding bacon bits to bacon and eggs.

In this post, we'll take it around the block.

## Hello YAML
Key value pairs are easy, and we get a PowerShell object with property names.

```powershell
@"
receipt: Purchase Invoice
date:    2016-08-06
"@ | ConvertFrom-Yaml
```
**Prints**
```powershell
receipt          date
-------          ----
Purchase Invoice 2016-08-06
```
## Arrays
Now add an `items` property that creates an array. Use **-** to create a collection of ordered value.

**Note**: YAML uses white space to indicate scoping of items

```powershell
@"
receipt: Purchase Invoice
date:    2016-08-06
items :
  - pens
  - pencils
"@ | ConvertFrom-Yaml
```

**Prints**
```powershell
receipt          date       items
-------          ----       -----
Purchase Invoice 2016-08-06 {pens, pencils}
```

## Let's Get Complicated
Multi-nesting. Here we have a `Purchaser` with a `MailingAddress` and a `State`. Try to represent that using `PSCustomObject` and a `HashTable`.

```powershell
$r = @"
Purchaser :
    - Name : John
      MailingAddress :
        Street : 33 Gramercy Park
        City : NY
        State : New York
      Age : 10

"@ | ConvertFrom-Yaml

$r.Purchaser.MailingAddress.State
```

**Prints**
```powershell
New York
```

## Wait, there's more
Now, what happens if you use these structures in your PowerShell scripts and someone fat fngers `Age` with `AgeX`. If you tried `$r.Purchaser.Age`, PowerShell would print nothing. This is where we add the bacon bits.

## PowerShell Classes
Let's introduce the `Data` class, cast `$r` to it, and print out the `Purchaser.Age`.

This buys us some intellisense when we type `([Data]$r).` but we want some more saftey.


```powershell
class Data {
    $Purchaser
}

$r = @"
Purchaser :
    - Name : John
      Age : 10
"@ | ConvertFrom-Yaml

([Data]$r).Purchaser.Age
```

Let's create a `Purchaser` class, add another purchaser and make an error by changing `Age` to `AgeX`.

## Add the Purchaser Classe
Notice, we *type* the `$Purchaser` variable in the `Data` class as an array of Purchaser.

We also added Jane as and incorrectly specifed `AgeX` instead of `Age`.

```powershell
class Purchaser {
    $Name
    $Age
}

class Data {
    [Purchaser[]]$Purchaser
}

$r = @"
Purchaser :
    - Name : John
      Age : 10
    - Name : Jane
      AgeX : 5
"@ | ConvertFrom-Yaml

[Data]$r
```

Using a PowerShell class lets us find errors early in the process and without any coding logic on our part.

**Prints**

```powershell
Error: "Cannot convert the "@{Name=Jane; AgeX=5}"
```

## A lot of Potential
This can be applied to many scenarios. Having a data oriented human-readble file that can be easily used in PowerShell and have it's structure easily validated is tremendous.

In future posts we'll kick it up a few notches.