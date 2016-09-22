---
layout: post
title:  "PowerShell: A natural language date/time parser"
date:   2016-09-04 16:00
comments: true
description: "PowerShell: A natural language date/time parser"
categories: 
    - PowerShell
tags: 
    - PowerShell
    - Time
    - NLP Parser
---

[Here is a `.NET`](https://github.com/robertwilczynski/nChronic) A natural language date/time parser `nChronic` ported from Ruby, and I've wrapped it in `PowerShell`.

## In Action

![](/images/posts/DateTimeParser.gif)


## It Can Also Handle
It's a powerful, flexible parser.

```PowerShell
PS C:\> Get-DateEx 12 seconds ago
Wednesday, September 21, 2016 8:52:25 PM

PS C:\> Get-DateEx 34 minutes 12 seconds ago
Wednesday, September 21, 2016 8:18:30 PM

PS C:\> Get-DateEx 13 hours 34 minutes 12 seconds ago
Wednesday, September 21, 2016 7:18:37 AM

PS C:\> Get-DateEx 9 days 13 hours 34 minutes 12 seconds ago
Monday, September 12, 2016 7:18:41 AM

PS C:\> Get-DateEx 7 weeks 9 days 13 hours 34 minutes 12 seconds ago
Monday, July 25, 2016 7:18:43 AM

PS C:\> Get-DateEx 3 years 7 weeks 9 days 13 hours 34 minutes 12 seconds ago
Thursday, July 25, 2013 7:18:48 AM
```

## Other Uses
Schedule jobs or query logs in a snap.

```PowerShell
Get-AzureLog -StartTime (Get-DateEx 2 weeks ago)
```

## Coming to the PowerShell Gallery

[Soon](https://www.powershellgallery.com/)