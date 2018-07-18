---
layout: post
title:  "Jacquard Loom, Punch Cards and PowerShell"
date:   2018-07-11 18:00
comments: true
description: "Jacquard-Loom-Punch-Cards-and-PowerShell"
categories:
    - PowerShell
tags:
    - PowerShell, Jacquard, Loom, Knitting
---

I'm resurrecting this old post, from *July 2008*, it's ten years old. I show a ***knitting language*** I built in PowerShell and this dusting off all started from a tweet.

Thanks to [@mellobeing](https://twitter.com/mellowbeing/status/1018508770337574914) who tweeted about wanting to meet more coders who do more than code, specifically, knitters and crafters.

![](https://raw.githubusercontent.com/dfinke/dfinke.github.io/master/images/posts/knitting.png)

It's a really cool thread, I learned a lot, got new ideas and interacted with a few new people.

One person responded:
> learning to read a knitting pattern is basically turning yourself into something that runs code

[@Alan_Florance](https://twitter.com/Alan_Florance) from the PowerShell community tweeted to me:

> Knitting would be appropriate since one of the earliest forms of programming was the jacquard loom

With a link to this video [Jacquard Loom: Early Computer Programing](https://www.youtube.com/watch?v=lwozgRPLVC8).

This prompted me to pull out and format this 10 year old post.


## Jacquard Loom, Punch Cards and PowerShell
### originally posted July 2008

> In 1801, Joseph Marie Jacquard invented an improved textile loom. The Jacquard loom was the first machine to use punched card. These punched cards controlled the weaving producing beautiful patterns in a style previously accomplished only with patience, skill, and hard work.

### Knitting
Has a programming language. Follow it and you produce elaborate patterns and designs. Including sections which are narrowed, elastic, angled, mitered, curved and more.

<pre>co <span style="color: maroon">24</span>
Row <span style="color: maroon">1</span> (WS):
 *k1 p2* Repeat to * <span style="color: maroon">2</span> times.
  [k2tog, yo, k1, yo, cdd, ssk, yo, k3]
    repeat <span style="color: maroon">2 </span>times end k4</pre>

<p>These instructions increase or decrease the number of stitches being worked to produce the desired effect.</p>

### PowerShell *Knitting* Language

The knitting instructions don't tell how many stitches you'll end with when your done with a row. If you missed a few, your piece will not look right and sometimes there are printed errors.

Here is PowerShell function which lets me express the pattern in terms of the knitting instructions.

**The Code**
```powershell
function KnittingLanguage($pgm) {
  switch -regex ($pgm) {
    k2tog   { "[decrease] knit two together"       }
    yo      { "[increase] yarn over"               }
    ssk     { "[decrease] slip, slip, knit"        }
    cdd     { "[decrease] central double decrease" }
    "^k\d$" { "knit " * $_.substring(1)            }
    "^p\d$" { "purl " * $_.substring(1)            }
  }
}

function list {$args}
```

**Example 1**

```ps
PS C:\> KnittingLanguage ( (list k1 p2) * 2)
```

**Result**
```
knit
purl purl
knit
purl purl
```

**Example 2**

```ps
KnittingLanguage ( (list k2tog yo k1 yo cdd ssk yo k3) * 2 )
```

**Result**

```
[decrease] knit two together
[increase] yarn over
knit
[increase] yarn over
[decrease] central double decrease
[decrease] slip, slip, knit
[increase] yarn over
knit knit knit
[decrease] knit two together
[increase] yarn over
knit
[increase] yarn over
[decrease] central double decrease
[decrease] slip, slip, knit
[increase] yarn over
knit knit knit
```

**Example 3**

```ps
KnittingLanguage k4
```

**Result**
```
knit knit knit knit
```

Create a variable with the initial number of stitches. In the correct script block, decrement or increment it. The final count is the total number of stitches.

## Jacquard's loom

Here is an image of Jacquard's loom being controlled by punch cards. The long yellow rectangular pieces with the holes in them. The areas with holes meant "ON" and no hole meant "OFF".

![](https://upload.wikimedia.org/wikipedia/commons/8/84/NMS_Jacquard_loom.JPG)



## The IBM Hollerith punch card

Used the loom's punch card as inspiration.

![](http://4.bp.blogspot.com/_kxPG6y8Qctk/SdYakc8KIPI/AAAAAAAACwE/xWT8lelaT8k/s400/punch_card.75dpi.rgb.gif)