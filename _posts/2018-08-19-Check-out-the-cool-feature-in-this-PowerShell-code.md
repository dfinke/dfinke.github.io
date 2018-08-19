---
layout: post
title:  "Check out the cool feature in this PowerShell code"
date:   2018-08-19 13:00
comments: true
description: "Check-out-the-cool-feature-in-this-PowerShell-code"
categories:
    - PowerShell, Markdown
tags:
    - PowerShell, Markdown
---

In the last post [Check out this Two for One PowerShell code](https://dfinke.github.io/powershell,%20markdown/2018/08/13/Check-out-this-Two-for-One-PowerShell-code.html)
I showed the PowerShell script that transforms a simple markdown file, with a couple additions, into book chapters and how it also uses the PowerShell ScriptAnalyzer to check the code samples in your markdown for correctness.

## Create a PDF

There's another cool feature in the module. If you have both Pandoc and the LaTEX library MiKTeX installed, you can use the `-AsPDF` switch to generate a PDF, table of contents included, like this.

```powershell
ConvertFrom-ReadmeMD -AsPDF
```

## Markdown To PDF

Running `ConvertFrom-ReadmeMD -AsPDF`, converts the markdown contents to separate chapter files, runs PowerShell ScriptAnalyzer on your samples, and then looks to see if the Pandoc tool is installed. If so, it runs it against the chapter files, creating the PDF complete with a table of contents.

![](/images/posts/MarkdownToPDF.png)


## Installing Pandoc On Windows

So, grab the module on the [PowerShell Gallery](https://www.powershellgallery.com/packages/ConvertFromReadmeMD) and if you want to auto create the PDF install these great tools.

* [Pandoc - a universal document converter](https://pandoc.org/installing.html#windows)
* [MiKTeX is an implementation of TeX/LaTeX](https://miktex.org/howto/install-miktex)