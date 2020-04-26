---
layout: post
title:  "The Chain of Responsibility Pattern – Or how to over engineer FizzBuzz in PowerShell"
date:   2020-04-26 12:30
comments: true
description: "The-Chain-of-Responsibility-Pattern–Or-how-to-over-engineer-FizzBuzz-in-PowerShell"
categories:
    - PowerShell
tags:
    - PowerShell, FizzBuzz, PowerShell Classes, Design Patterns
---

## FizzBuzz

Write a script that prints the numbers from 1 to 100. But for multiples of three print "Fizz" instead of the number and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".

# One Way 

```powershell
function FizzBuzz {
    param([int]$number)   

    switch($number) {
        {$_ % 15 -eq 0} {'FizzBuzz';break}
        {$_ % 5 -eq 0}  {'Buzz';break}
        {$_ % 3 -eq 0}  {'Fizz';break}
        default {$_}
    }
}

Describe 'Test FizzBuzz' {

    it 'Should FizzBuzz' -TestCases @(
        @{n=3;expected='Fizz'}
        @{n=5;expected='Buzz'}
        @{n=15;expected='FizzBuzz'}
        @{n=7;expected=7}
    ) {
        param($n,$expected)

        FizzBuzz $n | Should -Be $expected
    }
}
```

There is nothing wrong with the approach. I'ts acceptable for something like FizzBuzz. However it does break the [Open Closed principle](https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle).

The `Open/Closed principle` says that class should be open for extension, but closed for modification.

Using the [Chain Of Responsibility](https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern) pattern satifies the `Open Closed principle`. This pattern is defined as "consisting of a source of command objects and a series of processing objects. Each processing object contains logic that defines the types of command objects that it can handle; the rest are passed to the next processing object in the chain."


#  Using PowerShell Classes to Implement the Chain Of Responsibility Design Pattern

In a nutshell, `Fizz`, `Buzz`, `FizzBuzz` and `PlainNumber` are classes that inherit from the `Categorizer` class. The `CategorizerChain` constructor registers them. It also uses a `Singleton` design pattern to create the `CategorizerChain`. It can be further wrapped in a PowerShell function if you want to support `ValueByPipeline` parameters.

```powershell
class Categorizer
    hidden [Categorizer] $Next 

    [Categorizer] RegisterNext([Categorizer] $next)
    {
        $this.Next = $next
        return $this.Next
    }
 
 
    [string] IsSatisfiedBy($number) {return $null}
}

class FizzBuzzCategorizer : Categorizer {
    [string] IsSatisfiedBy($number) {
        if ($number % 15 -eq 0) { return "FizzBuzz"}
        
        return $this.Next.IsSatisfiedBy($number)
    }
}

class BuzzCategorizer  : Categorizer {
    [string] IsSatisfiedBy($number) {
        if ($number % 5 -eq 0) { return "Buzz"}
        
        return $this.Next.IsSatisfiedBy($number)
    }
}


class FizzCategorizer  : Categorizer {
    [string] IsSatisfiedBy($number) {
        if ($number % 3 -eq 0) { return "Fizz"}
        
        return $this.Next.IsSatisfiedBy($number)
    }
}

class PlainNumberCategorizer   : Categorizer {
    [string] IsSatisfiedBy($number) {
        return $number
    }
}

    
class CategorizerChain {

    hidden $top

    hidden static [CategorizerChain] $instance = [CategorizerChain]::new()

    CategorizerChain() {
        $this.top = [FizzBuzzCategorizer]::new()

        $this.top.
            RegisterNext([BuzzCategorizer]::new()).
            RegisterNext([FizzCategorizer]::new()).
            RegisterNext([PlainNumberCategorizer]::new())
   
    }

    [string] static Calculate($number) {
        return [CategorizerChain]::instance.top.IsSatisfiedBy($number)
    }

}
```

# Use it

```powershell
1..15 | foreach { [CategorizerChain]::Calculate($_) }
```

```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
```

# Summary

Now, if there was a requirement to print “Meow” for any number that is a multiple of 8, its easy to create a new class that inherits from Categorizer, and `RegisterNext` in the chain.