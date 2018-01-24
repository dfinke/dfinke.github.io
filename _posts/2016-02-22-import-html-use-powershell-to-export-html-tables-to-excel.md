---
layout: page
title:  "Import-Html Use PowerShell to Export Html Tables to Excel"
date:   2016-02-22 20:41
comments: true
description: "Import-Html Use PowerShell to Export Html Tables to Excel"
categories:
    - PowerShell
tags:
    - PowerShell
    - Excel
---

Added a new feature to my PowerShell Excel Module, `Import-Html`. Provide the URL of the page that has the `table` html tag and the `index`, starting at 0, identifying the table in the HTML to return.

It locates the table, grabs the headers if present (or creates them on the fly) and finally exports them directly to and Excel spreadsheet.

## Get the Module
Grab the module from either the [PowerShell Gallery](https://www.powershellgallery.com/packages/ImportExcel) or [GitHub](https://github.com/dfinke/ImportExcel).

![](https://raw.githubusercontent.com/dfinke/ImportExcel/master/images/ImportHtml.gif)