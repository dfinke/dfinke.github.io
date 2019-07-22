---
layout: post
title:  "Connecting a PowerShell Azure Function to a GitHub Webhook"
date:   2019-05-16 13:00
comments: true
description: "Connecting-a-PowerShell-Azure-Function-to-a-GitHub-Webhook"
categories:
    - PowerShell
tags:
    - PowerShell, AzureFunctions, Azure, Functions
---

> GithUb webhooks allow you to build or set up integrations, such as GitHub Apps or OAuth Apps, which subscribe to certain events on GitHub.com. When one of those events is triggered, we'll send a HTTP POST payload to the webhook's configured URL. Webhooks can be used to update an external issue tracker, trigger CI builds, update a backup mirror, or even deploy to your production server. You're only limited by your imagination.

First up we'll walk through setting up a PowerShell Azure Function that can be triggered by a GitHub Event so you can inspect the JSON payload sent.

> Each event corresponds to a certain set of actions that can happen to your organization and/or repository. For example, if you subscribe to the issues event you'll receive detailed payloads every time an issue is opened, closed, labeled, etc.

## Why?

Using a PowerShell function you can easily interact with GitHub events through webhook and GitHub tokens to do additional automation when commits are done for adding, modifying or deleting content in the repository. This is also only one of the infinite of scenarios you can work up.

## The PowerShell Azure Function

