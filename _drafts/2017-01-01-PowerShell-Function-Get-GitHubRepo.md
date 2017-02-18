---
layout: post
title:  "PowerShell Function Get-GitHubRepo"
date:   2017-01-01 12:05
comments: true
description: "PowerShell Function Get-GitHubRepo"
categories: 
    - PowerShell
tags: 
    - PowerShell, GitHub
---

![](/images/posts/GetGitHubRepo.gif)

```PowerShell
$creds=@{
    GitHubId="<Your GitHub Id>"
    GitHubPwd="<Your GitHub Password>"
}

Get-GitHubRepo @creds microsoft | out-gridview
```