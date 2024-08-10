---
layout: post
title: "PowerShell Interactive Cheat Sheet"
date: 2024-08-10 09:00
comments: true
description: "PowerShell-Interactive-Cheat-Sheet"
categories: 
    - PowerShell, AI, Agents
tags:
    - PowerShell, AI, Agents
---

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PowerShell Cheat Sheet</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #1e1e1e;
            color: #f1f1f1';
            margin: 0;
            padding: 20px;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .section {
            background-color: #252526;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        h2 {
            color: #9cdcfe;
            cursor: pointer;
        }

        pre {
            background-color: #1e1e1e;
            padding: 10px;
            border-radius: 5px;
            color: #dcdcaa;
            overflow-x: auto;
        }

        a {
            color: #569cd6;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <section class="section">
            <h2>Variables + Strings</h2>
            <pre><code># Hello World
"Hello World"

# Hello World with a variable
$msg = "Hello World"
$msg

# Concatenation (combining strings)
$firstName = "Jane"
$lastName = "Doe"
$fullName = "$firstName $lastName"
$fullName</code></pre>
            <a href="https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/variables" target="_blank">Learn more about variables in PowerShell</a><br>
            <a href="https://www.w3schools.io/powershell-string/" target="_blank">Learn more about strings in PowerShell</a>
        </section>

        <section class="section">
            <h2>Dictionaries</h2>
            <pre><code># A simple dictionary
$person = @{age = 25; gender = "female"}

# Accessing a value
$person.age  # Will output 25

# Adding keys + values
$person.height = 170
$ages = @{ "John" = 25; "Mary" = 30; "Paul" = 35 }

# Loop through key-value pairs
foreach ($kvp in $ages.GetEnumerator()) {
    "$($kvp.Key) is $($kvp.Value)"
}</code></pre>
            <a href="https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/hash-tables" target="_blank">Learn more about dictionaries in PowerShell</a>
        </section>

        <section class="section">
            <h2>Lists</h2>
            <pre><code># Make a list
$colors = @("red", "green", "blue")

# Get the first item in the list
$firstColor = $colors[0]

# Get the total items in the list
$listCount = $colors.Count

# Loop through the list
foreach ($color in $colors) {
    $color
}

# Adding items to the list
$colors += "yellow"</code></pre>
            <a href="https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/arrays" target="_blank">Learn more about lists in PowerShell</a>
        </section>

        <section class="section">
            <h2>User Input</h2>
            <pre><code># Prompting for a value
$name = Read-Host "What is your name"

# Prompting for numerical input
[int]$age = Read-Host "How old are you"

# Prompting for a specific value
[decimal]$pi = Read-Host "What is the value of pi"
Write-Output $pi</code></pre>
            <a href="https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/user-input" target="_blank">Learn more about user input in PowerShell</a>
        </section>

        <section class="section">
            <h2>If Statements</h2>
            <pre><code># Conditional tests
$age = 18

if ($age -eq 18) {
    Write-Output "You are old enough to vote"
}

# Else statement
if ($age -lt 18) {
    Write-Output "You are too young to vote"
} else {
    Write-Output "You are old enough to vote"
}

# Elseif statement
if ($age -lt 13) {
    Write-Output "You are a child"
} elseif ($age -lt 20) {
    Write-Output "You are a teenager"
} else {
    Write-Output "You are an adult"
}</code></pre>
            <a href="https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/conditional-logic" target="_blank">Learn more about if statements in PowerShell</a>
        </section>

        <section class="section">
            <h2>Tuples</h2>
            <pre><code># Making a Tuple
$direction = [System.Tuple]::Create("Up", "Down")</code></pre>
            <a href="https://devblogs.microsoft.com/scripting/using-and-understanding-tuples-in-powershell/" target="_blank">Learn more about tuples in PowerShell</a>
        </section>
    </div>

    <script>
        // Expandable sections example
        document.querySelectorAll('.section h2').forEach(header => {
            header.addEventListener('click', () => {
                const content = header.nextElementSibling;
                content.style.display = content.style.display === 'none' ? 'block' : 'none';
            });
        });
    </script>
</body>
</html>
