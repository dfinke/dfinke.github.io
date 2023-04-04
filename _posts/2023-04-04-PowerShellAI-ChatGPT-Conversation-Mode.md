---
layout: post
title:  PowerShellAI ChatGPT Conversation Mode
date:   2023-04-04 15:00
comments: true
description: "PowerShellAI-ChatGPT-Conversation-Mode"
categories:
    - PowerShellAI, PowerShell, ChatGPT
tags:
    - PowerShellAI, PowerShell, ChatGPT
---

<!-- 
https://learn.microsoft.com/en-us/azure/cognitive-services/openai/how-to/chatgpt

https://learn.microsoft.com/en-us/azure/cognitive-services/openai/chatgpt-quickstart?tabs=command-line&pivots=programming-language-studio

https://github.com/Azure/openai-samples

https://learn.microsoft.com/en-us/training/paths/get-started-with-artificial-intelligence-on-azure/
-->

# Learn how to work with ChatGPT and GPT-4 using PowerShellAI 

The ChatGPT and GPT-4 models are language models that are optimized for conversational interfaces. The models behave differently than the older GPT-3 models. Previous models were text-in and text-out, meaning they accepted a prompt string and returned a completion to append to the prompt. However, the ChatGPT and GPT-4 models are conversation-in and message-out. 

To work with this you can use the function/alias `New-Chat` and `Chat`.

- Download it now: `Install-Module -Name PowerShellAI`
- More details and videos: [https://github.com/dfinke/PowerShellAI](https://github.com/dfinke/PowerShellAI)

## Video Tutorial

Discover the power of AI in your PowerShell environment with this newly integrated GPT-4 chat feature, as demonstrated in this step-by-step YouTube tutorial, revolutionizing automation and productivity.

<center><a href="https://youtu.be/ZX5gwzJe7eI"><img src="https://img.youtube.com/vi/ZX5gwzJe7eI/0.jpg" width="350"></a></center>

## Pre-requisites

1. Install PowerShell v5.1 or later
1. Install PowerShellAI - `Install-Module -Name PowerShellAI`
1. Create an account and get an OpenAI API key - [https://platform.openai.com](https://platform.openai.com/account/api-keys)
1. Set the environment variable `$env:OpenAIKey` with the value of your OpenAI API key

## PowerShell ChatGPT

There are two functions/aliases that you can use to interact with the ChatGPT model. `New-Chat` will stop the current conversation and start a new one. `Chat` will continue the conversation.

`Chat` will also start a new conversation if one is not already started. 

```powershell
New-Chat # initialize the chat session

chat "What is the capital of Spain" # send a message to the chat session
```

Response:
```
The capital of Spain is Madrid.
```

### Your First Conversation

This conversation was generated using the `New-Chat` and `Chat` functions. It "remembers" the conversation and continues to build on it. `New-Chat` closes the current conversation, if there is one, and starts a new one. Then, `chat` sends the message to the model and it responds.

`chat "and France"` sends the entire conversation to the model and it knows you what the capital of France is. 

`chat "USA?"` is all that is needed to get the capital of the USA. 

![image](/images/posts/ChatGPT/SampleConversation.png)


### Another Conversation

Now let's say you want all the responses from the model to come back in json format. 

```powershell
New-Chat 'respond only with json'

chat "What is the capital of Spain"
```

Response:
```json
{
  "capital": "Madrid"
}
```

### Check it out

Here you tell the model to only respond with json. Then you continue the conversation and it only responds with json.

![image](/images/posts/ChatGPT/RespondOnlyWithJson.png)

### Chat Sessions

Your conversation is stored in a session locally. You can see the session files using `Get-ChatSession` function. The are saved using a timestamp. You can also filter the sessions by the `Name` parameter. You can use a regex to filter the sessions. Typically I do something like `Get-ChatSession`, look at the files and then filter by the last three digits of the timestamp `Get-ChatSession 439`.

You can pipe this to `Get-ChatSessionContent` to get the content of the session. `Get-ChatSession 439 | Get-ChatSessionContent`. These files contain the messages you sent to the model and the responses from the model.

It is returned as PowerShell objects. You can then format and save them in any other format that works for you. 

<br/>

## Catch up with me on

|Where|Link|
|---|---|
|Twitter|[@dfinke](https://twitter.com/dfinke)|
|YouTube|[@dougfinke](https://www.youtube.com/@dougfinke)|
|GitHub|[dfinke](https://github.com/dfinke)
|LinkedIn|[Doug Finke](https://www.linkedin.com/in/douglasfinke/)|