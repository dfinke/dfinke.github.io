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

## Convert From Markdown: In Action Video

Check it out, [How to ConvertFrom-Markdown](https://www.youtube.com/watch?v=z41g58gwdFw&t=1s) with all the bells and whistles.

## Create a PDF

There's another cool feature in the module. If you have both Pandoc and the LaTEX library MiKTeX installed, you can use the `-OutputType PDF` switch to generate a PDF, table of contents included, like this.

```powershell
ConvertFrom-Markdown -OutputType PDF
```

## Markdown To PDF

Running `ConvertFrom-Markdown -OutputType PDF`, converts the markdown contents to separate chapter files, runs PowerShell ScriptAnalyzer on your samples, and then looks to see if the Pandoc tool is installed. If so, it runs it against the chapter files, creating the PDF complete with a table of contents.

![](/images/posts/MarkdownToPDF.png)

***Note***: `ConvertFrom-Markdown` also supports creating `HTML` and `Microsoft Word docs`

```powershell
ConvertFrom-Markdown -OutputType Docx
```

```powershell
ConvertFrom-Markdown -OutputType Html
```

## Installing Pandoc On Windows

So, grab the module on the [PowerShell Gallery](https://www.powershellgallery.com/packages/ConvertFromMarkdown) and if you want to auto create the PDF install these great tools.

* [Pandoc - a universal document converter](https://pandoc.org/installing.html#windows)
* [MiKTeX is an implementation of TeX/LaTeX](https://miktex.org/howto/install-miktex)