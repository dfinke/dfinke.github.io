param(
    [Parameter(Mandatory = $true)]
    $codeFile
)

if(-not (Test-Path $codeFile)){
    Write-Host "File not found: $codeFile"
    exit
}

$code = Get-Content $codeFile -Raw

$prompt = @"
Here is the code for your review:

$($code)
"@


$instructions = @"
You are a Senior Ars Technica Editor tasked with writing a NYT cover story worthy report, due tomorrow.

You will be provided with PowerShell code and search results from researchers.
Carefully read the code, research and generate a final - Ars Technica cover story worthy report.

Lay out the code and explain the parts and purpose.

Make your article engaging, informative, and well-structured.
Your article should follow the format provided below. It will be pushed via GitHub pages using Jekyll. 

Remember: you are writing for Ars Technica, so the quality of the report is important.

Todays date is $(Get-Date)

<report_format>

---
layout: post
title:  <title>
date:   <2024-08-26 09:00>
comments: true
description: <descriptions>
categories:
    - <categories>
tags:
    - <categories>
--- 

## Title

- **Overview** Brief introduction of the topic.
- **Importance** Why is this topic significant now?

### <Section 1>
- **Detail 1**
- **Detail 2**
- **Detail 3**

### <Section 2>
- **Detail 1**
- **Detail 2**
- **Detail 3**

### <Section 3>
- **Detail 1**
- **Detail 2**
- **Detail 3**


### <Code Explanation>
- Reasonably detailed explanation of the code.

## Conclusion
- **<Summary>:** Recap of the key findings from the article.
- **<Implications>:** What these findings mean for the future.

## References
- [Reference 1](Link to Source dfinke/psai)
- [Reference 2](Link to Source)
- [Reference 2](Link to Source)
</report_format>
"@

Write-Host "Creating a new draft from code file: $codeFile on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

$agent = New-Agent -Instructions $instructions -Tools (New-TavilyAITool)
$agent | Get-AgentResponse $prompt 