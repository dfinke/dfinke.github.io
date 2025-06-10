---
layout: post
title: "Dashboard Bot: Turn ChatGPT Into a Dashboard Generator Inside VS Code"
date: 2025-06-10 09:00:00
categories: ai copilot vscode dashboards
tags: [AI, GitHub Copilot, VS Code, dashboards, chatMode, productivity]
description: "How to create a custom dashboard-generating AI assistant in VS Code using GitHub Copilot Chat's chatMode.md feature."
---


<p align="center">
    <img src="/images/posts/dashboardBot.png" alt="alt text" width="350"/>
</p>

## 🚀 Turn ChatGPT into a Dashboard Generator Right Inside Your Favorite IDE — VS Code — with `chatMode.md`

Ever wish ChatGPT *just knew* how to build dashboards without having to spell it out every time?

With **Custom Chat Modes** in **GitHub Copilot Chat for VS Code**, now it can.

You define the personality and behavior — and Copilot does the rest. No wrappers. No extensions. Just a markdown file and your favorite IDE: **VS Code**.

Let me show you how I built a mode called **📊 Dashboard Bot** — and how you can do the same in under 5 minutes.

---

### 🧠 What’s `chatMode.md`?

It’s a new feature in **Copilot Chat (VS Code Insiders)** that lets you define **your own assistant personas**.

Each `.chatMode.md` file becomes a selectable Copilot persona in the chat dropdown — complete with its own tone, purpose, and rules.

---

### 📊 Meet Dashboard Bot

Here’s the full `dashboard-bot.chatmode.md`:

```markdown
---
description: "📊 Dashboard Bot"
---

You are a helpful assistant that specializes in creating dashboards.

You turn raw data (usually CSV or JSON) into clean, interactive dashboards using:
- **Single-file HTML** with embedded JavaScript (e.g., Chart.js)
- Optionally styled with Tailwind CSS
- Or React + Recharts if requested

Always ask the user:
- What kind of chart(s) they want (bar, line, pie, etc.)?
- What columns to visualize?
- If they want the output as a single-file HTML page or as a React component?

Your default is:
- A self-contained, single `.html` file with everything embedded
- Includes example data or explains how to load an external `.csv` or `.json` file
- No external build tools required

Your goals:
- Make dashboards easy to preview
- Keep the code clean and copy-pasteable
- Include usage notes or preview instructions when needed

Never overcomplicate it. Avoid frameworks unless explicitly requested.
```

Save that as `dashboard-bot.chatmode.md`, open Copilot Chat, and select "📊 Dashboard Bot" from the dropdown. Instantly, you’ve got a dashboard-savvy AI assistant at your command.

---

### 🎯 Setting Up Dashboard Bot Mode

Once you've created your `dashboard-bot.chatmode.md` file, here's how to activate it:

1. Open the Copilot Chat panel in VS Code (if you haven't already)
1. Look for the dropdown menu at the bottom of the chat panel
1. Click on the dropdown — you should see "📊 Dashboard Bot" as one of the options
1. Select it, and voilà! You're now chatting with your specialized dashboard assistant

<p align="center">
    <img src="/images/posts/vscode-custom-mode-selection.png" alt="alt text" width="150"/>
</p>

> 💡 **Pro Tip:** You can quickly switch between different modes using the dropdown, making it easy to context-switch between different specialized assistants.

---

### 🛠️ Top 5 Prompt Templates to Get Started

#### 1. 🔨 Builder Template

> "Create a single-file HTML dashboard template that reads `data.csv` from the same folder, uses Chart.js, and shows a bar chart. I’ll reuse it."

#### 2. 📈 Monthly Revenue Chart

> "I have a CSV with `Date` and `Revenue`. Create a single HTML file with a bar chart showing monthly revenue."

#### 3. 🥧 Sales Breakdown

> "CSV with `Category` and `TotalSales`. Build a pie chart dashboard showing sales by category."

#### 4. 📉 Multi-Series Line Chart

> "Line chart with multiple lines — one per region — showing sales over time. Use Chart.js in a single HTML file."

#### 5. 📊 Table + Chart Combo

> "Dashboard with both a data table and a bar chart. Columns: `Product`, `Units Sold`, `Profit`. Single HTML file."

---

### 🧩 Why This Is a Game Changer

* No more repeating yourself
* Codify prompt behavior like code
* Paves the way for **tool-augmented agents** in the IDE

---

### 💬 What’s Next?

You could:

* Build a **Security Reviewer** that flags risky code
* Build a **Rubber Duck** mode that only asks clarifying questions
* Or plug into your own **MCP toolchain** and get real task automation

If you want a GitHub repo with reusable ChatModes, prompt packs, and template dashboards — ping me.

---

### 🗂️ Where to Put Your `chatMode.md` Files?

Your custom chat modes need to live in a specific location for VS Code to find them:

1. **Workspace Settings**:
   - Create a `.vscode/chat-modes` folder in your workspace
   - Place your `.chatMode.md` files there
   - Perfect for project-specific chat modes!

1. **User Settings Location**:
   - Windows: `%APPDATA%\Code\User\globalStorage\github.copilot-chat\chat-modes`
   - macOS: `~/Library/Application Support/Code/User/globalStorage/github.copilot-chat/chat-modes`
   - Linux: `~/.config/Code/User/globalStorage/github.copilot-chat/chat-modes`

Pro Tip: The workspace location is great for sharing chat modes with your team via source control.

### ⌨️ Quick Access via Command Palette

You can also manage your chat modes directly through VS Code's Command Palette:

1. Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (macOS)
2. Type "Chat:"
3. Look for these commands:
   - `Chat: New Mode File`
   - `Chat: Set Chat Mode`
   - `Chat: Configure Chat Modes`

This is the fastest way to create, edit, and switch between your custom chat modes!

---

## 🎯 Conclusion

The power of custom chat modes in GitHub Copilot Chat represents a significant leap forward in how we interact with AI assistants. Dashboard Bot is just one example of how we can specialize these tools for specific tasks, making our development workflow more efficient and focused.

By creating your own `.chatMode.md` files, you can build AI assistants that perfectly match your needs – whether that's for dashboard creation, API testing, documentation writing, or any other specialized development task.

The beauty of this approach lies in its simplicity: no complex setups, no external dependencies, just a markdown file that transforms Copilot into your perfect coding companion. As we continue to explore the possibilities of AI-assisted development, custom chat modes will undoubtedly become an essential tool in every developer's toolkit.

So, what specialized AI assistant will you create?

---

*Happy Dashboarding! 📊✨*

---

## 🤝 Stay Connected

- X - [@dfinke](https://twitter.com/dfinke)
- LinkedIn - [douglasfinke](https://www.linkedin.com/in/douglasfinke/)
- YouTube - [@DougFinke](https://www.youtube.com/@DougFinke)
- GitHub - [dfinke](https://github.com/dfinke)
- Blog - [dfinke.github.io](https://dfinke.github.io/)