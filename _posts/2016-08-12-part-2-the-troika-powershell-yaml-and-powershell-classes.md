---
layout: post
title:  "Part 2 - The  Troika :  PowerShell,  YAML and PowerShell Classes"
date:   2016-08-12 15:14
comments: true
description: "Part 2 - The  Troika :  PowerShell,  YAML and PowerShell Classes"
categories: 
    - PowerShell
tags: 
    - PowerShell
    - YAML
    - PowerShell Classes
---

In the last post [The  Troika :  PowerShell,  YAML and PowerShell Classes](http://dougfinke.com/blog/the-troika-powershell-yaml-and-powershell-classes/), we took YAML, converted it to PowerShell objects and then used PowerShell v5.0 to cast it to a class. This gave us runtime checking to see if we fat fingered entries in the YAML. This required very little coding, just some simple scaffold setup.

Once you do this, you're a couple of steps from even more capability.

**Note**: Notice that using PowerShell v5.0 classes to do this work gives you intellisense in the console and editors.

## Defaults and Types
In this example, the YAML has two  Purchasers, and we left out Jane's `Age`. When we convert, cast and print it, is shows up blank.

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

"@ | ConvertFrom-Yaml

([Data]$r).Purchaser
```

**Prints**

```
Name Age
---- ---
John 10
Jane
```

Lets set the `type` the `$Age` property in the Purchaser class to int.

```powershell
class Purchaser {
    $Name
    [int]$Age
}
```

Now, when we covert and cast, Jane's age is now 0.

```powershell
$r = @"
Purchaser :
    - Name : John
      Age : 10
    - Name : Jane

"@ | ConvertFrom-Yaml

([Data]$r).Purchaser
```

**Prints**

```
Name Age
---- ---
John 10
Jane  0
```

There's another benfit to typing `$Age`. What if in the YAML we type a string for Jane's age?

```powershell
$r = @"
Purchaser :
    - Name : John
      Age : 10
    - Name : Jane
      Age : abc

"@ | ConvertFrom-Yaml

([Data]$r).Purchaser
```

PowerShell handles checking the type and reporting a very useful error.

```powershell
Cannot convert value "@{Purchaser=System.Object[]}" to type "Data". Error: "Cannot create object of type "Purchaser". Cannot convert
value "abc" to type "System.Int32". Error: "Input string was not in a correct format.""
```

## Doing Defaults
Going back the PowerShell class, you can set defaults for properties not defined in the YAML (Jane's Age) and introduce new ones.

**Note**: Adding `$DateCreated` to the Purchaser class now makes it legal to use and overridden from the YAML.

```powershell
class Purchaser {
    $Name
    [int]$Age=15
    $DateCreated = (Get-Date).ToShortDateString()
}

class Data {
    [Purchaser[]]$Purchaser
}

$r = @"
Purchaser :
    - Name : John
      Age : 10
    - Name : Jane

"@ | ConvertFrom-Yaml

([Data]$r).Purchaser
```

**Prints**

```
Name Age DateCreated
---- --- -----------
John  10 8/12/2016
Jane  15 8/12/2016
```

## Next steps
Now we've seen how we can convert YAML from a string (or file) into PowerShell and have a simple way to catch errors, correctly type the data, create defaults and easily introduce new properties.

In upcoming posts we'll look at how to validate the YAML, for example, what if certain properties are required but not set?
