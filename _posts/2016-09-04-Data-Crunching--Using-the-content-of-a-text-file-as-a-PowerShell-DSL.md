---
layout: post
title:  "Data Crunching - Using the content of a text file as a PowerShell DSL"
date:   2016-09-04 11:50
comments: true
description: "Data Crunching - Using the content of a text file as a PowerShell DSL."
categories: 
    - PowerShell
tags: 
    - PowerShell
    - Classes
---

The PDB file format was invented in 1976 as a human-readable file that would allow researchers to exchange protein coordinates through a database system.

```
COMPND      Ammonia
AUTHOR      DAVE WOODCOCK  97 10 31
ATOM      1  N           1       0.257  -0.363   0.000
ATOM      2  H           1       0.257   0.727   0.000
ATOM      3  H           1       0.771  -0.727   0.890
ATOM      4  H           1       0.771  -0.727  -0.890
TER       5              1
END
```

## Data Crunching in PowerShell
Looking at the file, we'd want to pull it apart and put it into a structure we could work with. The first things that came to mind were to use the substring method, `-split`, and/or regular expressions. You'd need to handle the repeating whitespace, "split" the data into parts, and transform it into a data structure. This would all depend on which line of data was being processed. Each "type" has specific number of meaningful data attributes that need to be stored in variable.  

## The Light Bulb
What I noticed is if I took the data line `AUTHOR      DAVE WOODCOCK  97 10 31` and dropped it in PowerShell and ran it, I'd get an error. If I create a function `Author` and re-ran it I was getting somewhere.

```PowerShell
function Author {}

AUTHOR      DAVE WOODCOCK  97 10 31
```

Next, I added parameters `$FirstName`, `$LastName`, `$Year`, `$Month`, `$Day`. In the body of the `function` I used `$PSBoundParameters` to print out the parameters passed.

```powershell
function Author ($FirstName, $LastName, $Year, $Month, $Day) {
    $PSBoundParameters
}
```

Now the above code prints this. So PowerShell's parameter binding took care of all the whitespace issues and mapped everything for us. Plus, it provided all the details in a nice neat package `$PSBoundParameters` 

```
Key       Value   
---       -----   
FirstName DAVE    
LastName  WOODCOCK
Year      97      
Month     10      
Day       31      
```

That was pretty painless, and I could apply the same pattern to the `COMPND` and `ATOM`. lines.

But I still needed to store the resulting data in a structure.

## PowerShell Classes

Here's the really cool part. Copy and paste the `function Author (...)` line and tweak it a bit into a `PowerShell class`.

```powershell
class Author {
    $FirstName
    $LastName
    $Year
    $Month
    $Day
}
```

Now for the magic. Cast the `$PSBoundParameters` as the `Author` class.

```powershell
function Author ($FirstName, $LastName, $Year, $Month, $Day) {
    [Author]$PSBoundParameters
}
```

## Boom
We've *parsed* a line from the PDB using PowerShell parameter binding and casting it to a class and got a PowerShell object with property names and data, without writing any code to set variables or call parsing logic.

```
FirstName : DAVE
LastName  : WOODCOCK
Year      : 97
Month     : 10
Day       : 31
```

## Flesh Out The Other PowerShell Functions and Classes
**Note**: The property names in the class must match the parameter names in the function so they populate correctly. 

```powershell
class Compound {
    $CompoundName
}

class Atom {
    $sphere
    $elementName
    $idx
    $x
    $y
    $z
}

function COMPND ($CompoundName) {
    [Compound]$PSBoundParameters
}

function Atom ($sphere, $elementName, $idx, $x, $y, $z){
    [Atom]$PSBoundParameters
}
```

For the trick we're about to perform, let's also add these functions to match the PDB file.

```powershell
function ter {}
function end {}
```

## But Wait
The PDB file is just a text file. Enter PowerShell's `Invoke-Expression`. If you read in the entire PDB file and pipe it to `Invoke-Expression`, it will get executed as a PowerShell script and the transformation will happen.

```powershell
Get-Content -Raw .\ammonia.pdb | Invoke-Expression
```

## The Full Monty
To make this happen we'll make the assumption `COMPND` is the first function we'll find so we create the Compound class and for other functions we convert the data and add it to the `Compound` object in `$targetCompound`. When the `TER` line/function is evaluated, we emit the object and it's data to the pipeline.

Notice the datatypes are specified for the `Author` and `Atoms` properties. Also, the method `AddAtom` appends `Atom` data to the `$Atoms` property, used by the `Atom` function.  

```powershell
class Compound {
    $CompoundName
    [Author]$Author
    [Atom[]]$Atoms

    AddAtom([Atom]$atom) {
        $this.Atoms+=$atom
    }
}

class Author {
    $FirstName
    $LastName
    $Year
    $Month
    $Day
}

class Atom {
    $sphere
    $elementName
    $idx
    $x
    $y
    $z
}

function Compnd ($CompoundName) {
    $script:targetCompound=[Compound]$PSBoundParameters
}

function Author ($FirstName, $LastName, $Year, $Month, $Day) {
    $targetCompound.Author=[Author]$PSBoundParameters 
}

function Atom   ($sphere, $elementName, $idx, $x, $y, $z){
    $targetCompound.AddAtom([Atom]$PSBoundParameters)
}

function ter {$targetCompound}
function end {}

Get-Content -Raw .\ammonia.pdb | Invoke-Expression
```

## Prints

Here is the result. The fully realized object and it's properties

```
CompoundName Author Atoms       
------------ ------ -----       
Ammonia      Author {N, H, H, H}
```

Here, Atoms are neatly packaged and ready for use.

```
PS C:\> $targetCompound.Atoms | ft

sphere elementName idx     x y           z
------ ----------- ---     - -           -
     1 N             1 0.257 -0.363      0
     2 H             1 0.257 0.727       0
     3 H             1 0.771 -0.727   0.89
     4 H             1 0.771 -0.727 -0.890
```

## That's A Wrap
Data crunching happens a lot and having approaches like these in your toolbox lets you get things done faster and more accurately. The less code you have to type, the fewer chances you have to make errors.

Notice that the properties `x`, `y`, `z` don't align. Go back to the `Atom` class and type them as `[double]`, re-run and see what happens.   
