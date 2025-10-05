---
layout: post
title: "Build AI Agents That Actually Do Things: PowerShell Function Calling in Action"
date: 2025-10-05 09:00:00
categories: powershell ai agents function-calling
tags: [PowerShell, AI Agents, Function Calling, Agent Framework, Automation, APIs]
description: "Stop building chatbots that just talk. Learn how to create AI agents that can execute real PowerShell functions, interact with APIs, and automate your workflows with just 7 lines of code."
---

## What if Your AI Agent Could Actually Execute Commands?

Imagine asking an AI "What's the weather in London, Paris, and Tokyo?" and watching it automatically call real functions, fetch live data, and give you formatted results. No hardcoded responses, no manual scripting – just intelligent function execution.

**That's exactly what we're building today.** Using just 7 lines of PowerShell and the PSAI framework, you'll create an AI agent that can execute your existing functions, cmdlets, and APIs on demand.

> **Why This Matters:** Most AI demos show chatbots that can only talk. This tutorial shows you how to build agents that can *do* – turning conversation into action.

[Jump to the action →](#building-the-weather-agent-from-function-to-ai-in-minutes) or [set up your environment first →](#getting-started-5-minute-setup)


## Building the Weather Agent: From Function to AI in Minutes

**Here's the magic:** Take any PowerShell function you've already written, pass it to an AI agent, and suddenly your function becomes conversationally accessible. No API wrappers, no complex integrations – just pure PowerShell power.

Let's start with a simple weather function that calls a free weather API:

### 🚀 **The PSAI Advantage**
> **Use What You Already Have:** PSAI works with your existing PowerShell functions, built-in cmdlets, and third-party modules. No rewrites, no wrappers – just instant AI integration.
> 
> **Zero Learning Curve:** If you know PowerShell, you know how to build AI agents. The framework does the heavy lifting.

### The PowerShell Function: Just 7 Lines

**This is all it takes.** A basic PowerShell function that calls a weather API – nothing fancy, nothing complicated:

```powershell
function global:Get-Weather {
    param(
        [string]$location
    )

    Invoke-RestMethod -Uri "http://wttr.in/$($location)?format=%l:+%c+%t+%h+%w+%p"
}
```

### Test Drive: See It Work

Before we make it AI-powered, let's see our simple function in action. Copy the function above into your PowerShell session and try it out:

*Getting weather for multiple cities at once:*

![image](/images/posts/AgentFrameworkDemo/GetWeather.png)

### The Magic Moment: Function → AI Agent

**Here's where it gets interesting.** With your `Get-Weather` function loaded in your PowerShell session, you're one line away from an AI agent that can intelligently call it.

*From simple function to conversational AI:*

![image](/images/posts/AgentFrameworkDemo/WeatherAgent.png)

### The One-Liner That Changes Everything

**This single line transforms your function into a conversational AI:**

```powershell
New-Agent -Tools Get-Weather | Start-Conversation
```

The `-Tools` parameter specifies the functions or cmdlets that the agent can use during the conversation. It can take multiple tools as a comma-separated list. This gives your agent access to a variety of skill/capabilities. `Start-Conversation` begins the interaction with the agent.

This spins up a loop that listens for your input, passing it to the agent as a prompt, it includes the tool `Get-Weather` (converted to the function call schema for AI models). 

AI determines from the prompt if an external function call is needed. The AI model ***does not*** call functions directly; instead, it generates a function call request that the agent framework interprets and executes. It does a `remote procedure call`, if you will, to the function. It informs the agent framework the name of the function to call, `Get-Weather`, and the parameters they need to be set and to what value `location='nyc'`. 

The agent framework then executes the function and returns the result to the AI model, which determines if it has enough information to respond or if it needs to make additional function calls. In this case it has enough information and replies with the weather and conditins for New York City (note: the AI model turned `'nyc'` into `'New York City'`).

Let's dive deeper with a more complex example that shows the agent's true intelligence.

## Watch the AI Think: Behind-the-Scenes Function Calling

**Want to see the magic happen?** Add the `-ShowToolCalls` switch to watch your agent make decisions in real-time. You'll see exactly when and how it chooses to call your functions.

**The Beautiful Part:** The agent doesn't use hardcoded if/then logic. It genuinely *understands* when your functions are needed and figures out the right parameters to use.

<!-- TODO: rename image and update path -->
![image](/images/posts/AgentFrameworkDemo/Agent-ShowToolCalls-Many-Locations.png)

<!-- 
New-Agent -Tools Get-Weather -ShowToolCalls | Start-Conversation
😎 : current temp in nyc  london  paris  brazil
VERBOSE: Get-Weather {"location":"New York City"}
VERBOSE: Get-Weather {"location":"London"}
VERBOSE: Get-Weather {"location":"Paris"}
VERBOSE: Get-Weather {"location":"Brazil"}
╭ Agent Response ───────────────────────────────────────────────╮
│ Here are the current temperatures in the requested locations: │
│                                                               │
│ - **New York City**: ☀️ +68°F, 73% humidity, wind 2 mph       │
│ - **London**: 🌧️ +61°F, 48% humidity, wind 15 mph             │
│ - **Paris**: 🌦️ +63°F, 48% humidity, wind 11 mph              │
│ - **Brazil**: ☀️ +93°F, 22% humidity, wind 7 mph              │
│                                                              │
│ Let me know if you need more information!                     │
╰───────────────────────────────────────────────────────────────╯
╭ Next Steps ──────────────────────────────────────╮
│ Follow up, Enter to copy & quit, Ctrl+C to quit. │
╰──────────────────────────────────────────────────╯
 -->

### Let's Break It Down

The `-ShowToolCalls` parameter enables verbose output that reveals the agent's "thought process." Watch as it:

1. **Analyzes** your question
2. **Decides** which functions to call
3. **Determines** the right parameters
4. **Executes** multiple functions in parallel when needed

 As the functions calls are executed, the results are returned to the AI model, which then decides if it has enough information to respond or if it needs to make additional function calls. When complete, the agent provides a final response.

 ### The "Agent Response" box

 After all the function calls have been made, and the agent determines it has enough information, the agent compiles the details and presents a coherent response to the user.

 Let's do a follow-up question to see how the agent handles it.

### The Follow-Up: AI Memory in Action

**Here's where it gets really impressive.** Since we're working with an AI agent, let's test its reasoning abilities.

<!-- TODO: rename image and update path -->
![image](/images/posts/AgentFrameworkDemo/Sweater-Umbrella.png)

I asked: *"Do I need a sweater or umbrella for any of them?"*

**Notice what happened:**

✅ **Memory:** The agent remembers all previous weather data  
✅ **Context Awareness:** It knows it doesn't need new function calls  
✅ **Reasoning:** It analyzes the existing data to provide practical advice  

*This is conversational AI that actually understands context.*

## Your Turn: What Will You Build?

**The weather agent is just the beginning.** With this foundation, you can create agents for any domain. Here are some ideas to get you started:

### 💡 **Quick Wins You Can Try Right Now:**

**File System Agent** – Give your AI eyes and hands for your files:

```powershell
New-Agent -Tools Get-Content, Get-ChildItem -ShowToolCalls | Start-Conversation
```

Try asking: 
- *"What files do you see?"* → Agent calls `Get-ChildItem`
- *"Read config.json"* → Agent calls `Get-Content`
- *"Show me all .log files"* → Agent intelligently filters results

**🔥 Pro Tip:** Add `Set-Content` to create a file-writing agent, but implement guardrails first!

### **Coming Next:** 
In my next post, I'll show you how to build agents with write permissions while keeping you in control – including approval workflows and safety guardrails.

### **More Agent Ideas:**
- **System Monitor:** `Get-Process`, `Get-Service`, `Get-EventLog`
- **Git Helper:** `git status`, `git log`, custom Git functions
- **Database Query Agent:** Your existing database functions
- **API Integration Agent:** Any REST API wrapper functions


## The Future is Conversational Automation

**You just learned something powerful:** How to bridge the gap between AI conversation and real-world action. With PSAI, your existing PowerShell expertise becomes the foundation for intelligent automation.

**What We Covered:**
✅ Turning any PowerShell function into an AI-accessible tool  
✅ Building agents that maintain context and memory  
✅ Watching AI make intelligent decisions about when to call functions  
✅ Creating practical automation that goes beyond simple chatbots  

**The Big Picture:** This isn't just about weather APIs. It's about creating AI agents that can interact with your entire PowerShell ecosystem – your functions, your modules, your workflows.

*Your automation just got conversational.*

<!-- 
 ╭ Next Steps ──────────────────────────────────────╮
│ Follow up, Enter to copy & quit, Ctrl+C to quit. │
╰──────────────────────────────────────────────────╯
😎 : do i need a sweater or umbrella for any of them
╭ Agent Response ──────────────────────────────────────────────────────────────╮
│ Based on the current weather conditions:                                     │
│                                                                              │
│ - **New York City**: ☀️ +68°F – **No need for a sweater or umbrella**.      │
│ - **London**: 🌧️ +61°F – **You might need an umbrella** (it's raining).     │
│ - **Paris**: 🌦️ +63°F – **You might need an umbrella** (there's a chance of │
│  rain).                                                                     │
│ - **Brazil**: ☀️ +93°F – **No need for a sweater or umbrella**.             │
│                                                                              │
│ If you have specific plans or a location in mind, let me know!               │
╰──────────────────────────────────────────────────────────────────────────────╯
-->

## Getting Started: 5-Minute Setup

**Ready to build your first AI agent?** Here's everything you need:

### Step 1: Install PSAI (30 seconds)

```powershell
Install-Module -Name PSAI 
```

⭐ **Love this project?** Star the repo: [github.com/dfinke/PSAI](https://github.com/dfinke/PSAI)

### Step 2: Get Your OpenAI API Key (5 minutes)


**Quick Setup:**

1. **Create Account:** [platform.openai.com](https://platform.openai.com) → Verify email & phone
2. **Add Billing:** Minimum $5 (pay-as-you-go, no overages)
3. **Generate API Key:** [platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys)

💰 **Cost Reality Check:** Basic testing costs pennies. The weather examples above cost less than $0.01 to run.


### Step 3: Configure & Test (2 minutes)

**Set your API key** (add to your PowerShell `$PROFILE`):
```powershell
$env:OPENAI_API_KEY = 'sk-proj-your_api_key_here'
```

**Verify everything works:**
```powershell
New-Agent | Get-AgentResponse 'what is the capital of France?'
```

**Expected output:**
```
The capital of France is Paris.
```

🎉 **Success!** You're ready to build AI agents that can execute real PowerShell functions.

---

**Next:** Copy the weather function from above and start building your first function-calling agent!