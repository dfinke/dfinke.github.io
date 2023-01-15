---
layout: post
title:  Running PowerShell Inside ChatGPT
date:   2023-01-15 09:00
comments: true
description: "Running-PowerShell-Inside-ChatGPT"
categories:
    - PowerShell, ChatGPT
tags:
    - PowerShell, ChatGPT
---

<!-- https://mathspp.com/blog/running-python-inside-chatgpt -->
# Running PowerShell inside ChatGPT
## And the PowerShell Console

Executing PowerShell inside ChatGPT displays its remarkable ability to comprehend and evaluate PowerShell commands for you.

## Chat #1

```
Act as a PowerShell REPL. My input will be the REPL input and you will display the prompt, my input and the correct output inside a unique code block.

$a = 5
$b = 18
($a, $b, ($a+$b), ($a-$b))
```

![](/images/posts/ChatGPT/ChatGPTKnowPowerShell.png)

## Chat #2

```
Act as a PowerShell REPL. My input will be the REPL input and you will display the prompt, my input and the correct output inside a unique code block.

$d = Get-Date
$d.AddDays(5)
```

![](/images/posts/ChatGPT/ChatGPTKnowPowerShell-Date.png)

# Introducing the PowerShellAI Module

![](/images/posts/ChatGPT/AIReplace.png)

# Unleash the Power of Artificial Intelligence with PowerShell

The `PowerShellAI` module allows you to interact with OpenAI's GPT-3 model. It makes API calls to the GPT-3 engine and retrieves the generated text. The `Get-GPT3Completion` is a command in this module, which allows you to get the text completion for a given prompt.

# Get Ahead of the Game
By using this module, you'll have the ability to add cutting-edge AI functionality to your projects without needing to have a deep understanding of the underlying technology. This means you can stay focused on what you do best while still being able to work with the latest and greatest.

# Start Your AI Journey Today
## API Key
You need to provide an API key for the OpenAI API in order to use the module. You can get an API key for OpenAI by signing up for an OpenAI API account on the OpenAI website (https://beta.openai.com/signup/). Once you have created an account, you will be able to generate an API key that can be used to access the GPT-3 API. You will then be able to use this key to authenticate with the API and make requests to the GPT-3 engine.

Set your key to this environment variable:

```powershell
$env:OPENAI_API_KEY = "YOUR_API_KEY"
```

## Install the PowerShellAI Module

```powershell
Install-Module -Name PowerShellAI
```

You can also check out the module on GitHub `https://github.com/dfinke/PowerShellAI`

# Demos of Get-GPT3Completion

Here are demos of `Get-GPT3Completion` posting your request to the OpenAI GPT-3 API and returning the completion:

| Description | YouTube Video |
|--|--|
| Quick Demo of PowerShellAI | <a href="https://youtu.be/fpq9TDpaCuU"><img src="https://img.youtube.com/vi/fpq9TDpaCuU/0.jpg" width="200"> |
| Using PowerShell with OpenAI GPT in the console with a shortcut key | <a href="https://youtu.be/Y2fJki6r4mI"><img src="https://img.youtube.com/vi/Y2fJki6r4mI/0.jpg" width="200"> |

# What it looks like

## As JSON

```powershell
Get-GPT3Completion "list of planets only names as json"

[
    "Mercury",
    "Venus",
    "Earth",
    "Mars",
    "Jupiter",
    "Saturn",
    "Uranus",
    "Neptune"
]
```

## As XML

```powershell
Get-GPT3Completion "list of planets only names as xml"


<?xml version="1.0" encoding="UTF-8"?>
<planets>
  <planet>Mercury</planet>
  <planet>Venus</planet>
  <planet>Earth</planet>
  <planet>Mars</planet>
  <planet>Jupiter</planet>
  <planet>Saturn</planet>
  <planet>Uranus</planet>
  <planet>Neptune</planet>
</planets>
```

## As Markdown

```powershell

 Get-GPT3Completion "first 5 US presidents and terms as markdown table" > .\presidents.md
```

```powershell
Get-Content .\presidents.md
```

```markdown
| President | Term |
|----------|------|
| George Washington | 1789-1797 |
| John Adams | 1797-1801 |
| Thomas Jefferson | 1801-1809 |
| James Madison | 1809-1817 |
| James Monroe | 1817-1825 |
```

Open the file in VS Code and you get a nice table:

| President | Term |
|----------|------|
| George Washington | 1789-1797 |
| John Adams | 1797-1801 |
| Thomas Jefferson | 1801-1809 |
| James Madison | 1809-1817 |
| James Monroe | 1817-1825 |