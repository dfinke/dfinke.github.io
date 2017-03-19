function New-BlogPost {
    param(
        [parameter(Mandatory)]
        $name,
        [parameter(Mandatory)]
        $title,
        $description="This is the description",
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
    - classes
##thumbnail: /images/posts/powershell-classes-and-concepts/powershell-highlander.png
---
"@

    $init  | Set-Content $fullName -Encoding Ascii
}

#cls
#New-BlogPost test-post "A test post"