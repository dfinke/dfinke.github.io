---
layout: post
title:  "PowerShell - Extreme Programming"
date:   2017-03-19 14:32:43
comments: true
description: "PowerShell - Extreme Programming"
categories: 
    - PowerShell
tags: 
    - PowerShell,TDD,Pester
---

## The Setup

```powershell
function Get-LargestNumber ($targetArray) {
    
    $max=0

    for ($i = 1; $i -lt $targetArray.count-1; $i++) {
        if($targetArray[$i] -gt $max) {
            $max=$targetArray[$i]
        }
    }

    $max
}
```

In the same file as the function, add these `Pester` tests. I often do this so I can quickly test what I'm building, and then will factor the tests out to a separate script, runnable by `Pester`.

```powershell
Describe "Test function Get-LargestNumber" {
    It "Should Return 5" {
        $actual=Get-LargestNumber 2,5,4,3
        $actual | should be 5
    }

    It "Should Return 5" {
        $actual=Get-LargestNumber 5,4,3,2
        $actual | should be 5
    }

    It "Should Return -2" {
        $actual=Get-LargestNumber -5,-2,-4,-3 
        $actual | should be -2
    }

    It "Should Return -1" {
        $actual=Get-LargestNumber -5,-2,-4,-1 
        $actual | should be -1
    }

    It "Should Return -1" {
        $actual=Get-LargestNumber -1,-2,-4,-5 
        $actual | should be -1
    }
}
```

Running this gives these results.

![](/images/posts/GetLargestNumberPester.png)

One test passed, and four failed. In eight lines of PowerShell there are already errors, and looking at it, they're not readily apparent. Plus, the first test, for the # 5, the test passes, but when you shuffle the array, the second test fails.

Now, many reading this might quip, just use `Measure-Object`. I will and to note, what if I needed to build this because I wanted to generate a file showing the comparisons done. Or, wanted to boost the performance?

## Sanity Check
As a "sanity" check, replace the logic in the `Get-LargestNumber` function with `Measure-Object`, and re-run the tests.

```powershell
function Get-LargestNumber ($targetArray) {
    $targetArray | measure -Maximum | foreach Maximum
}
```

Success, all green.

![](/images/posts/CorrectGetLargestNumberPester.png)

## PowerShell Challenge
Use the original code (function + tests) and iterate on it till all the tests are green.

* Make it work so you can pass an array and the order of the numbers don't matter
* Make it work so you can pass in an array of all negative or all positive numbers

## Summary
Writing scripts takes time, writing tests takes more time. If you released this script without tests, chances are you would not have considered trying to shuffle the numbers in the array. If this was sent to colleagues or put in production, you might get a Saturday 2am call to fix it.

You'd hammer out a solution, and you could still have edge cases that don't work and worse, break conditions that did work.

Developing the discipline for writing tests changes how you look at code and I believe makes you better scripter. Adding 14 lines of `Pester` isn't difficult, and yes adding 14 lines of the *right* tests can be challenging. 

Getting a call at 2am on a Saturday and being able to run a suite of tests against production scripts is fantastic safety net. Then going in, adding a test that demonstrates the error, followed by modifying the scripts, re-running the tests and seeing what breaks, you have the confidence you're not introducing problems that were already solved.

> Ultimately, understanding how *Test Driven Development (Design)* can make you a more agile scripter will allow you to make an informed choice of using them or not.

The benefits don't stop there. Here are a few more.

1. Other scripters can see if the script still works
1. As you build larger solutions and include these scripts, you can have greater test coverage
1. Tests can document how the target script can be used
1. Reduces the defect rate. Plus as you make changes over time, tests help to ensure things are working well
1. Let's you *ruthlessly refactor*. In this example, the core logic was completely replaced with built in PowerShell functions. As new versions of PowerShell are released, can you confidently replace your code with built-in?