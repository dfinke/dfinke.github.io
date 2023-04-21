---
layout: post
title:  Analyzing GitHub Stats with PowerShell
date:   2021-06-14 09:00
comments: true
description: "Analyzing-GitHub-Stats-with-PowerShell"
categories:
    - PowerShell, GitHub, Repositories, Stats
tags:
    - PowerShell, GitHub, Repositories, Stats
---

GitHub is packed with open-source tools, and you need to know  if they're stable, up-to-date, or regularly maintained. How can you do a health check on GitHub projects you're looking at  adopting.

In this post, I'll show you how to use PowerShell to easily query the GitHub to analyze the health of your and other GitHub repositories.

## Plan

- Access the metrics from GitHub GraphQL. For example:
    - Number of issues
    - Number of pull requests
    - Number of commits
    - Number of star gazers
    - Number of forks
- Repositories being check:
    - PowerShell
    - Visual Studio Code
    - Kubernetes
    - and more...

### Dial in

- GitHub provides both a REST API and GraphQL to gather this information. In order to use it, you'll need a personal access token in order to authenticate.

## Roadmap
1. [ ] Create a personal access token
1. [ ] Create a PowerShell script to query the GitHub GraphQL for these fields
    - forkCount
    - stargazers
    - issues total count
    - pull requests total count
    - releases total count
1. [ ] Using GitHub Actions to run the script
1. [ ] Export the results to an Excel file using the PowerShell ImportExcel module
1. [ ] Check this new spreadsheet back into the repo

## Expected Result
Written in PowerShell, retrieve the metrics from GitHub, export them to Excel, and the final step in the GitHub Action checks the new spreadsheet file back to the repo.