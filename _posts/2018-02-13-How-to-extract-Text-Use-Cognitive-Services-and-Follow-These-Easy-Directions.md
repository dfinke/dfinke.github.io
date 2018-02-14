---
layout: page

title: "How to extract Text..Use PowerShell + Cognitive Services and Follow These Easy Directions"
date:   2018-02-13 10:00:00
comments: true
description: "How to extract Text..Use PowerShell + Cognitive Services and Follow These Easy Directions"
categories:
    - PowerShell
tags:
    - PowerShell, Cognitive Services
---

## Getting Started
Copy an image to the Windows Clipboard, run `ConvertFrom-ClipboardToText` and that's it in a nutshell.

1. If you don't have an Azure account, [Create your Azure free account today](https://azure.microsoft.com/en-us/free)
1. [Grab your Computer Vision API key](https://azure.microsoft.com/en-us/try/cognitive-services/), you'll need it to access the OCR feature of cognitive services
1. Grab the PowerShell code on the [PowerShell Gallery](https://www.powershellgallery.com/packages/PSImageToText)
1. Set the `$ENV:MicrosoftVisionKey` you set up in `Step 2`

## In Action
![image](https://raw.githubusercontent.com/dfinke/PSImageToText/master/images/CvtClpToTxt.gif)