---
layout: post
title: "PowerShell Quiz: Understanding Closures in Loops"
date: 2025-04-23 06:30:00
comments: true
description: "PowerShell-Quiz-Understanding-Closures-in-Loops"
categories: 
    - PowerShell, Closures, Scripting, Quiz
tags: 
    - PowerShell, Closures, Scripting, Quiz

---
![alt text](/images/posts/2025-04-22-powershell-closures-gotcha.png)


Have you ever hit a surprising result in PowerShell where functions inside a loop don't behave like you expect? Let's dig into this classic gotcha.

Here’s the snippet:

```powershell
$funcs = @()

foreach ($i in 1..3) {
    $funcs += { $i }
}

Write-Host (($funcs | ForEach-Object { &$_ }) -join ', ')
```

The quiz gives four possible outcomes:

```
A. 0, 1, 2  
B. 1, 2, 3  
C. 3, 3, 3  
D. Error  
```

---

## 🔍 Step-by-Step Breakdown

### Step 1: Initializing the array

```powershell
$funcs = @()
```

We're setting up an empty array to hold script blocks (PowerShell's anonymous functions).

---

### Step 2: The loop

```powershell
foreach ($i in 1..3) {
    $funcs += { $i }
}
```

This adds **three** script blocks to the array. Each of them references the variable `$i`.

But here's the catch: **PowerShell closures capture the variable, not its current value**. By the time the loop finishes, `$i` equals `3`. So **all three script blocks return `3`** when invoked.

---

### Step 3: Executing the script blocks

```powershell
$funcs | ForEach-Object { &$_ }
```

We run each script block. Since they all reference the same `$i`, they all return `3`.

---

### Step 4: Joining the output

```powershell
-join ', '
```

Result:

```text
3, 3, 3
```

---

## ✅ Correct Answer: **C. 3, 3, 3**

---

## 🛠 The Fix: Capture the value, not the reference

PowerShell gives you a built-in way to capture the *current* value of a variable into a closure:

```powershell
foreach ($i in 1..3) {
    $funcs += { $i }.GetNewClosure()
}
```

Now each script block holds onto its own snapshot of `$i`.

So this:

```powershell
Write-Host (($funcs | ForEach-Object { &$_ }) -join ', ')
```

will output:

```text
1, 2, 3
```

---

## 🧠 Takeaway

Closures are powerful, but they can surprise you. Remember:

> **In PowerShell, `{ $i }` captures the variable — not the value. Use `.GetNewClosure()` to freeze the value at that moment.**

Got more PowerShell puzzles? Drop them in the comments or [join the NYC PowerShell Meetup](https://www.meetup.com/NycPowershellMeetup/)!
