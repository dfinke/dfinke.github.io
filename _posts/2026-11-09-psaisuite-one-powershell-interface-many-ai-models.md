---
layout: post
title: "PSAISuite: One PowerShell Interface for Many AI Models"
date: 2026-11-09 09:00:00 -0500
categories: powershell ai automation
tags: [PowerShell, AI, PSAISuite, LLM, Agents]
description: "Use PowerShell to work with multiple AI providers, bring pipeline data into prompts, and give models practical tools."
image: /images/posts/psaisuite-many-models.png
---

![An illuminated terminal connected to several abstract AI models.]({{ '/images/posts/psaisuite-many-models.png' | relative_url }})

I spend a lot of time exploring what happens when AI meets the tools I already use. PowerShell is a natural place to start: it can inspect a system, work with files, transform data, and connect to other services.

The models keep changing. The work I want to do with them often doesn't.

I built [PSAISuite](https://github.com/dfinke/psaisuite) to give those experiments a consistent PowerShell interface across multiple AI providers. It lets me work with models, bring real PowerShell data into a prompt, and explore tool calling without starting from scratch for each provider.

## Start with a prompt

Install the module from the PowerShell Gallery:

```powershell
Install-Module PSAISuite -Scope CurrentUser
Import-Module PSAISuite
```

You'll need credentials for the provider you choose. The [setup instructions](https://github.com/dfinke/psaisuite#setup) explain the environment variables for each provider.

Then use `Invoke-ChatCompletion` to send a prompt:

```powershell
Invoke-ChatCompletion -Messages "Explain what PowerShell objects are." -Model "openai:gpt-4o-mini"
```

The model identifier chooses the provider and model. Availability and credentials depend on the provider and your account.

## Bring your data into the conversation

PowerShell gets more interesting when it works with the information in front of you. PSAISuite lets you pipe content into a prompt as context:

```powershell
Get-Content .\README.md | Invoke-ChatCompletion -Messages "Summarize this document." -Model "openai:gpt-4o-mini"
```

You can use the same idea with command output, files, or data you prepare in PowerShell. Consider what information you're sending to a provider before including sensitive data.

## Give the model a tool

Some questions need more than text already in the prompt. PSAISuite supports tool calling with PowerShell commands:

```powershell
Invoke-ChatCompletion -Messages "List the files in the current directory." -Tools Get-ChildItem -Model "openai:gpt-4.1"
```

Here the model can request a call to `Get-ChildItem` and use the result in its response. Tool support varies by provider and model; choose tools with the access appropriate for your task.

## Compare and build

The repository also includes provider guides, examples, and a benchmark suite for comparing models. These are building blocks for trying an idea, learning from the result, and making the next experiment more useful.

PSAISuite is the first entry in my new [project index]({{ '/projects/' | relative_url }}), where I'll collect more of the tools and ideas I've been building with AI.

- [Explore PSAISuite on GitHub](https://github.com/dfinke/psaisuite)
- [Install from the PowerShell Gallery](https://www.powershellgallery.com/packages/PSAISuite)
- [Build a custom agent harness with PSAISuite]({{ '/powershell/ai/agents/automation/2026/09/12/build-a-custom-agent-harness-with-powershell-and-psaisuite.html' | relative_url }})
