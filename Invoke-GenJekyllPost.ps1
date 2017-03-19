function Invoke-GenJekyllPost {
    param(
        $title,
        $tag,
        [ValidateSet('draft','post')]
        $postType="draft"
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

    $basepath="C:/Users/Douglas/Documents/GitHub/dfinke.github.io" 
    
    
    if($postType -eq 'post') {
        $fileName="$($basepath)/_posts/$($fileName)"
    } else {
        $fileName="$($basepath)/_drafts/$($fileName)"        
    }
    
    $content | Set-Content -Encoding Ascii $fileName
}