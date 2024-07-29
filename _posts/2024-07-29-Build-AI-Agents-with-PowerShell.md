---
layout: post
title: "Build AI Agents with PowerShell"
date: 2024-07-29 09:00
comments: true
description: "Build-AI-Agents-with-PowerShell"
categories: 
    - PowerShell, AI, Agents
tags:
    - PowerShell, AI, Agents
---

<p align="center">
    <img src="/images/posts/AI-Agent-and-PowerShell-Interface.png" alt="AI Agent and PowerShell Interface" width="400px">
</p>

Turn any OpenAI LLM into an AI agent that can interact with you or work autonomously.

Building AI workflows using function calling, and more, using PowerShell, is the next step.

## PSAI and PSAIAgent

PSAI is a PowerShell module that provides access to OpenAI large Language Models (LLMs). It is a direct port of the OpenAI Python SDK.

`Install-Module -Name PSAI`

Check out the [PSAI GitHub](https://github.com/dfinke/PSAI) and please give it a star 🌟

Coming soon, PSAIAgent, a PowerShell module that provides access to OpenAI large Language Models (LLMs) and the ability to create agents that can work autonomously or interact with you.

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Code Panel</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/themes/prism-tomorrow.min.css" rel="stylesheet" /> 
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            height: 100vh;
            background-color: #f8f8f8;
        }
        .container {
            display: flex;
            width: 100%;
            height: 100%;
        }
        .left-panel {
            width: 300px;
            /* Fixed width for left panel */
            padding: 20px;
            background-color: #ffffff;
            /* White background */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-template-rows: auto repeat(3, 1fr);
            gap: 10px;
            overflow: hidden;
            /* Prevent content from causing overflow */
        }
        .header-text {
            grid-column: span 2;
            margin-bottom: 20px;
            text-align: center;
        }
        .header-text h2 {
            margin: 0;
            font-size: 20px;
            color: #22224f;
        }
        .header-text p {
            margin: 5px 0 0;
            font-size: 14px;
            color: #555555;
        }
        .left-panel button {
            padding: 10px;
            border: 1px solid #d3d3d3;
            /* Light gray border */
            background-color: #ffffff;
            /* White background */
            color: #000000;
            /* Black text */
            font-size: 14px;
            cursor: pointer;
            border-radius: 8px;
            text-align: center;
            font-weight: normal;
            transition: background-color 0.3s ease, color 0.3s ease;
            /* Smooth transition for color changes */
        }
        .left-panel button:hover {
            background-color: #f0f0f0;
            /* Slightly darker background on hover */
        }
        .left-panel button.active {
            background-color: #000000;
            /* Black background when active */
            color: #ffffff;
            /* White text when active */
            font-weight: bold;
            /* Bold text when active */
        }
        .right-panel {
            flex-grow: 1;
            /* Use remaining space */
            padding: 40px;
            background-color: #1e1e1e;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: monospace;
            overflow-y: auto;
        }
        .code-container {
            width: 100%;
            max-width: 800px;
            background-color: #1e1e1e;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }
        .code-header {
            background-color: #2d2d2d;
            padding: 8px 12px;
            border-radius: 8px 8px 0 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .code-header .buttons {
            display: flex;
            align-items: center;
        }
        .code-header .button {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 8px;
        }
        .code-header .button.red {
            background-color: #ff5f56;
        }
        .code-header .button.yellow {
            background-color: #ffbd2e;
        }
        .code-header .button.green {
            background-color: #27c93f;
        }
        pre {
            margin: 0;
            padding: 20px;
            background-color: #1e1e1e;
            border-radius: 0 0 8px 8px;
            white-space: pre-wrap;
            word-wrap: break-word;
            color: #d4d4d4;
            /* Adjusted text color for better visibility */
        }
        code {
            font-family: 'Fira Code', monospace;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-panel">
            <div class="header-text">
                <h2>LLMs are locked to their last training date</h2>
                <p>Unlock them with real-time data!</p>
            </div>
            <button onclick="showCode('code1', this)">Search the web</button>
            <button onclick="showCode('code2', this)">Make an API call</button>
            <button onclick="showCode('code3', this)">Interactive Conversation</button>
            <button onclick="showCode('code4', this)">Show Tool Calls</button>
            <button onclick="showCode('code5', this)">Query databases</button>
            <button onclick="showCode('code6', this)">And more...</button>
        </div>
        <div class="right-panel">
            <div class="code-container">
                <div class="code-header">
                    <div class="buttons">
                        <div class="button red"></div>
                        <div class="button yellow"></div>
                        <div class="button green"></div>
                    </div>
                </div>
                <pre><code id="codeDisplay" class="language-powershell">Click a button to see the code snippet.</code></pre>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/prism.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/components/prism-powershell.min.js"></script>
    <script>
        function showCode(codeId, element) {
            const codeSnippets = {
                code1: `# Search the web
. ".\WebSearch.ps1"
$agent = New - Agent - Tools(Register - Tool Invoke - WebSearch) - Instructions "Today is $(Get-Date)"
$agent | Get - AgentResponse 'What were the latest employment numbers in the US?'`,
                code2: `# Make an API call
function Get-OrderDetail {
    "status: on the way"    
}

$agent = New-Agent -Tools (Register-Tool Get-OrderDetail) 
$agent | Get-AgentResponse "Where's my order?"`,
                code3: `# Interactive Conversation
$agent = New-Agent 
$agent | Invoke-InteractiveCLI "What's the capital of France?"`,
                code4: `# Show Tool Calls
Install-Module PSDuckDB, WebSearch

$tools = $(
 Register-Tool Invoke-WebSearch
 Register-Tool Invoke-DuckDB
)

$agent = New-Agent -ShowToolCalls -Tools $tools

$agent | Get-AgentResponse "Find the latest news on AI, save it to latest."
`,
                code5: `# Query databases using PowerShell
Install-Module PSDuckDB

function Invoke-DuckDB {
    param(
        [string]$sql
    )

    $db = New-DuckDBConnection
    $result = $db.sql($sql)
    $null -eq $result ? $sql : $result
}

$agent = New-Agent -Tools (Register-Tool Invoke-DuckDB)
$agent | Get-AgentResponse "What's the customer revenue this quarter?
`,
                code6: `# More features coming soon...
Write-Host "Stay tuned for updates and enhancements!"
`
            };

            // Remove 'active' class from all buttons
            var buttons = document.querySelectorAll('.left-panel button');
            buttons.forEach(function(btn) {
                btn.classList.remove('active');
            });

            // Add 'active' class to the clicked button
            element.classList.add('active');

            // Update the code display
            const codeDisplay = document.getElementById('codeDisplay');
            codeDisplay.textContent = codeSnippets[codeId];
            Prism.highlightElement(codeDisplay);
        }
    </script>
</body>
</html>    
