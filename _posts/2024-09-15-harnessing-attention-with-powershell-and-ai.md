---
layout: post
title: "Harnessing Attention with PowerShell and AI: A Journey Through 'Get-WhatIWorkedOn'"
date: 2024-09-15 09:00:00 -0400
categories: [PowerShell, AI, Productivity]
---

![alt text](/images/posts/Get-WhatIWorkedOn.png)

*Attention is the new currency. How do we earn it, keep it, and use it wisely?*

Hello friends,

In a world buzzing with endless distractions, capturing and retaining attention is both an art and a science. Today, I invite you on a journey through my latest experiment—a PowerShell function called `Get-WhatIWorkedOn`. This tool has transformed how I reflect on my work, blending the precision of code with the insights of artificial intelligence.

But first, let's pause. Imagine sifting through countless files, scripts, and notes scattered across your digital landscape. Overwhelming, isn't it? That's where our story begins.

## The Challenge of Memory in a Digital World

We often think of memory as something static, but it's fluid, influenced by countless variables. As someone who juggles scripts, blog posts, and videos, I found myself asking, *"What did I actually work on this week?"* The more we create, the easier it becomes for important pieces to fade into the background noise.

I realized I needed a system—not just to record what I did, but to make it memorable and meaningful. So, I created `Get-WhatIWorkedOn`.

## Introducing `Get-WhatIWorkedOn`

This PowerShell function is more than code; it's a lens that brings my recent work into sharp focus. It scans specified directories, sifts through files based on their last modified dates, and presents a curated list of my activities.

### Here's the function:

```powershell
function Get-WhatIWorkedOn {
    param(
        [Parameter(ValueFromPipeline)]
        $Path,
        $DaysOld = 1,
        [Switch]$Directory,
        [Switch]$File,
        [Switch]$Save
    )

    Begin {
        $DaysOld = -1 * $DaysOld
        $targetDirectories = @()
    }

    Process {
        $targetDirectories += $Path
    }

    End {
        $result = foreach ($targetDirectory in $targetDirectories) {
            $targetDirectory = Resolve-Path $targetDirectory

            Get-ChildItem -Path $targetDirectory -Recurse -Directory:$Directory -File:$File | Where-Object { 
                $_.LastWriteTime -ge (Get-Date).AddDays($DaysOld).Date } | 
            Select-Object @{n = "DaysOld"; e = { [int](get-date).Subtract($_.LastWriteTime).TotalDays } }, fullname, LastWriteTime 
        }

        $result = $result | Sort-Object DaysOld
        if ($result.count -ge 1) {
            if ($Save) {
                $result | Export-Csv -Path $outputFile -NoTypeInformation
                Write-Host "Results saved to $outputFile"
            }
            else {
                $result 
            }
        }
    }  
}
```

### Breaking Down the Key Components

1. **Parameters for Flexibility**:
   - `$Path`: Accepts directories from the pipeline, allowing dynamic input.
   - `$DaysOld`: Defines how many days back to look. By default, it's set to 1 (yesterday).
   - Switches like `$Directory`, `$File`, and `$Save` provide additional control.

2. **Initialization in `Begin`**:
   - Prepares the `$DaysOld` variable by converting it to a negative number for date calculations.
   - Initializes an array to store target directories.

3. **Processing Input**:
   - Accumulates all provided paths into `$targetDirectories` during the `Process` block.

4. **The Core Logic in `End`**:
   - Iterates over each target directory.
   - Resolves the full path to handle any relative paths.
   - Uses `Get-ChildItem` to retrieve files or directories based on the switches.
   - Filters items by `LastWriteTime` to find recent modifications.
   - Selects and calculates:
     - **DaysOld**: How many days ago each item was modified.
     - **FullName** and **LastWriteTime**: For detailed reference.

5. **Output Handling**:
   - Sorts the results by `DaysOld`.
   - Checks if there are any results to display.
   - If `$Save` is specified, exports the results to a CSV file.
   - Otherwise, outputs the results to the console.

This function turns a chaotic pile of files into a narrative of your recent efforts. It's like having a personal historian for your digital creations.

## From Data to Insights: Integrating AI

Data without context can still leave us wandering. To truly understand patterns and gain actionable insights, I integrated AI into the process.

### The AI Connection

I used the `Invoke-OAIChat` command from the `PSAI` module to analyze the output of `Get-WhatIWorkedOn`. Here's how:

1. **Installation and Setup**:

   ```powershell
   Install-Module -Name PSAI

   # Set your OpenAI API key
   $env:OPENAI_API_KEY = "your-api-key-here"
   ```

2. **Gathering Data**:

   ```powershell
   $directories = @(
       "C:\Path\To\LiveStreams",
       "C:\Path\To\PSAI",
       "C:\Path\To\Camtasia"
       # Add other directories as needed
   )

   $files = $directories | Get-WhatIWorkedOn -DaysOld 7
   ```

3. **Crafting the Prompt**:

   I wanted the AI to view my work through a specific lens, so I provided detailed instructions:

   ```powershell
   $instruction = @"
   You are an Ars Technica journalist. Write a summary about the files worked on. The names of the files are good indications of what was worked on. Look at the files worked on in the similar time frame and see if you can distill a connection. If possible, make recommendations for future work.
   "@
   ```

4. **Executing the Analysis**:

   ```powershell
   $filesText = $files | Out-String

   Invoke-OAIChat -Instruction $instruction -UserInput $filesText -MaxTokens 1024 -Temperature 0.7 | Out-File -FilePath "C:\Path\To\Analysis.md"
   ```

### The Outcome

The AI provided a cohesive summary, highlighting themes I hadn't consciously connected. It pointed out my focus on user interfaces, AI integration, and multi-agent systems. It even offered recommendations, such as enhancing collaboration and expanding training resources.

*Isn't it fascinating how an external perspective—even an artificial one—can reveal patterns we overlook?*

## The Power of Reflection

By combining `Get-WhatIWorkedOn` with AI analysis, I've created a feedback loop that not only tracks my work but also enhances it. This process embodies the principles from Carmen Simon's "Impossible to Ignore": making content memorable by engaging multiple cognitive pathways.

### Why This Matters

- **Memory Reinforcement**: Regularly reviewing our work helps encode it into long-term memory.
- **Attention Direction**: AI insights direct our attention to areas that might need more focus.
- **Actionable Insights**: Recommendations provide clear next steps, turning reflection into action.

## Bringing It All Together

Here's how you can embark on this journey:

1. **Use the `Get-WhatIWorkedOn` Function**:

   - Copy the function into your PowerShell environment.
   - Adjust the `$directories` array to include paths relevant to you.

2. **Integrate with AI**:

   - Install the `PSAI` module.
   - Set up your OpenAI API key.
   - Customize the `$instruction` to guide the AI analysis.

3. **Reflect and Act**:

   - Review the AI-generated insights.
   - Identify patterns and areas for improvement.
   - Implement recommendations to enhance your work.

## Final Thoughts

In a world where attention is scarce, tools like `Get-WhatIWorkedOn` help us reclaim focus. By reflecting on our work, we make it *impossible to ignore*, not just for others, but for ourselves.

So, I encourage you to try this out. Experiment with the code, adjust the AI prompts, and see how this blend of technology can make your work more memorable and impactful.

**Stay curious, and let's make every moment count.**

---

*“The brain remembers what we make memorable.”* — Carmen Simon