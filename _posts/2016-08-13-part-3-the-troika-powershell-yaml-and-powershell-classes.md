---
layout: post
title:  "Part 3 - The  Troika :  PowerShell,  YAML and PowerShell Classes"
date:   2016-08-13 20:32
comments: true
description: "Part 3 - The  Troika :  PowerShell,  YAML and PowerShell Classes"
categories: 
    - PowerShell
tags: 
    - PowerShell
    - YAML
    - PowerShell Classes
---

* In [Part 1]({% post_url 2016-08-10.the-troika-powershell-yaml-and-powershell-classes %}), we took YAML, converted it to PowerShell objects and then used PowerShell v5.0 to cast it to a class. This gave us runtime checking to see if we fat fingered entries in the YAML. This required very little coding, just some simple scaffold setup.

* In [Part 2](http://dougfinke.com/blog/part-2-the-troika-powershell-yaml-and-powershell-classes/), we took it further, easily making the variables know if they integers or not (for example) and with no work on our part, report an error if the YAML we typed was wrong. Plus, we saw how we could supply default values for fields not specified in the YAML. Streamling the authoring of the YAML information.

## Checking for required data
In Part 3 we'll take another step. We'll see how we can make data required in the YAML that has been authored. Sometimes we forget it cause we move quickly other times we don't specify because we don't know about. In PowerShell we use `[Parameter(Mandatory)]` on parameters in a function to make this happen for example.

Let's look again at the Purchaser example. Notice for Jane, the Age property is blank, because Age was not specified in the YAML.

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

This information may be critical for processing, so catching it and reporting it early is important. A fast feeback loop helps you correct problems more quickly. Plus, the sooner the missing data is detected, the less you have to undo downstream. Maybe this data is being inserted into a database. Name may get inserted first, then age. When the Jane record gets inserted the database my throw an error that age is null. Now you have to delete that record before running again.

Determining the missing age data early is good all around.

## Added a Verification Method to the Data Class

Here's one approach to check for data integrity. You'll loop through all the data, here, the `$Purchasers` variable and check anything you is important. In this example, we'll check for any purchasers age that is null, and if we find one, add a 'message' to the `$dataError` array. If we don't find any missing data, `$dataError` is empty, we return it and use that to indicated no errors were found. This can be as sophisticated as you'd like to make it.

```powershell
    [string[]] Verify() {

        $dataError=@()

        foreach ($purchaser in $this.Purchaser) {
            if($purchaser.Age -eq $null) {
                $dataError+="[Failed] {0} needs Age data" -f $purchaser.Name
            }
        }

        return $dataError
    }
```

### Using the Verification Method

After we cast the converted YAML into the `$records` variable. Call the `Verify()` method, capture the results in `$verification` and then check it. If its `$null` all is good, otherwise print out the errors.

```powershell
$records=([Data]$r)

$verification=$records.Verify()
if($verification -eq $null) {
    "Data verified"
} else {
    $verification
}
```

Again, this can be as sophisticated as you want to make it. Use `Write-Verbose`, throw the error count and return the messages, or even log them.

Also, you can implement verification rules beyond checking for `$null`. You can check to see if data is in certain ranges, you can look up data in other data stores and make comparisons. Lots of flexibility.

Putting this all together, it will print this.

```
[Failed] Jane needs Age data
```

## YAML Comments
One of the many things I like about YAML is that I can use comments. You can use comments to expalain parts or to tell `ConvertFrom-YAML` to skip over information. I much prefer that to deleting and re-adding it later.

```powershell
$r = @"
# Purchase Info
Purchaser :
    - Name : John
      Age : 10
    #- Name : Jane
    #  Age : 5
    - Name : Mary  # Edited late
      Age : 7

# More data
"@ | ConvertFrom-Yaml

([Data]$r).Purchaser
```

## In Closing
Here in Part 3 we see we can use PowerShell class methods to verify the data specified in the YAML. It's a great way to enable a fast feeback loop for problems and keeping bad data out of downstream processes. We also see we can comments in YAML to add explanations and have data skipped. Tough to do in XML and JSON.

We're not done yet, I'll post some more about this approach.