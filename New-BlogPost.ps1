param(
    [parameter(Mandatory)]
    $title,
    $tag,
    [ValidateSet('draft', 'post')]
    $postType = "draft"
)

$tags = @('PowerShell')
if ($tag) {
    $tags += $tag
    $tags = $tags -join ','
}

$content = @"
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

$fileName = ("{0}-{1}.md" -f (Get-Date).ToString("yyyy-MM-dd"), ($title -replace ",| ", "-")) -replace "--", "-"

$basepath = "C:/Users/Douglas/Documents/GitHub/dfinke.github.io" 

switch ($postType) {
    "post" {
        $targetPath = "_posts"
    }
    "draft" {
        $targetPath = "_drafts"
    }
}
    
$fileName = "$($basepath)/$($targetPath)/$($fileName)"
    
$content | Set-Content -Encoding Ascii $fileName