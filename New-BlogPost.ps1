function New-BlogPost {
    param(
        [parameter(Mandatory)]
        $name,
        $title,
        $description,
        [ValidateSet('Post','Draft')]
        $PostType="Draft"
    )

    $basePath = "C:\Users\Douglas\Documents\GitHub\dfinke.github.io\"
    $postPath = "$($basePath)\_drafts"
    if($PostType -eq "post") {
        $postPath = "$($basePath)\_posts"
    }

    $date = Get-Date
    
    $fileName = "{0}-{1}.md" -f $date.ToString("yyyy-MM-dd"),$name
    $fullName =  "$($postPath)\$($fileName)"
    
    $postDate = $date.ToString("yyyy-MM-dd HH:mm:ss")

    if(!$title) {
        $title=$name
    }

    if(!$description) {
        $description=$name
    }
    
    $init = @"
---
layout: post
title:  "$title"
date:   $postDate
comments: true
description: $description
categories: 
    - PowerShell
tags: 
    - PowerShell
# thumbnail
---
"@

    $init  | Set-Content $fullName -Encoding Ascii
}