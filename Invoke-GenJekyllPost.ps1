function Invoke-GenJekyllPost {
    param(
        $title,
        $tag
    )

    $tags=@('PowerShell')
    if($tag) {
        $tags+=$tag
        $tags=$tags -join ','
    }

    $content=@"
---
layout: post
title:  "$($title)"
date:   $((get-date).tostring("u") -replace 'z$','')
comments: true
description: "$($title)"
categories: 
    - PowerShell
tags: 
    - $($tags)
---
"@

    $fileName=("{0}-{1}.md" -f (Get-Date).ToString("yyyy-MM-dd"),($title -replace ",| ","-")) -replace "--","-"
 
    $content | Set-Content -Encoding Ascii $fileName
}