---
layout: post
title:  "Building a PowerShell Azure Function - PSWebCalc"
date:   2019-05-16 13:00
comments: true
description: "Building-a-PowerShell-Azure-Function-PSWebCalc"
categories:
    - PowerShell
tags:
    - PowerShell, GitHub, AzureFunction
---

It's to make web APIs with Azure Functions that execute your PowerShell scripts
In this article you'll explore:

- The PowerShell String Scanner module - Provides lexical scanning operations on a String
  - This is how you'll build the calculator
- Setting up a PowerShell Azure Function locally
- Installing the PowerShell module so the Azure Function can use it

## The Calculator

First up, let's build a PowerShell function that takes an simple math expression and returns a result. We'll name the function `Invoke-PSCalc` and here's how we'd like to use it and the expected results.

```powershell
Invoke-PSCalc '2**10' # Raised 2 to the power of 10 and prints 1024
Invoke-PSCalc '2*10'  # Prints 20
Invoke-PSCalc '2+10'  # Prints 12
Invoke-PSCalc '2-10'  # Prints -8
Invoke-PSCalc '2/10'  # Prints 0.2
```

First, you need to install the PowerShell module from the gallery.

```powershell
Install-Module -Name PSStringScanner
```

You're ready to build `Invoke-PSCalc`, first lets see how the string scanner works.

## PowerShell String Scanner

Scanning a string means remembering the position of a scan pointer, which is just an index. The point of scanning is to move forward a bit at a time, so matches are sought after the scan pointer; usually immediately after it.

```powershell
$ss = New-PSStringScanner '2**10'

$lhs = $ss.Scan("\d+")            # $lhs -eq 2
$op = $ss.Scan("\*\*|\+|-|\*|/")  # $op  -eq '**'
$rhs = $ss.Scan("\d+")            # $lhs -eq 10
```

- `$op`  - contains an operator that matches `**` (exponent), `+`, `-`, `*`, and `/`.
- `$lhs` - is the left hand side number of the operator.
- `$rhs` - is the right hand side number of the operator.

Now, calculate the results.

```powershell
  switch ($op) {
      "+" { $lhs + $rhs }
      "-" { $lhs - $rhs }
      "*" { $lhs * $rhs }
      "/" { $lhs / $rhs }
      "**" { [math]::pow($lhs, $rhs) }
      default { "$op not implemented" }
  }
```

## Wrap it in a Function

You now have a mini arithmetic parser that can calculate.

```powershell
function Invoke-PSCalc {
    param($expr)

    $ss = New-PSStringScanner $expr

    [double]$lhs = $ss.Scan("\d+")
    $op = $ss.Scan("\*\*|\+|-|\*|/")
    [double]$rhs = $ss.Scan("\d+")

    switch ($op) {
        "+" { $lhs + $rhs }
        "-" { $lhs - $rhs }
        "*" { $lhs * $rhs }
        "/" { $lhs / $rhs }
        "**" { [math]::pow($lhs, $rhs) }
        default { "$op not implemented" }
    }
}
```

The PowerShell String Scanner makes it really easy to extract text from strings. It let's you use text and regular expressions.

For more details checkout https://github.com/dfinke/PSStringScanner#powershell-string-scanner.

## Next Level - PowerShell Azure Function

What if you wanted your friends, family and colleagues to have access to your most excellent new PowerShell calculator?

Here's how!

You need some things to get started, here are the [PreRequisites](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-first-function-powershell?ocid=AID754288&wt.mc_id=CFID0454#prerequisites).

These next steps with create the scaffolding for you to try out the PowerShell Azure Function on your local machine. If it works there, you can then publish to the Cloud and know it will work.

## The func cli

You'll need to create a directory for your PowerShell Azure Function and in there you'll use `func init` and `func new` to set up the rest.

```powershell
mkdir c:\PSWebCalc
cd c:\PSWebCalc
func init --worker-runtime powershell
func new -l powershell -t HttpTrigger -n PSWebCalc

dir
```

You should get something like this.

```
    Directory: C:\

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----            6/7/2019  7:47 PM                PSWebCalc
Writing profile.ps1
Writing requirements.psd1
Writing .gitignore
Writing host.json
Writing local.settings.json
Writing C:\PSWebCalc\.vscode\extensions.json
Select a template: HttpTrigger
Function name: [HttpTrigger] Writing C:\PSWebCalc\PSWebCalc\run.ps1
Writing C:\PSWebCalc\PSWebCalc\function.json
The function "PSWebCalc" was created successfully from the "HttpTrigger" template.

PS C:\PSWebCalcλ dir


    Directory: C:\PSWebCalc


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----         6/7/2019   7:47 PM                .vscode
d-----         6/7/2019   8:00 PM                Modules
d-----         6/7/2019   7:47 PM                PSWebCalc
-a----         6/7/2019   7:47 PM            437 .gitignore
-a----         6/7/2019   7:47 PM             77 host.json
-a----         6/7/2019   7:47 PM            148 local.settings.json
-a----         6/7/2019   7:47 PM            902 profile.ps1
-a----         6/7/2019   7:47 PM            239 requirements.psd1
```

Run `func start`, and you'll get.

![image](/images/posts/PSWebCalcFuncStart.png)

Start another PowerShell console, grab the `http://localhost:7071/api/PSWebCalc` and do this in the second console.

```ps
PS C:\> Invoke-RestMethod http://localhost:7071/api/PSWebCalc?name=PSWebCalc
Hello PSWebCalc
```

If you get `Hello PSWebCalc`, your PowerShell Azure Function works locally, next, you'll customize it to call the new calculator.

## Using PowerShell Modules in Azure Functions

PowerShell Azure Functions let you set up a `Modules` folder at the same level of `PSWebCalc` where you can place your modules to be auto loaded.

In `C:\PSWebCalc` do this.

```
mkdir Modules
Save-Module PSStringScanner .\Modules\

dir .\Modules\
```

This will install `PSStringScanner` from the gallery and you're ready to add your `Invoke-PSCalc`.

## Edit run.ps1

Copy/Paste this and replace everything in the existing `run.ps1`.

```powershell
param($Request, $TriggerMetadata)

function Invoke-PSCalc {
    param($expr)

    $ss = New-PSStringScanner $expr

    $lhs = $ss.Scan("\d+")
    $op = $ss.Scan("\*\*|\+|-|\*|/")
    $rhs = $ss.Scan("\d+")

    switch ($op) {
        "+" { [double]$lhs + [double]$rhs }
        "-" { [double]$lhs - [double]$rhs }
        "*" { [double]$lhs * [double]$rhs }
        "/" { [double]$lhs / [double]$rhs }
        "**" { [math]::pow([double]$lhs, [double]$rhs) }
        default { "$op not implemented" }
    }
}

$expr = $Request.Query.Expr

Push-OutputBinding -Name Response -Value @{
    StatusCode = "ok"
    Body       = Invoke-PSCalc $expr
}
```

Make sure you ran `func start` in `C:\PSWebCalc` and in a separate PowerShell console, try this.

```powershell
PS C:\λ Invoke-RestMethod http://localhost:7071/api/PSWebCalc?expr=2**9
512
```

Congratulations! You've successfully built a PowerShell Azure Function.