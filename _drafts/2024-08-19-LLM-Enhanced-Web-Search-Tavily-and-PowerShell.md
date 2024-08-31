---
layout: post
title:  LLM Enhanced Web Search: Tavily and PowerShell
date:   2024-08-19 09:00
comments: true
description: "LLM-Enhanced-Web-Search-Tavily-and-PowerShell"
categories:
    - LLM, Agent, Tavily, PowerShell
tags:
    - LLM, Agent, Tavily, PowerShell
---

<!-- https://www.kaggle.com/code/marcinrutecki/llm-enhanced-web-search-the-tavily-lang-chain -->

# LLM Enhanced Web Search: Tavily and PowerShell

1. Introduction
    1. Install and load Libraries
    1. API Keys
1. Set-up
    1. Agent and Prompt Template
    1. Datetime
1. Execution
    1. Invoking Agent
    1. Printing Results
1. My other notebooks
1. References


Here’s a slightly reworded version:

---

**What is Tavily?**

Tavily is a specialized search API created specifically for AI agents, prioritizing the delivery of precise and dependable information for Retrieval-Augmented Generation (RAG). Its primary objective is to enhance the accuracy of AI-generated content by gathering data from reputable and trustworthy sources.

**How is Tavily different from other search APIs?**

Unlike conventional search APIs like Google,or Bing, which often return basic URLs and snippets that might not be relevant, Tavily takes it further. Traditional search APIs usually require developers to manually scrape, filter, and optimize content to make it usable for AI, which can be time-consuming and complex.

Tavily streamlines this process by aggregating results from  sites with a single API call. It uses AI to score, filter, and rank the most relevant content for query. Additionally, developers can customize fields such as context and token limits to fine-tune the search results for optimal use with large language models (LLMs). Tavily focuses on trusted sources and high-quality content, ensuring a more precise and relevant search experience for AI agents.

**Tavily API Pricing**

Tavily offers a free tier for up to 1,000 API calls per month.

## Introduction

Web search is an essential part of many workflows, but it often lacks the depth and context required for more advanced tasks. PSAIAgent, a PowerShell module, leverages the Tavily API to bring enhanced, context-aware search capabilities directly into your scripting environment. In this post, we'll walk through how to set up and use PSAIAgent to transform your web searches.

## Environment Setup

Just as you would in Python, setting up the environment in PowerShell is straightforward. First, install the PSAIAgent module:

```powershell
Install-Module -Name PSAIAgent -Scope CurrentUser
```

Next, configure your environment with the necessary API keys:

```powershell
$env:TAVILY_API_KEY = "your-api-key"
```

## What is Tavily

Tavily is a search API, specifically designed for AI agents and tailored for RAG purposes. Tavily’s primary objective is to provide factual and reliable information from trusted sources, enhancing the accuracy and reliability of AI-generated content.


## Building the Search Workflow

With the environment ready, let's dive into building a search workflow. The goal is to use PSAIAgent to perform a web search and then process the results.

```powershell
$searchQuery = "Latest advancements in AI"
$searchResults = Invoke-PSAIAgentSearch -Query $searchQuery
```

In Python, you might use LangChain for similar tasks. Here, PSAIAgent handles the heavy lifting, seamlessly integrating Tavily's powerful search capabilities.

## Analyzing the Results

Once you have the results, it's time to analyze them. Compare how using PSAIAgent improves the relevance and context of the results compared to a standard search command in PowerShell.

```powershell
$filteredResults = $searchResults | Where-Object { $_.Relevance -gt 0.8 }
$filteredResults | Format-Table -AutoSize
```

This approach brings the strengths of the LangChain and Python example into a PowerShell context, showcasing the versatility and power of PSAIAgent.

## Conclusion

PSAIAgent offers a robust solution for those looking to enhance their web search capabilities within PowerShell. By integrating the Tavily API, it provides context-rich, relevant search results that can significantly improve your workflow. Whether you're automating research tasks or simply looking for more precise search outcomes, PSAIAgent is a valuable addition to your PowerShell toolkit.
