---
layout: post
title:  How to Set up and Use ChatGPT in Windows Terminal using PowerShellAI
date:   2023-03-24 09:00
comments: true
description: "How-to-Set-up-and-Use-ChatGPT-in-Windows-Terminal-using-PowerShellAI"
categories:
    - PowerShellAI, PowerShell, ChatGPT, Windows Terminal
tags:
    - PowerShellAI, PowerShell, ChatGPT, Windows Terminal
---

# How to Set up and Use ChatGPT in Windows Terminal using PowerShellAI

## Introduction

ChatGPT is a powerful language model developed by OpenAI. It has been widely used in various applications, including chatbots, text completion, and language understanding. It powers GitHub Copilot, a code completion tool that helps developers write code faster. It also powers the Microsoft 365.

In this blog post, I will guide you on how to set up and use ChatGPT in the Windows Terminal using PowerShellAI module. Now it powers your PowerShell work, making it a powerful tool for developers and IT professionals alike.

## Prerequisites

Before you begin, ensure that you have the following installed on your Windows system:

1. Windows Terminal: Download and install the Windows Terminal from the Microsoft Store or the GitHub Releases page.
1. PowerShell: Ensure you have PowerShell 5.1 or higher installed. You can check the version by executing `$PSVersionTable.PSVersion` in the Windows Terminal.
1. `PowerShellAI` Module: `Install-Module -Name PowerShellAI`
1. To use ChatGPT, you'll need an API key from OpenAI. Visit the OpenAI website, sign up for an account, and [obtain your API key](https://platform.openai.com/account/api-keys).

## Step 1: Import the PowerShellAI Module

Once the `PowerShellAI` module is installed, import it into your PowerShell session by executing:

```powershell
Import-Module PowerShellAI
```

## Step 2: Set the OpenAI API Key

To use the ChatGPT model, you'll need an API key from OpenAI. Visit the OpenAI website, sign up for an account, and [obtain your API key](https://platform.openai.com/account/api-keys).

Once you have your API key, set it as an environment variable by executing:

```powershell
$env:OpenAIKey = 'sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```

## Step 3: Interact with ChatGPT

To interact with ChatGPT, you can use the `Get-GPT3Completion` cmdlet or `gpt` alias followed by the text prompt. Here's is an example:

```powershell
gpt "What is 1+5?"
```

```
1+5 = 6
```

Let's try another example:

```powershell
gpt "can you tell me a joke?"
```

Here is the output, you'll probably get a different one:

```
Q: What did the fish say when it hit the wall?
A: Dam!
```

## Generating PowerShell Code

For example, if you want to solve the classic Fizz Buzz problem using PowerShell, use this prompt:

```powershell
gpt "Write a PowerShell script that can handle FizzBuzz"
```

```ps
# FizzBuzz Script

# Set the range of numbers to loop through
$start = 1
$end = 100

# Loop through the range of numbers
for ($i = $start; $i -le $end; $i++)
{
    # Check if the number is divisible by 3 and 5
    if ($i % 3 -eq 0 -and $i % 5 -eq 0)
    {
        # Print FizzBuzz
        Write-Host "FizzBuzz"
    }
    # Check if the number is divisible by 3
    elseif ($i % 3 -eq 0)
    {
        # Print Fizz
        Write-Host "Fizz"
    }
    # Check if the number is divisible by 5
    elseif ($i % 5 -eq 0)
    {
        # Print Buzz
        Write-Host "Buzz"
    }
    # Otherwise, print the number
    else
    {
        Write-Host $i
    }
}
```

## Generate Shell Commands

You can also use ChatGPT to generate shell commands. For example, if you want to generate a PowerShell script that can download a file from the internet, use this prompt:

```powershell
gpt 'generate a PowerShell script that can download a file from the internet one liner'
```

```ps
Invoke-WebRequest -Uri <URL> -OutFile <FileName>
```

## PowerShell Copilot

There is another function `copilot` that can be used to interact with ChatGPT. It is similar to the `gpt` function, but the prompt is tuned to `PowerShell` and the output is formatted to be more readable. Plus, you are given three options to choose from, `Y` to run the code, `E` to explain the code, and `N` to do nothing.

```powershell
copilot "using PowerShell regex, just code. split user from domain of email address with match:  demo.user@google.com" 
```

![image](/images/posts/ChatGPT/Copilot-GPT-At-The-CLI.png)

## Conclusion

You have successfully set up and used ChatGPT in the Windows Terminal using PowerShell and the PowerShellAI module. You can now interact with ChatGPT and use its powerful language capabilities for various tasks without needing Python. The PowerShellAI module provides a convenient way to integrate AI services like ChatGPT into your PowerShell workflows, making it a valuable tool for developers and IT professionals alike.

## Next Steps

The `PowerShellAI` module provides a convenient way to integrate AI services like ChatGPT into your PowerShell workflows, making it a valuable tool for developers and IT professionals alike.

It continues to evolve and grow. If you have any suggestions or feedback, please let me know in the comments below or on Twitter.

## Resources

Visit the [PowerShellAI GitHub repository](https://github.com/dfinke/PowerShellAI) for source code, documentation, examples and videos that will help you understand how the module works and how to use it effectively.

## Stay up to date on the latest for PowerShellAI

Make sure you to follow me on Twitter, star the GitHub repository, and subscribe to my YouTube channel (hit the notification bell).

This will keep in sync with the cool releases that are in the pipeline.

Catch up with me on:

- Twitter - [@dfinke](https://twitter.com/dfinke)
- YouTube - [@dougfinke](https://www.youtube.com/@dougfinke)
- LinkedIn - [Doug Finke](https://www.linkedin.com/in/douglasfinke/)