---
layout: post
title:  "PowerShell is a Query Language for JSON"
date:   2016-05-08 15:11
comments: true
description: "PowerShell is a Query Language for JSON."
categories: 
    - PowerShell
tags: 
    - PowerShell
    - JSON
---

PowerShell, as is, has all the tools you need to query JSON and then reshape, re-purpose it to what you need.
 
```powershell
$json = @"
{
  "locations": [
    {"name": "Seattle", "state": "WA"},
    {"name": "New York", "state": "NY"},
    {"name": "Bellevue", "state": "WA"},
    {"name": "Olympia", "state": "WA"}
  ]
}
"@ | ConvertFrom-Json

$names=(($json.locations | ? state -eq 'wa').name | Sort) -join ','    

@{WashingtonCities = $names} | ConvertTo-Json
```

## Result

```
{
    "WashingtonCities":  "Bellevue,Olympia,Seattle"
}
```