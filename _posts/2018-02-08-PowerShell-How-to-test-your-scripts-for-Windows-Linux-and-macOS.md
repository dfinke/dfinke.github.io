---
layout: page
title:  "PowerShell - How to test your scripts for Windows, Linux and macOS"
date:   2018-01-23 19:00:00
comments: true
description: "PowerShell - How to test your scripts for Windows, Linux and macOS"
categories:
    - PowerShell
tags:
    - PowerShell
---

# The new edition of PowerShell

v6.0, is out and generally available. Along with that, PowerShell is now cross-platform. This means if you write PowerShell scripts you can expand your client base, your reputation and your bank account.

# There's No Free Rides
With great power, comes great responsibility. Consider this, you're currently writing a cool PowerShell script or module, and you've developed it on and for PowerShell v5.1. Now, you want to try it on PowerShell v6 on Windows. If you use `Get-WmiObject` you'll need to change that to `Get-CimInstance` so it works v6.

How do you try this out? One option, load up v6 on your Windows machine, type `pwsh`and run through your scripts. Now, when you make a modification, you've got double the work to test things out. Sounds like a lot of effort and a ton of room to miss many things.

Let's toss this into the mix, there are Linux and macOS folks who could benefit from your scripts (and you could benefit from them) big problem, `Get-WmiObject` and `Get-CimInstance` don't work on those systems. How do you test your scripts on a Linux and macOS? Buy more hardware? Use virtualization software? Containers? Once that's in place, you change to the script, how do you manage running your script(s)/module on several systems?

# Automate the Automation
Let's talk about three free services that make this happen (so long as you scripts are public, otherwise you'll need to consider the pricing options). These services `GitHub`, `Appveyor` and `Travis-CI` let you use version control for your scripts, run Windows PowerShell v5.1, Windows PowerShell v6, Linux PowerShell v6 and macOS v6. Check out my GitHub repo [PSMatcher](https://github.com/dfinke/PSMatcher) and you'll see two files which direct the Appveyor ([appveyor.yml](https://github.com/dfinke/PSMatcher/blob/master/appveyor.yml)) and Travis-CI ([.travis.yml](https://github.com/dfinke/PSMatcher/blob/master/.travis.yml)) services to spin up the operating systems, run the correct versions of PowerShell then run [Pester](https://github.com/Pester/Pester/wiki) tests.

| One cool part is, Pester tests are written PowerShell, this reduces the learning curve nicely.

# Getting Started

Visit these websites and sign up. Is fast and free.

* https://github.com/
* https://www.appveyor.com/
* https://travis-ci.org

Once signed up and check in your scripts and `yaml` files. Next, connect the repo to Appveyor and Travis-CI. Now when you check in a change, GitHub will notify both services. These services will `checkout` your code, spin up the operating systems you requested and run the Pester tests in the version of PowerShell you specifed.

# Badges

Both services provide the badges below, giving at a glance indication if your build failed. Click on the images, they are links to my builds for the `PSMatcher` PowerShell module (also on the [PowerShell Gallery PSMatcher](https://www.powershellgallery.com/packages/PSMatcher))

* Appveyor build [![Build status](https://ci.appveyor.com/api/projects/status/8yhhd5qu00pp04ue/branch/master?svg=true)](https://ci.appveyor.com/project/dfinke/psmatcher/branch/master)

* Travis-ci build [![Build Status](https://travis-ci.org/dfinke/PSMatcher.svg?branch=master)](https://travis-ci.org/dfinke/PSMatcher)

# Finally
The difference between a good PowerShell scripter and a great PowerShell scripter is the number of tests they write and their CI/CD pipeline. With these in place, you'll be able confidently fix your scirpts, enhance them and even deliever experimental versions with less pain and less drama.