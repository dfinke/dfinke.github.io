---
layout: post
title:  "PowerShell: Regex On Steroids"
date:   2019-04-28 11:00
comments: true
description: "PowerShell-Regex-On-Steroids"
categories:
    - PowerShell
tags:
    - PowerShell, PSStringScanner
---

>Text is everywhere. Newspaper articles, database dumps, spreadsheets, the
output of shell commands, keyboard input; it’s all text, and it can all be processed
in the same fundamental way. Text has been called “the universal
interface,” and since the early days of Unix in the 1960s this universal interface
has survived and flourished—and with good reason.

> -- [Rob Miller](https://twitter.com/robmil) "Text Processing with Ruby"

In reading Rob's book, he covers regular expressions and then kicks it up a notch. One of the tools he covers is [Ruby strscan](https://github.com/ruby/strscan), which *provides lexical scanning operations on a string*.

## So I ported it to PowerShell

You can check out the [source on GitHub](https://github.com/dfinke/PSStringScanner) and it's [on the PowerShell Gallery](https://www.powershellgallery.com/packages/PSStringScanner/1.0.5) - `Install-Module -Name PSStringScanner`.

There are [several examples](https://github.com/dfinke/PSStringScanner/tree/master/examples), definitely take a look, there is a lot of power and cool ideas in these time tested techniques.

Also, there is a ["How To - PSStringScanner"](https://github.com/dfinke/PSStringScanner/blob/master/README.md) to get you started.

## Quickly Convert Git Logs to PowerShell

I saw a tweet

> `git log --first-parent` will give you a git log that includes only merge commits and commits not included in a merge (i.e. one entry per merge). Very useful for reviewing what the latest changes were if you don't squash merges. [Original Tweet](https://twitter.com/Tyriar/status/1122288792281333760)

Below is a sample of the output from that command. I thought it'd be useful to transform that to a PowerShell object with the properties, `Name`, `Email`, `Date`, `CommitMessage`.

```
commit 337af82ae2d42439b6fb8044bf2c40d0c608ef38
Author: dfinke <finked@hotmail.com>
Date:   Fri Apr 12 16:02:47 2019 -0400

    Updated readme.md

commit 77ef2ebc4092e8841877ae0f3cd0359f4e7b0a7b
Merge: 0febb4a 92c97b2
Author: Doug Finke <finked@hotmail.com>
Date:   Mon Apr 8 16:42:28 2019 -0400

    Merge pull request #576 from ili101/FixDataTablePerformance

    Double DataTable performance

commit 0febb4a3c23aaefe9acafe867e99da9aa3ece9db
Merge: 62f0faa 1055bc4
Author: Doug Finke <finked@hotmail.com>
Date:   Sun Apr 7 14:47:06 2019 -0400

    Merge pull request #575 from ili101/TableStyleFix

    TableStyle is set to Medium6 but ignored
```

Here you see the transform.

```
Name                Email                           Date                   CommitMessage
----                -----                           ----                   -------------
dfinke              finked@hotmail.com              4/12/2019 4:02:47 PM   Updated readme.md
Doug Finke          finked@hotmail.com              4/8/2019 4:42:28 PM    Merge pull request #576 from ili101/FixDataTablePerformance
Doug Finke          finked@hotmail.com              4/8/2019 4:42:28 PM    Double DataTable performance
Doug Finke          finked@hotmail.com              4/7/2019 2:47:06 PM    Merge pull request #575 from ili101/TableStyleFix
Doug Finke          finked@hotmail.com              4/7/2019 2:47:06 PM    TableStyle is set to Medium6 but ignored
```

Here is the PowerShell script, using `PSStringScanner` [GetGitMergeOnly.ps1](https://github.com/dfinke/PSStringScanner/blob/master/examples/GetGitMergeOnly.ps1).

> The essence of StringScanner is in its name. It lets you scan through a string, moving through it as you capture information, always knowing where in the string you are. Unlike with a regular expression, at any point in our scanning through the string we can stop and make decisions. We can look ahead to see what’s coming next, and take a different course of action depending on the answer. We can use recursion, too, to match nested constructs.

> -- [Rob Miller](https://twitter.com/robmil) "Text Processing with Ruby"

`PSStringScanner` is implemented using a PowerShell class. One of the methods is `Scan` which takes a regular expression. When the regex is a match, it advances the position tracker so subsequent `Scan` calls advance through the string from the correct point.

The [GetGitMergeOnly.ps1](https://github.com/dfinke/PSStringScanner/blob/master/examples/GetGitMergeOnly.ps1) uses several of the methods supported `Check`, `Scan`, and `ScanUntil`. The are more and when used together you can build extremely flexible text processing PowerShell scripts, check out the examples.

The [GetGitMergeOnly.ps1](https://github.com/dfinke/PSStringScanner/blob/master/examples/GetGitMergeOnly.ps1) is implemented in 37 lines of code. Including the definition of simple regex patterns, extraction of the key text, converting the date time, and outputting a PowerShell custom object.

After checking it out, you can start to see how the text processing can be made reusable, so for other text processing needs, you can build a toolkit that lets you build primitives that you can use compose into larger solutions.

## In Progress

GitHub has a new feature called `GitHub Actions`. This is a sample of the syntax and how you interact with it. c

```
workflow "Build and Publish" {
  on = "push"
  resolves = "Docker Publish"
}

action "Shell Lint" {
  uses = "actions/bin/shellcheck@master"
  args = "entrypoint.sh"
}
```

Here is a PowerShell function [Import-GitHubAction](https://gist.github.com/dfinke/8c56cbe95a0e531c24a935fa05633356) using `PSStringScanner`, parsing the format and outputting PowerShell objects.

```
PS C:\> Import-GitHubAction .\github.action
Type     Name              Key      Value
----     ----              ---      -----
workflow Build and Publish on       push
workflow Build and Publish resolves Docker Publish
action   Shell Lint        uses     actions/bin/shellcheck@master
action   Shell Lint        args     entrypoint.sh
```

Easily transforming text into PowerShell objects is a powerful tool in the toolbox. Definitely check out [PSStringScanner](https://github.com/dfinke/PSStringScanner).

I'd love to see what text processing you get going with this.