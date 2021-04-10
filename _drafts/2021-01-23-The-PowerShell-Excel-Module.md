---
layout: post
title:  The-PowerShell-Excel-Module
date:   2021-01-23 09:00
comments: true
description: "The-PowerShell-Excel-Module"
categories:
    - PowerShell,Excel
tags:
    - PowerShell,Excel
---

> When you come to a fork in the road, take it
>
> ~ Yogi Berra

# Open post for discussion on the PowerShell Excel module

The PowerShell Excel module I created a few years ago, having almost 700,000 downloads, and is pretty popular, has reached a decision point.

I use another open source library to make the PowerShell magic come together, called EPPlus. EPPlus handles the reading/writing of the Excel file and is written in C#.

The two developers who maintain that project, for the last 10 years, decided a year ago to move to a different licensing model, do numerous bug fixes, and add a host of new features. The new model stipulates if you use EPPlus in a commercial or enterprise setting, you need to purchase a license.

Being a maintainer of OSS products, I agree with their approach for the amount of time an effort they put into an offering such as that.

## The Fork in the Road

The EPPlus license allows other open source projects to use it for free. **BUT** users of the secondary OSS are required to get a license if they use the secondary OSS is used in a commercial or enterprise setting.

The new version of EPPlus has numerous fixes, breaking changes, and features. This means I need to do the work and update the PowerShell to adjust to the fixes, changes and enable the new features.

Lots of effort. Plus, existing users would need to migrate to the release as well, handling the same issues.

## The Challenge

I and others have spent our free time building this, answering questions, writing help, blogs, and creating videos, with no monetary compensation.

This is not a complaint, it's been fun tool to build, interact with the community, and brain candy to see how people use it and work out solutions.

My PowerShell module that lets you create solutions to read/write Excel, manipulate data, formulas, pivot tables, and much more, has been available for free for years.

If I invest the effort migrate it to the new version of EPPlus, it feels fair that the EPPlus team gets paid for their investment. To be honest, I feel the same way, would want to be paid for my effort.

Unlike the team that supports the EPPlus product, I wouldn't to be able to provide standard tech support, or be able to give a SLA for bug fixes.

## Summary

In a nutshell, I'm on the fence about porting the PowerShell Excel module to the new version. I get numerous emails from people around the world telling me how much time my module saves them, how great the module is, and then vast number of features.

Investing the effort into porting it and kicking it up a notch, knowing only the EPPlus folks would reap the monetary reward is the rub. The rub is how to monetize the PowerShell part that I build. To be clear the EPPlus folks deserve every part for their effort. The PowerShell module would not have been possible without their work.

So "When you come to a fork in the road, take it". The choice point is, leave the existing module as is or port it?