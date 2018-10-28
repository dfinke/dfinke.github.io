---
layout: post
title:  "How To Use PowerShell To Check for Missing and Duplicate Values in a List"
date:   2018-10-27 08:00
comments: true
description: "How-To-Use-PowerShell-To-Check-for-Missing-and-Duplicate-Values-in-a-List"
categories:
    - PowerShell
tags:
    - PowerShell
---

Looking at my bookshelf seeing a copy of ["Programming Pearls" by Jon Bentley](https://www.amazon.com/Programming-Pearls-Press-Louis-Bentley/dp/0201103311). I flipped to the beginning and read *"Column 1: Cracking the Oyster"*.

The gist, a programmer asked "How do I sort on disk?". Mr. Bentley admits his first mistake was to answer the question. He then asked the programmer follow up questions which drove the solution, "What are you actually sorting?", "How many records are there?", "What is the format of each?"

The response: there are 27,000 records, each are a 16-bit integer, it is in the range from 1..27,000, and no integer can appear more than once.

> The context made the problem clearer [...] and also defines the performance requirements.

Now, this problem was raised back when folks programmed in [FORTRAN](https://en.wikipedia.org/wiki/Fortran) and machines had a half a megabyte of memory. I find these challenges as good brain candy and fun to experiment with in PowerShell.

> By coincidence the same week I re-read the chapter, a challenge came up where I could use this.

The column went on to outline a few designs including using Knuth's classic "Sorting and Searching" book for different types of sorts.

> If you want, take a look at my repo of [PowerShell Sorting Algorithms](https://github.com/dfinke/SortingAlgorithms) I played with porting from other languages

After a couple of iterations, Mr. Bentley "viewed it in a different light", as a *bitmap* or *bit vector* representation of a set.

## PowerShell Code

Here is PowerShell code to solve the problem. I'd love to hear feedback on alternatives, which I'm sure there are. Also included, are tests, so if you work to refactor this you have a starting point showing the initial implementation works, as a baseline.

Using a hashtable, you initialize the `keys` to the `$expected` values in the list, to `0` indicating `not found`. Next, you loop through the `actual` list items, using the `key` lookup in the hashtable and bump the "count" by one `$h.$item+=1`. This does two things, it indicates that the item was found and if it is greater than 1, shows it appears in the list more than once.

The last step of the process you return a `list` of missing and duplicates items, by creating a hashtable and casting it to `PSCustomObject` object with two properties, `Missing` and `Duplicate`. These values are set by iterating over the values in the hashtable, any value that is 0 shows up in `Missing`, a value greater than 1 in `Duplciate`

```powershell
function Get-MissingAndDupes {
    param(
        $list,
        $expected
    )

    $h=@{}

    $count = $expected.count
    for ($idx = 0; $idx -lt $count; $idx+=1) {
        $item = $expected[$idx]
        $h.$item=0
    }

    $count = $list.count
    for ($idx = 0; $idx -lt $count; $idx+=1) {
        $item = $list[$idx]
        $h.$item+=1
    }

    [PSCustomObject]@{
        Missing   = $h.GetEnumerator().Where({$_.Value -eq 0}).Name
        Duplicate = $h.GetEnumerator().Where({$_.Value -gt 1}).Name
    }
}

Describe "Get-MissingAndDupes" {
    BeforeAll {
        $list = echo 8 1 3 5 7 9 8 3
        $expected = 1..9
    }

    It "Should have these missing numbers" {
        $actual = Get-MissingAndDupes $list $expected

        $actual.Missing.Count | Should Be 3
        $actual.Missing -eq 6 | should Not BeNullOrEmpty
        $actual.Missing -eq 2 | should Not BeNullOrEmpty
        $actual.Missing -eq 4 | should Not BeNullOrEmpty

    }

    It "Should have these duplicates numbers" {
        $actual = Get-MissingAndDupes $list $expected

        $actual.Duplicate.Count | Should Be 2
        $actual.Duplicate -eq 8 | should Not BeNullOrEmpty
        $actual.Duplicate -eq 3 | should Not BeNullOrEmpty
    }
}
```

## In Action

```ps
PS C:\> Get-MissingAndDupes -list (echo 8 1 3 5 7 9 8 3) -expected (1..9)

Missing   Duplicate
-------   ---------
{6, 4, 2} {8, 3}
```



## Summary

Using the `Measure-Command` and running this against a list `1..27000`, it took 31 seconds on my machine to process. Also, while not tested, this should work on non-integer items as well.

I encourage you to check out the book `Programming Pearls`. At the end of the chapter, Jon Bentley suggests further reading and additional ways to think about solving this and points to examples, even though they are from a different "computing era" they are informative.

> As Mr. Bentley says "reading about these approaches to software can change the way you think about programming"