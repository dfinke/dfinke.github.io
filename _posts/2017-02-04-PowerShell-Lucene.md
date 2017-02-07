---
layout: post
title:  "PowerShell and Lucene"
date:   2017-02-04 10:05
comments: true
description: "PowerShell and Lucene"
categories: 
    - PowerShell
tags: 
    - PowerShell, Lucene
---

## Lucene.NET is . . .

* a full-text search engine
* written in C#
* open source
* [https://github.com/apache/lucenenet](https://github.com/apache/lucenenet)

## PowerShell and Lucene
In 2016, Bruce Payette (co-founder of PowerShell), presented at the PowerShell conference in Germany on Lucene.NET full text search 
engine with PowerShell. 

[![](https://img.youtube.com/vi/WOEmlc3tkTU/0.jpg)](https://www.youtube.com/watch?v=WOEmlc3tkTU)

### Intriguing
Working from his example, in PowerShell I layered a `WPF` UI on top of the search engine. You can specify directories and patterns to do a full text index on like `c:\posh\*.ps1, c:\temp\*.cs`. This does a recursive search of  `c:\posh` for files whose extension is `.ps1` and the `c:\temp` or C# files. Each file found is passed to the Lucene engine it is creates an index of each word in that file. 

![](https://github.com/dfinke/PoShLucene/blob/master/media/PoshLuceneNextPref.gif?raw=true)

After the files are searched and the index created, you can search for a word across all files. It's blazingly fast.

Every file where the word is found, it is added to the list. You can click on the file names in the list and its contents are displayed below.

[David Wilson](https://twitter.com/daviwil), from the PowerShell team and developer of the Visual Studio Code Editor Service, did a cool pull request for this, adding `Previous` and `Next` occurence. Using the buttons or `F3` you can find the next occurence of the search term you specified. It highlights the hits in the file, let's you find the `next` (or `previous`) hit and will take you to the next (or previous) file after you find the last (first) hit of your search term.

## Where to Get it?

The PowerShell module is published in the gallery, from a PowerShell console you can do `Install-Module -Name PoShLucene`. You can check it out here [PowerShell Gallery PoShLucene](https://www.powershellgallery.com/packages/PoShLucene/1.0).

The source for the PowerShell script is also on my [GitHub Repo](https://github.com/dfinke/PoShLucene).

Check it out, kick the tires, file reuqests/bugs. Even better, fork it and do a pull request and make it better.
