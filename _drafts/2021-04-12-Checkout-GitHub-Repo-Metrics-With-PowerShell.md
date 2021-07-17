---
layout: post
title:  Checkout GitHub Repo Metrics With PowerShell
date:   2021-04-12 16:00
comments: true
description: "Checkout-GitHub-Repo-Metrics-With-PowerShell"
categories:
    - PowerShell,GitHub,GitHub CLI
tags:
    - PowerShell,GitHub,GitHub CLI
---

<!-- What can you do with #PowerShell the #GitHub CLI and #GraphQL  -->

With open-source software you want to figure out how much churn there is in the GitHub repository. You can tell a lot from metrics about the health of the software in the repo.

Using the `gh cli` and PowerShell, quickly pull the details. Plus, you can then pipe these results to a CSV file, Excel spreadsheet, or a database for long term data collection. You can even set this up in a PowerShell Azure function to run a schedule to monitor potential open-source you want to use going forward.

```powershell
$list = $(
    'powershell/powershell'
    'microsoft/azuredatastudio'
    'microsoft/vscode'
    'microsoft/TypeScript'
    'golang/go'
    'spinnaker/spinnaker'
    'kubernetes/kubernetes'
) 

$list | Get-Metrics
```

## Results
<br/>

```
TimeStamp            Owner      Name            IsPrivate Issues PullRequests Releases Stargazers Watchers ForkCount
---------            -----      ----            --------- ------ ------------ -------- ---------- -------- ---------
4/10/2021 3:52:07 PM powershell PowerShell          False   8943         5920       93      25652     1297      4099
4/10/2021 3:52:07 PM microsoft  azuredatastudio     False   8115         6884       99       6288      273       655
4/10/2021 3:52:08 PM microsoft  vscode              False 109498         9155       33     114358     3124     18556
4/10/2021 3:52:08 PM microsoft  TypeScript          False  29801        12995      130      70032     2161      9239
4/10/2021 3:52:08 PM golang     go                  False  43585         1628        0      84388     3525     12291
4/10/2021 3:52:09 PM spinnaker  spinnaker           False   4869         1516       70       7757      363      1081
4/10/2021 3:52:09 PM kubernetes kubernetes          False  38040        62939      458      76131     3264     27651
```

## TL;DR

`gh` is GitHub on the command line. It brings many GitHub concepts to the terminal or scripts, including `GraphQL`. The GitHub GraphQL API offers flexibility and the ability to define precisely the data you want to fetch.

## Install

Check out the instructions to install the `gh cli`.

https://github.com/cli/cli#installation

## Get-Metrics PowerShell Function

This PowerShell function uses the `gh cli` to invoke the GrahQL api, takes the results and transforms the to the above data shape.

```powershell
function Get-Metrics {
    param(
        [Parameter(ValueFromPipeline)]
        $slug
    )

    Process {
        $owner, $repo = $slug.split('/')

        $result = gh api graphql -F owner=$owner -F repo=$repo -f query='
query($owner: String!, $repo: String!) { 
    repository( owner: $owner, name: $repo ) {
        name
        isPrivate
        issues{totalCount}
        pullRequests{totalCount}
        releases{totalCount}
        stargazers{totalCount}
        watchers{totalCount}
        forkCount
    }
}
'
        $repoStats = (ConvertFrom-Json $result).data.repository

        [PSCustomObject][Ordered]@{
            TimeStamp    = Get-Date
            Owner        = $owner
            Name         = $repoStats.name
            IsPrivate    = $repoStats.isPrivate
            Issues       = $repoStats.issues.totalCount
            PullRequests = $repoStats.pullRequests.totalCount
            Releases     = $repoStats.releases.totalCount
            Stargazers   = $repoStats.stargazers.totalCount
            Watchers     = $repoStats.watchers.totalCount
            ForkCount    = $repoStats.forkCount
        }
    }
}
```

## Finished

After the results are transformed from the `gh cli` to the PowerShell `PSCustomObject` you can further pipe the data to other data stores like:

### A CSV file

```powershell
$list | Get-Metrics | Export-Csv ./metrics.csv 
```

### An Excel file

```powershell
$list | Get-Metrics | Export-Excel
```

Once in PowerShell, the sky's the limit what you can do with it.