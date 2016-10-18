---
layout: post
title:  "PowerShell, Tanimoto Coefficient and Programming Collective Intelligence"
date:   2016-10-18 12:05
comments: true
description: "PowerShell, Tanimoto Coefficient and Programming Collective Intelligence"
categories: 
    - PowerShell
tags: 
    - PowerShell
---

This is a repost of a blog I did back in 2008, on my old, old blog. Then, I was reading Toby Segaran's book [Programming Collective Intelligence](https://www.amazon.com/gp/product/0596529325/ref=as_li_qf_sp_asin_il?ie=UTF8&camp=1789&creative=9325&creativeASIN=0596529325&linkCode=as2&tag=tasktoy-20).

His book presented how to use these an algorithm like Tanimoto Coefficient to mine sites like Facebook, MovieLens, Delicious, Blogs and more.

[Tanimoto similarity and distance](https://en.wikipedia.org/wiki/Jaccard_index#Tanimoto_similarity_and_distance)

> A method of classification based on a similarity ratio, and a derived distance function, [...] "Tanimoto similarity" and "Tanimoto Distance". The similarity ratio is equivalent to Jaccard similarity, but the distance function is not the same as Jaccard distance.

## Here is the PowerShell version:

```PowerShell
function Get-TanimotoCoefficient ($q,$t) {
    $c = $q | where {$t -eq $_}
    $c.count / ($q.count + $t.count - $c.count)
}

# Results

PS C:\> $list = echo shirts socks pants shoes
PS C:\> Get-TanimotoCoefficient $list (echo skirts socks shoes)
0.4

PS C:\> Get-TanimotoCoefficient $list (echo shirts socks)
0.5

PS C:\> Get-TanimotoCoefficient $list (echo socks pants hat gloves)
0.333333333333333
```

