---
layout: post
title:  The Dime Tour
date:   2020-07-05 09:00
comments: true
description: "The-Dime-Tour"
categories:
    - PowerShell
tags:
    - PowerShell
---

<!-- Chapter Start -->

# The Dime Tour

## Automatic References

A PowerShell session does a lot work for you. This is a PowerShell show DLLs are referenced when you start up.

```powershell
[System.AppDomain]::CurrentDomain.GetAssemblies() |
    Where-Object {$_.location} |
    ForEach-Object { Split-Path -Leaf $_.location } |
    Sort-Object
```

## Semicolons

Semicolons are optional. I don’t use them in my scripts—too much noise and typing. They are perfectly legal though, and coming from C#, you might find it hard to lose that muscle memory of adding them.

```powershell
$s = "Hello";
$s += " World"; $s += "!";
$s;
```

I do use them on the command line when I have multiple statements.

```powershell
get-date; 1..3
```
The good news is that if you copy and paste C# code, tweak it, and forget the semicolon, the PowerShell code will still run. Use them if you like; I prefer less typing and thus go without.

## Datatypes

Datatypes are also optional. In the following example, `$a = "Hello"` is the same as `var a = "Hello";` in C#. Each environment recognizes the variable as a string.

```powershell
$a = "Hello"
$a # Prints Hello
```

```powershell
$a = 1
$a += 1
$a # Prints 2
```

```powershell
$a = 1,2,3,"a" # Create an array of different types
$a
```

```powershell
[int]$a = "Hello" # Error
```

## PowerShell Subexpressions in Strings

By using the subexpression notation, you can include arbitrary expressions in expandable strings. A subexpression is a fragment of PowerShell script code that’s replaced by the value resulting from the evaluation of that code.

```powershell
$process = (Get-Process)[0]
$process.PM
```

```powershell
"$process.PM"
```

```powershell
"$($process.PM)" 
```

## Here-Strings
Here-strings are a way to specify blocks of string literals. They preserve the line breaks and other whitespace, including indentation, in the text. They also allow variable substitution and command substitution inside the string. Here-strings follow the quoting rules outlined earlier.

```powershell
$name = "World"

$HereString = @"
This is a here-string
It can contain multiple lines
"Quotes don't need to be escaped"
Plus, you can include variables 'Hello $name'
"@

$HereString
```

## Closures, Functions, and Lambdas
A closure - also known as a lexical closure, function closure, function value, or functional value—is a PowerShell scriptblock coupled with a referencing environment for the nonlocal variables of that scriptblock. A PowerShell scriptblock allows the code to access variables outside its typical scope. Scriptblocks do not require a name and can be invoked using the call operator, &, as shown here.

```powershell
$n = "PowerShell"
$closure = {"Hello $n"}
& $closure
```

A scriptblock can have a name; this is called a function.

```powershell
function Add5 ($num) {
    $num + 5
}

Add5 5
```

Or it can be anonymous (without a name), which is known as a scriptblock.

```powershell
$add5 = {param($num) $num + 5}
& $add5 5 # The call operator works with parameters too!
```

## Arrays
A PowerShell array is your .NET System.Array. PowerShell makes interacting with arrays simpler. You can still work with them in the traditional way through subscripts, but you can also do much more.
It is dead simple to create arrays in PowerShell: separate the items with commas, and if they are text, wrap them in quotes.

```powershell
$animals = "cat", "dog", "bat"
$animals
```

Use `GetType()` to see what the underlying .NET data type is.

```powershell
$animals.GetType()
```

<!-- Chapter End -->