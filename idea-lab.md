---
layout: default
title: PowerShell Idea Lab
description: AI-generated PowerShell ideas turned into runnable labs.
permalink: /idea-lab/
---

<link rel="stylesheet" href="{{ "/assets/idea-lab.css" | relative_url }}?v={{ site.time | date: "%Y%m%d%H%M%S" }}">

<div class="idea-lab-page">
  <section class="idea-lab-masthead" aria-labelledby="idea-lab-title">
    <p class="idea-lab__kicker">PowerShell Idea Lab</p>
    <h1 id="idea-lab-title">Fresh ideas.<br><span>Runnable PowerShell.</span></h1>
    <p class="idea-lab-masthead__dek">An AI-driven stream of small, useful PowerShell experiments. Each lab starts with an idea, becomes a prompt, turns into a commented solution, and gets run in an isolated environment.</p>
    <div class="idea-lab-actions">
      <a class="idea-lab-button idea-lab-button--primary" href="#latest-labs">Explore the latest labs</a>
      <a class="idea-lab-button" href="https://github.com/dfinke/powershell-idea-lab" target="_blank" rel="noopener noreferrer">About the project ↗</a>
    </div>
    <div class="idea-lab-stats" aria-label="Idea Lab stats">
      <div><strong>7</strong><span>labs published</span></div>
      <div><strong>PowerShell 7</strong><span>the common runtime</span></div>
      <div><strong>AI → code → run</strong><span>the loop</span></div>
    </div>
  </section>

  <section class="idea-lab-intro" aria-labelledby="intro-title">
    <div>
      <p class="idea-lab__kicker">The through-line</p>
      <h2 id="intro-title">Interesting problems,<br>working examples.</h2>
    </div>
    <div class="idea-lab-intro__copy">
      <p>The lab scans current technical conversations for approachable ideas, reframes them into original scenarios, and asks AI to make the concept concrete. The result is a small artifact you can read, copy, run, and adapt.</p>
      <p>Everything here favors fictional or in-memory data and read-only behavior. The point is to make the idea visible without making your machine the experiment.</p>
    </div>
  </section>

  <section id="latest-labs" class="idea-lab-section" aria-labelledby="latest-title">
    <div class="idea-lab-section__heading">
      <div><p class="idea-lab__kicker">Latest</p><h2 id="latest-title">Labs to browse</h2></div>
      <p>Newest first · prompts, code, output</p>
    </div>
    <div class="lab-grid"><article class="lab-card">
  <div class="lab-card__top"><span class="lab-card__number">01</span><span class="lab-card__status">Validated</span></div>
  <p class="idea-lab__date">2026-09-15</p>
  <h3>Inventory Gap Report</h3>
  <p>Compare a fictional device inventory with a readiness baseline and report exactly what needs attention.</p>
  <div class="lab-tags"><span>Objects</span><span>Read-only</span><span>Reports</span></div>
  <a class="lab-card__link" href="#lab-2026-09-15-0306-inventory-gap-report">Open the lab <span aria-hidden="true">↗</span></a>
</article>
<article class="lab-card">
  <div class="lab-card__top"><span class="lab-card__number">02</span><span class="lab-card__status">Validated</span></div>
  <p class="idea-lab__date">2026-09-15</p>
  <h3>Parallel Health Check Results</h3>
  <p>Run independent checks concurrently, then sort the results so every report stays stable and readable.</p>
  <div class="lab-tags"><span>Parallel</span><span>Runspaces</span><span>Deterministic</span></div>
  <a class="lab-card__link" href="#lab-2026-09-15-0306-parallel-health-check-results">Open the lab <span aria-hidden="true">↗</span></a>
</article>
<article class="lab-card">
  <div class="lab-card__top"><span class="lab-card__number">03</span><span class="lab-card__status">Validated</span></div>
  <p class="idea-lab__date">2026-09-15</p>
  <h3>Portable UTF-8 Export</h3>
  <p>Create a BOM-free UTF-8 CSV in memory and prove that non-ASCII text survives the round trip.</p>
  <div class="lab-tags"><span>Encoding</span><span>CSV</span><span>PowerShell 7</span></div>
  <a class="lab-card__link" href="#lab-2026-09-15-0306-portable-utf8-export">Open the lab <span aria-hidden="true">↗</span></a>
</article>
<article class="lab-card">
  <div class="lab-card__top"><span class="lab-card__number">04</span><span class="lab-card__status">Validated</span></div>
  <p class="idea-lab__date">2026-09-15</p>
  <h3>Package Notes Into Message-Sized Blocks</h3>
  <p>Divide a long note into predictable character-limited blocks while preserving every character and its order.</p>
  <div class="lab-tags"><span>Strings</span><span>Pipeline</span><span>Formatting</span></div>
  <a class="lab-card__link" href="#lab-2026-09-15-0301-package-notes-into-message-sized-blocks">Open the lab <span aria-hidden="true">↗</span></a>
</article>
<article class="lab-card">
  <div class="lab-card__top"><span class="lab-card__number">05</span><span class="lab-card__status">Validated</span></div>
  <p class="idea-lab__date">2026-09-15</p>
  <h3>Validate Schedule Dates Without Stopping the Batch</h3>
  <p>Turn malformed dates into structured review results while the rest of the batch keeps moving.</p>
  <div class="lab-tags"><span>Validation</span><span>Errors as data</span><span>Batching</span></div>
  <a class="lab-card__link" href="#lab-2026-09-15-0301-validate-schedule-dates-without-stopping-the-batch">Open the lab <span aria-hidden="true">↗</span></a>
</article>
<article class="lab-card">
  <div class="lab-card__top"><span class="lab-card__number">06</span><span class="lab-card__status">Validated</span></div>
  <p class="idea-lab__date">2026-09-15</p>
  <h3>Deduplicate Labels Without Losing Order</h3>
  <p>Normalize messy labels while preserving the first spelling and the order in which values appeared.</p>
  <div class="lab-tags"><span>Collections</span><span>Normalization</span><span>Ordering</span></div>
  <a class="lab-card__link" href="#lab-2026-09-15-0250-deduplicate-labels-without-losing-order">Open the lab <span aria-hidden="true">↗</span></a>
</article>
<article class="lab-card">
  <div class="lab-card__top"><span class="lab-card__number">07</span><span class="lab-card__status">Validated</span></div>
  <p class="idea-lab__date">2026-09-15</p>
  <h3>Batch Status Change Preview</h3>
  <p>Preview a batch status change with ShouldProcess before anything is applied, even in an in-memory demo.</p>
  <div class="lab-tags"><span>WhatIf</span><span>ShouldProcess</span><span>Safety</span></div>
  <a class="lab-card__link" href="#lab-2026-09-15-batch-status-change-preview">Open the lab <span aria-hidden="true">↗</span></a>
</article></div>
  </section>

  <section class="idea-lab-section idea-lab-process" aria-labelledby="process-title">
    <div class="idea-lab-section__heading"><div><p class="idea-lab__kicker">How it works</p><h2 id="process-title">A small software factory.</h2></div></div>
    <div class="process-grid">
      <div><span>01</span><h3>Find</h3><p>Spot a simple PowerShell idea worth trying.</p></div>
      <div><span>02</span><h3>Frame</h3><p>Turn the concept into a new scenario and prompt.</p></div>
      <div><span>03</span><h3>Build</h3><p>Generate a fully commented PowerShell 7 solution.</p></div>
      <div><span>04</span><h3>Run</h3><p>Execute it safely and capture the evidence.</p></div>
    </div>
  </section>

  <section class="idea-lab-section idea-lab-archive" aria-labelledby="archive-title">
    <div class="idea-lab-section__heading"><div><p class="idea-lab__kicker">Archive</p><h2 id="archive-title">Keep exploring.</h2></div><p>Every lab stays small enough to understand.</p></div>
    <ol><li><time>2026-09-15</time><a href="#lab-2026-09-15-0301-package-notes-into-message-sized-blocks">Package Notes Into Message-Sized Blocks</a></li>
<li><time>2026-09-15</time><a href="#lab-2026-09-15-0301-validate-schedule-dates-without-stopping-the-batch">Validate Schedule Dates Without Stopping the Batch</a></li>
<li><time>2026-09-15</time><a href="#lab-2026-09-15-0250-deduplicate-labels-without-losing-order">Deduplicate Labels Without Losing Order</a></li>
<li><time>2026-09-15</time><a href="#lab-2026-09-15-batch-status-change-preview">Batch Status Change Preview</a></li></ol>
  </section>

  <section class="idea-lab-section lab-details" aria-labelledby="details-title">
    <div class="idea-lab-section__heading"><div><p class="idea-lab__kicker">Open labs</p><h2 id="details-title">Read the prompt. Copy the solution.</h2></div><p>Each example is self-contained.</p></div>
  <article id="lab-2026-09-15-0306-inventory-gap-report" class="lab-detail">
  <div class="lab-detail__header">
    <div>
      <p class="idea-lab__kicker">Lab · 2026-09-15</p>
      <h3>Inventory Gap Report</h3>
      <p>Compare a fictional device inventory with a readiness baseline and report exactly what needs attention.</p>
    </div>
    <span class="lab-detail__badge">Passed</span>
  </div>
  <div class="lab-detail__grid">
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>Prompt</h4><button class="copy-button" type="button" data-copy-target="prompt-2026-09-15-0306-inventory-gap-report">Copy</button></div>
      <pre id="prompt-2026-09-15-0306-inventory-gap-report"><code># Prompt

Create a PowerShell 7 script that accepts device inventory objects with a name, operating system, memory in GB, and free disk space in GB. Compare each record with a configurable readiness baseline, report whether it is ready, and list every gap in plain language. Use fictional in-memory records, keep the evaluation read-only, and avoid network calls or system changes.
</code></pre>
    </section>
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>PowerShell solution</h4><button class="copy-button" type="button" data-copy-target="solution-2026-09-15-0306-inventory-gap-report">Copy</button></div>
      <pre id="solution-2026-09-15-0306-inventory-gap-report"><code>[CmdletBinding()]
param(
    # Accept fictional inventory records from the pipeline or as an array.
    [Parameter(Mandatory, ValueFromPipeline)]
    [psobject[]]$Device,

    # Define the minimum baseline that a device should satisfy.
    [string]$RequiredOs = 'Windows 11',
    [ValidateRange(1, 1024)]
    [int]$MinimumMemoryGB = 16,
    [ValidateRange(1, 4096)]
    [int]$MinimumFreeDiskGB = 50
)

begin {
    # Hold input records until the pipeline completes so the function can emit one report.
    $devicesToReview = [System.Collections.Generic.List[psobject]]::new()
}

process {
    # Add each incoming device to the in-memory inventory.
    foreach ($item in $Device) {
        $devicesToReview.Add($item)
    }
}

end {
    # Evaluate each device against the same explicit baseline.
    foreach ($item in $devicesToReview) {
        # Start an empty list of human-readable gaps for this device.
        $gaps = [System.Collections.Generic.List[string]]::new()

        # Record an operating-system gap when the device is outside the baseline.
        if ($item.OperatingSystem -ne $RequiredOs) {
            $gaps.Add(&quot;OS is $($item.OperatingSystem); required $RequiredOs&quot;)
        }

        # Record a memory gap when the installed amount is too small.
        if ([int]$item.MemoryGB -lt $MinimumMemoryGB) {
            $gaps.Add(&quot;Memory is $($item.MemoryGB) GB; required $MinimumMemoryGB GB&quot;)
        }

        # Record a storage gap when the free space is below the baseline.
        if ([int]$item.FreeDiskGB -lt $MinimumFreeDiskGB) {
            $gaps.Add(&quot;Free disk is $($item.FreeDiskGB) GB; required $MinimumFreeDiskGB GB&quot;)
        }

        # Emit one concise report object for the device.
        [pscustomobject]@{
            Device = $item.Device
            Ready  = $gaps.Count -eq 0
            Gaps   = if ($gaps.Count -eq 0) { 'None' } else { $gaps -join '; ' }
        }
    }
}
</code></pre>
    </section>
  </div>
  <details class="lab-output">
    <summary>Show sample output and validation</summary>
    <div class="lab-output__grid">
      <section><h4>Run output</h4><pre><code>PowerShell: 7.6.6
Command: /opt/powershell/pwsh -NoLogo -NoProfile -NonInteractive -File run.ps1
Exit status: 0

STDOUT:
Northstar-01: Ready; gaps: None
Northstar-02: Review; gaps: OS is Windows 10; required Windows 11
Northstar-03: Review; gaps: Memory is 8 GB; required 16 GB; Free disk is 35 GB; required 50 GB

STDERR:
(empty)
</code></pre></section>
      <section><h4>Validation</h4><p>Validation Status: Passed - Runtime: PowerShell 7.6.6 on Linux - Command: ./run.ps1 - Safety review: fictional in-memory inventory only; no network, deletion, registry/system changes, credential access, or arbitrary code execution. - Checks: three devices were evaluated against the OS, memory, and free-disk baseline; the command exited with status 0 and reported actionable gaps.</p></section>
    </div>
  </details>
</article>
<article id="lab-2026-09-15-0306-parallel-health-check-results" class="lab-detail">
  <div class="lab-detail__header">
    <div>
      <p class="idea-lab__kicker">Lab · 2026-09-15</p>
      <h3>Parallel Health Check Results</h3>
      <p>Run independent checks concurrently, then sort the results so every report stays stable and readable.</p>
    </div>
    <span class="lab-detail__badge">Passed</span>
  </div>
  <div class="lab-detail__grid">
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>Prompt</h4><button class="copy-button" type="button" data-copy-target="prompt-2026-09-15-0306-parallel-health-check-results">Copy</button></div>
      <pre id="prompt-2026-09-15-0306-parallel-health-check-results"><code># Prompt

Create a PowerShell 7 script that accepts independent check records with a name, expected value, and observed value. Evaluate the checks concurrently with `ForEach-Object -Parallel`, using a bounded throttle limit. Make the worker logic self-contained, return `Pass` or `Review` for each check, and sort the final objects by check name so output is deterministic. Use only in-memory fictional data and do not contact real services.
</code></pre>
    </section>
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>PowerShell solution</h4><button class="copy-button" type="button" data-copy-target="solution-2026-09-15-0306-parallel-health-check-results">Copy</button></div>
      <pre id="solution-2026-09-15-0306-parallel-health-check-results"><code>[CmdletBinding()]
param(
    # Accept independent check definitions from the pipeline or as an array.
    [Parameter(Mandatory, ValueFromPipeline)]
    [psobject[]]$Check,

    # Limit concurrent workers so the pattern remains predictable on small machines.
    [ValidateRange(1, 32)]
    [int]$ThrottleLimit = 3
)

begin {
    # Collect all checks before starting workers so the input boundary is explicit.
    $checksToRun = [System.Collections.Generic.List[psobject]]::new()
}

process {
    # Add each check record to the in-memory work list.
    foreach ($item in $Check) {
        $checksToRun.Add($item)
    }
}

end {
    # Run each independent check in its own parallel runspace.
    $results = $checksToRun | ForEach-Object -Parallel {
        # Keep worker logic self-contained because a parallel runspace does not inherit local functions.
        $isMatch = $_.Observed -eq $_.Expected

        # Return a plain object that is easy to sort, display, or export.
        [pscustomobject]@{
            Check    = $_.Check
            Expected = $_.Expected
            Observed = $_.Observed
            State    = if ($isMatch) { 'Pass' } else { 'Review' }
        }
    } -ThrottleLimit $ThrottleLimit

    # Sort after the workers finish so output order is stable across runs.
    $results | Sort-Object Check
}
</code></pre>
    </section>
  </div>
  <details class="lab-output">
    <summary>Show sample output and validation</summary>
    <div class="lab-output__grid">
      <section><h4>Run output</h4><pre><code>PowerShell: 7.6.6
Command: /opt/powershell/pwsh -NoLogo -NoProfile -NonInteractive -File run.ps1
Exit status: 0

STDOUT:
Cache freshness: Review (expected Fresh, observed Stale)
Config schema: Pass (expected v3, observed v3)
Feature flags: Pass (expected Loaded, observed Loaded)
Worker capacity: Pass (expected Available, observed Available)

STDERR:
(empty)
</code></pre></section>
      <section><h4>Validation</h4><p>Validation Status: Passed - Runtime: PowerShell 7.6.6 on Linux - Command: ./run.ps1 - Safety review: fictional in-memory records only; no network, deletion, registry/system changes, credential access, or arbitrary code execution. - Checks: four records were processed with a throttle limit of 3, output was sorted by check name, and the command exited with status 0.</p></section>
    </div>
  </details>
</article>
<article id="lab-2026-09-15-0306-portable-utf8-export" class="lab-detail">
  <div class="lab-detail__header">
    <div>
      <p class="idea-lab__kicker">Lab · 2026-09-15</p>
      <h3>Portable UTF-8 Export</h3>
      <p>Create a BOM-free UTF-8 CSV in memory and prove that non-ASCII text survives the round trip.</p>
    </div>
    <span class="lab-detail__badge">Passed</span>
  </div>
  <div class="lab-detail__grid">
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>Prompt</h4><button class="copy-button" type="button" data-copy-target="prompt-2026-09-15-0306-portable-utf8-export">Copy</button></div>
      <pre id="prompt-2026-09-15-0306-portable-utf8-export"><code># Prompt

Create a PowerShell 7 script that accepts objects from the pipeline and produces a portable CSV document in memory. Use an explicit UTF-8 encoder without a byte-order mark, preserve non-ASCII characters, and return metadata showing the encoding, byte count, line count, and whether a BOM was present. Decode the generated bytes again and return the round-tripped CSV text so the runner can demonstrate the result. Use no network calls, credentials, system changes, or external input.
</code></pre>
    </section>
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>PowerShell solution</h4><button class="copy-button" type="button" data-copy-target="solution-2026-09-15-0306-portable-utf8-export">Copy</button></div>
      <pre id="solution-2026-09-15-0306-portable-utf8-export"><code>[CmdletBinding()]
param(
    # Accept the objects that should become rows in the export.
    [Parameter(Mandatory, ValueFromPipeline)]
    [psobject[]]$InputObject,

    # Allow callers to choose another delimiter while keeping comma as the default.
    [char]$Delimiter = ','
)

begin {
    # Collect pipeline input so one complete CSV document can be produced at the end.
    $rows = [System.Collections.Generic.List[psobject]]::new()
}

process {
    # Add each incoming object to the in-memory collection.
    foreach ($item in $InputObject) {
        $rows.Add($item)
    }
}

end {
    # Convert the objects to normal CSV lines without the PowerShell type header.
    $csvLines = @($rows | ConvertTo-Csv -NoTypeInformation -Delimiter $Delimiter)

    # Use an explicit UTF-8 encoder that does not add a byte-order mark.
    $utf8NoBom = [System.Text.UTF8Encoding]::new($false)

    # Join the lines with the platform newline and encode the complete document.
    $csvText = $csvLines -join [Environment]::NewLine
    $bytes = $utf8NoBom.GetBytes($csvText)

    # Decode the bytes again to prove that the generated payload is self-consistent.
    $roundTripText = $utf8NoBom.GetString($bytes)

    # Return useful metadata plus the text that a caller could save or transmit.
    [pscustomobject]@{
        Encoding   = 'UTF-8 without BOM'
        ByteCount  = $bytes.Length
        LineCount  = $csvLines.Count
        HasBom     = $bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF
        CsvText    = $roundTripText
    }
}
</code></pre>
    </section>
  </div>
  <details class="lab-output">
    <summary>Show sample output and validation</summary>
    <div class="lab-output__grid">
      <section><h4>Run output</h4><pre><code>PowerShell: 7.6.6
Command: /opt/powershell/pwsh -NoLogo -NoProfile -NonInteractive -File run.ps1
Exit status: 0

STDOUT:
Encoding: UTF-8 without BOM
Byte count: 109
Line count: 4
Has BOM: False
CSV payload:
&quot;Device&quot;,&quot;Owner&quot;,&quot;State&quot;
&quot;Atlas-01&quot;,&quot;Zoë&quot;,&quot;Ready&quot;
&quot;Borealis-02&quot;,&quot;Miyuki&quot;,&quot;Review&quot;
&quot;Cedar-03&quot;,&quot;José&quot;,&quot;Ready&quot;

STDERR:
(empty)
</code></pre></section>
      <section><h4>Validation</h4><p>Validation Status: Passed - Runtime: PowerShell 7.6.6 on Linux - Command: ./run.ps1 - Safety review: in-memory sample data only; no network, deletion, registry/system changes, credential access, or arbitrary code execution. - Checks: the script completed with exit status 0, emitted UTF-8 metadata, reported no BOM, preserved non-ASCII sample text, and produced a CSV payload.</p></section>
    </div>
  </details>
</article>
<article id="lab-2026-09-15-0301-package-notes-into-message-sized-blocks" class="lab-detail">
  <div class="lab-detail__header">
    <div>
      <p class="idea-lab__kicker">Lab · 2026-09-15</p>
      <h3>Package Notes Into Message-Sized Blocks</h3>
      <p>Divide a long note into predictable character-limited blocks while preserving every character and its order.</p>
    </div>
    <span class="lab-detail__badge">Passed</span>
  </div>
  <div class="lab-detail__grid">
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>Prompt</h4><button class="copy-button" type="button" data-copy-target="prompt-2026-09-15-0301-package-notes-into-message-sized-blocks">Copy</button></div>
      <pre id="prompt-2026-09-15-0301-package-notes-into-message-sized-blocks"><code>Create a fully commented PowerShell 7 script that splits a long text value into sequential, fixed-size character blocks.

Accept the text and a positive maximum character count as parameters. Preserve every character and the original order, return one structured object per block with its one-based number, character count, and text, and handle a final block that is shorter than the limit. Prefer a clear indexed loop using .NET string operations over an opaque regular-expression trick.

Include CmdletBinding, strict mode, parameter validation, and a useful error for an empty text value or non-positive block size. Keep the example safe for isolated execution: use only caller-supplied or fictional in-memory text; do not write files, call the network, access credentials, change the registry or system settings, execute arbitrary code, or use `Invoke-Expression`.

Provide a separate `run.ps1` that supplies a fictional multi-sentence note and a small limit so several blocks are produced. Display a compact report that makes the block order and character limits easy to verify. Include exact PowerShell 7 commands and state that the limit counts .NET string characters.
</code></pre>
    </section>
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>PowerShell solution</h4><button class="copy-button" type="button" data-copy-target="solution-2026-09-15-0301-package-notes-into-message-sized-blocks">Copy</button></div>
      <pre id="solution-2026-09-15-0301-package-notes-into-message-sized-blocks"><code>[CmdletBinding()]
param(
    # The complete text to divide into blocks.
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string] $Text,

    # The largest number of .NET string characters allowed in one block.
    [Parameter(Mandatory)]
    [ValidateRange(1, 1000000)]
    [int] $MaxCharacters
)

# Make uninitialized variables and common scripting mistakes fail early.
Set-StrictMode -Version Latest

function Split-TextIntoBlocks {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $InputText,

        [Parameter(Mandatory)]
        [ValidateRange(1, 1000000)]
        [int] $BlockSize
    )

    $blocks = [System.Collections.Generic.List[object]]::new()

    # Advance by one block at a time so no character is skipped or repeated.
    for ($start = 0; $start -lt $InputText.Length; $start += $BlockSize) {
        # The final block may be shorter than the requested maximum.
        $remaining = $InputText.Length - $start
        $length = [Math]::Min($BlockSize, $remaining)
        $blockText = $InputText.Substring($start, $length)

        # Store structured data instead of requiring callers to parse display text.
        [void] $blocks.Add([pscustomobject]@{
            BlockNumber   = $blocks.Count + 1
            CharacterCount = $length
            Text           = $blockText
        })
    }

    [object[]] $blocks
}

$blocks = Split-TextIntoBlocks -InputText $Text -BlockSize $MaxCharacters

Write-Output 'Blocks:'
foreach ($block in $blocks) {
    # Escape line breaks in the display only; the Text property itself remains unchanged.
    $displayText = $block.Text.Replace(&quot;`r&quot;, '&lt;CR&gt;').Replace(&quot;`n&quot;, '&lt;LF&gt;')
    # Angle brackets make leading or trailing spaces visible in captured output.
    Write-Output (&quot;{0}. ({1} chars) &lt;{2}&gt;&quot; -f $block.BlockNumber, $block.CharacterCount, $displayText)
}

Write-Output ''
Write-Output 'Summary:'
[pscustomobject]@{
    InputCharacters = $Text.Length
    MaxCharacters   = $MaxCharacters
    BlockCount      = $blocks.Count
    LargestBlock    = ($blocks | Measure-Object -Property CharacterCount -Maximum).Maximum
} | Format-List
</code></pre>
    </section>
  </div>
  <details class="lab-output">
    <summary>Show sample output and validation</summary>
    <div class="lab-output__grid">
      <section><h4>Run output</h4><pre><code>PowerShell version: 7.6.6
Command: pwsh -NoProfile -NonInteractive -File ./run.ps1

=== STDOUT ===
Blocks:
1. (48 chars) &lt;The morning handoff is ready. Review the queued &gt;
2. (48 chars) &lt;work, confirm the owner for each item, and recor&gt;
3. (48 chars) &lt;d the next action before the afternoon check-in.&gt;

Summary:

InputCharacters : 144
MaxCharacters   : 48
BlockCount      : 3
LargestBlock    : 48

=== STDERR ===
(empty)

=== EXIT STATUS ===
0
</code></pre></section>
      <section><h4>Validation</h4><p>Validation Status: Passed PowerShell 7.6.6 was available in the isolated cloud Linux runtime. The runner completed non-interactively with exit status 0 and no stderr output. The captured output shows a 144-character in-memory note split into three ordered blocks of 48 characters each. The implementation uses string indexing and Substring, preserves all input characters, and keeps the largest block at the requested limit. The example is safe for isolated execution because it uses only fictional in-memory text and does not write files, use the network, access credentials, change the registry, execute arbitrary code, or modify system settings. Command used:</p></section>
    </div>
  </details>
</article>
<article id="lab-2026-09-15-0301-validate-schedule-dates-without-stopping-the-batch" class="lab-detail">
  <div class="lab-detail__header">
    <div>
      <p class="idea-lab__kicker">Lab · 2026-09-15</p>
      <h3>Validate Schedule Dates Without Stopping the Batch</h3>
      <p>Turn malformed dates into structured review results while the rest of the batch keeps moving.</p>
    </div>
    <span class="lab-detail__badge">Passed</span>
  </div>
  <div class="lab-detail__grid">
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>Prompt</h4><button class="copy-button" type="button" data-copy-target="prompt-2026-09-15-0301-validate-schedule-dates-without-stopping-the-batch">Copy</button></div>
      <pre id="prompt-2026-09-15-0301-validate-schedule-dates-without-stopping-the-batch"><code>Create a fully commented PowerShell 7 script that validates a batch of schedule records without stopping when one record contains an invalid date.

Accept objects with a Name and DueDate property. Parse each date using a normal PowerShell cmdlet with `-ErrorAction Stop` inside a per-record `try`/`catch`, so conversion failures become structured results while the loop continues. Return one result per input record with the name, normalized ISO date when valid, a Valid or Invalid status, and an error message when invalid. Include a final count of valid and invalid records.

Include CmdletBinding, strict mode, parameter validation, readable objects instead of string parsing, and deterministic sample data. Keep the example safe for isolated execution: use only fictional in-memory records; do not write files, call the network, access credentials, change the registry or system settings, execute arbitrary code, or use `Invoke-Expression`.

Provide a separate `run.ps1` that supplies two valid dates and one malformed date, then invokes the implementation non-interactively. Display the per-record results and summary. Include exact PowerShell 7 commands and explain why `-ErrorAction Stop` is needed for `try`/`catch` to handle non-terminating conversion errors.
</code></pre>
    </section>
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>PowerShell solution</h4><button class="copy-button" type="button" data-copy-target="solution-2026-09-15-0301-validate-schedule-dates-without-stopping-the-batch">Copy</button></div>
      <pre id="solution-2026-09-15-0301-validate-schedule-dates-without-stopping-the-batch"><code>[CmdletBinding()]
param(
    # Accept the schedule records from the caller so the validator can be reused.
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [object[]] $Schedules
)

# Make uninitialized variables and common scripting mistakes fail early.
Set-StrictMode -Version Latest

function Test-ScheduleDates {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [object[]] $InputSchedule
    )

    $results = [System.Collections.Generic.List[object]]::new()

    foreach ($schedule in $InputSchedule) {
        $name = [string] $schedule.Name
        $rawDueDate = [string] $schedule.DueDate

        if ([string]::IsNullOrWhiteSpace($name)) {
            throw 'Every schedule record must have a non-empty Name.'
        }

        try {
            # ErrorAction Stop promotes a conversion error so the catch block can capture it.
            $parsedDate = Get-Date -Date $rawDueDate -ErrorAction Stop

            [void] $results.Add([pscustomobject]@{
                Name       = $name
                DueDate    = $parsedDate.ToString('yyyy-MM-dd')
                Status     = 'Valid'
                Error      = $null
            })
        }
        catch {
            # Keep the failure attached to this record and continue with the next one.
            [void] $results.Add([pscustomobject]@{
                Name       = $name
                DueDate    = $rawDueDate
                Status     = 'Invalid'
                Error      = $_.Exception.Message
            })
        }
    }

    [object[]] $results
}

$results = @(Test-ScheduleDates -InputSchedule $Schedules)

# Keep the main table compact and print error details separately so they are never truncated.
$table = $results |
    Select-Object -Property Name, DueDate, Status |
    Format-Table -AutoSize |
    Out-String -Width 200
Write-Output $table.TrimEnd()

$invalidResults = @($results | Where-Object Status -eq 'Invalid')
if ($invalidResults.Count -gt 0) {
    Write-Output ''
    Write-Output 'Errors:'
    foreach ($invalidResult in $invalidResults) {
        Write-Output (&quot;{0}: {1}&quot; -f $invalidResult.Name, $invalidResult.Error)
    }
}

Write-Output ''
Write-Output 'Summary:'
[pscustomobject]@{
    TotalRecords = $results.Count
    ValidRecords = @($results | Where-Object Status -eq 'Valid').Count
    InvalidRecords = @($results | Where-Object Status -eq 'Invalid').Count
} | Format-List
</code></pre>
    </section>
  </div>
  <details class="lab-output">
    <summary>Show sample output and validation</summary>
    <div class="lab-output__grid">
      <section><h4>Run output</h4><pre><code>PowerShell version: 7.6.6
Command: pwsh -NoProfile -NonInteractive -File ./run.ps1

=== STDOUT ===

Name             DueDate    Status
----             -------    ------
Morning handoff  2026-09-18 Valid
Afternoon review not-a-date Invalid
Weekend summary  2026-09-20 Valid

Errors:
Afternoon review: Cannot bind parameter 'Date'. Cannot convert value &quot;not-a-date&quot; to type &quot;System.DateTime&quot;. Error: &quot;The string 'not-a-date' was not recognized as a valid DateTime. There is an unknown word starting at index '0'.&quot;

Summary:

TotalRecords   : 3
ValidRecords   : 2
InvalidRecords : 1

=== STDERR ===
(empty)

=== EXIT STATUS ===
0
</code></pre></section>
      <section><h4>Validation</h4><p>Validation Status: Passed PowerShell 7.6.6 was available in the isolated cloud Linux runtime. The runner completed non-interactively with exit status 0 and no stderr output. The captured output shows three in-memory schedule records processed: two valid dates were normalized to ISO form, one malformed date was captured as Invalid, and the batch continued to the final record. The example is safe for isolated execution because it uses only fictional in-memory records and does not write files, use the network, access credentials, change the registry, execute arbitrary code, or modify system settings. Command used:</p></section>
    </div>
  </details>
</article>
<article id="lab-2026-09-15-0250-deduplicate-labels-without-losing-order" class="lab-detail">
  <div class="lab-detail__header">
    <div>
      <p class="idea-lab__kicker">Lab · 2026-09-15</p>
      <h3>Deduplicate Labels Without Losing Order</h3>
      <p>Normalize messy labels while preserving the first spelling and the order in which values appeared.</p>
    </div>
    <span class="lab-detail__badge">Passed</span>
  </div>
  <div class="lab-detail__grid">
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>Prompt</h4><button class="copy-button" type="button" data-copy-target="prompt-2026-09-15-0250-deduplicate-labels-without-losing-order">Copy</button></div>
      <pre id="prompt-2026-09-15-0250-deduplicate-labels-without-losing-order"><code>Create a fully commented PowerShell 7 script that turns a messy list of text labels into a case-insensitive, first-seen-order list of unique labels.

Trim surrounding whitespace before comparing values. Preserve the spelling of the first occurrence, preserve the order in which unique labels first appear, and report the input count, unique count, and duplicate count. Use a typed .NET `HashSet[string]` configured with an ordinal case-insensitive comparer for membership checks, plus an ordered collection for the output. Return readable PowerShell objects or clearly formatted output rather than parsing strings.

Include CmdletBinding, strict mode, parameter validation, and useful errors for null or blank labels. Keep the example safe for isolated execution: use only caller-supplied or fictional in-memory data; do not write files, call the network, access credentials, change the registry or system settings, execute arbitrary code, or use `Invoke-Expression`.

Provide a separate `run.ps1` that supplies sample labels with different capitalization and whitespace, then invokes the implementation. Include exact PowerShell 7 commands and state the assumptions behind the normalization and first-seen behavior.
</code></pre>
    </section>
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>PowerShell solution</h4><button class="copy-button" type="button" data-copy-target="solution-2026-09-15-0250-deduplicate-labels-without-losing-order">Copy</button></div>
      <pre id="solution-2026-09-15-0250-deduplicate-labels-without-losing-order"><code>[CmdletBinding()]
param(
    # Accept the labels from the caller so the function can be reused with any in-memory input.
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string[]] $Labels
)

# Make uninitialized variables and common scripting mistakes fail early.
Set-StrictMode -Version Latest

function Get-UniqueLabelReport {
    [CmdletBinding()]
    param(
        # Require at least one label and keep the input strongly typed.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $InputLabel
    )

    # HashSet provides fast membership checks. The comparer makes only the comparison
    # case-insensitive; the first spelling is still retained in the ordered collection.
    $seen = [System.Collections.Generic.HashSet[string]]::new(
        [System.StringComparer]::OrdinalIgnoreCase
    )

    # List preserves the order in which each unique label is first encountered.
    $orderedLabels = [System.Collections.Generic.List[string]]::new()

    # Track repeated values separately so the report can explain what was removed.
    $duplicateLabels = [System.Collections.Generic.List[string]]::new()

    foreach ($label in $InputLabel) {
        if ($null -eq $label) {
            throw 'Labels cannot contain null values.'
        }

        # Normalization happens before both the membership test and the retained value.
        $normalizedLabel = $label.Trim()
        if ([string]::IsNullOrWhiteSpace($normalizedLabel)) {
            throw 'Labels cannot be blank or whitespace-only.'
        }

        # Add returns true only when this normalized value was not already present.
        if ($seen.Add($normalizedLabel)) {
            [void] $orderedLabels.Add($normalizedLabel)
        }
        else {
            [void] $duplicateLabels.Add($normalizedLabel)
        }
    }

    # Return structured data so callers can consume the result without parsing display text.
    [pscustomobject]@{
        InputCount     = $InputLabel.Count
        UniqueCount    = $orderedLabels.Count
        DuplicateCount = $duplicateLabels.Count
        UniqueLabels   = [string[]] $orderedLabels
        Duplicates     = [string[]] $duplicateLabels
    }
}

# Build the report from the caller's labels.
$report = Get-UniqueLabelReport -InputLabel $Labels

# Display the ordered unique values first so the main result is easy to scan.
Write-Output 'Unique labels (first-seen order):'
for ($index = 0; $index -lt $report.UniqueLabels.Count; $index++) {
    Write-Output (&quot;{0}. {1}&quot; -f ($index + 1), $report.UniqueLabels[$index])
}

Write-Output ''
Write-Output 'Summary:'
[pscustomobject]@{
    InputCount     = $report.InputCount
    UniqueCount    = $report.UniqueCount
    DuplicateCount = $report.DuplicateCount
    Duplicates     = if ($report.Duplicates.Count -gt 0) {
        $report.Duplicates -join ', '
    }
    else {
        '(none)'
    }
} | Format-List
</code></pre>
    </section>
  </div>
  <details class="lab-output">
    <summary>Show sample output and validation</summary>
    <div class="lab-output__grid">
      <section><h4>Run output</h4><pre><code>PowerShell version: 7.6.6
Command: pwsh -NoProfile -NonInteractive -File ./run.ps1

=== STDOUT ===
Unique labels (first-seen order):
1. PowerShell
2. Automation
3. Cloud
4. DevOps

Summary:

InputCount     : 7
UniqueCount    : 4
DuplicateCount : 3
Duplicates     : powershell, Automation, cloud

=== STDERR ===
(empty)

=== EXIT STATUS ===
0
</code></pre></section>
      <section><h4>Validation</h4><p>Validation Status: Passed PowerShell 7.6.6 was available in the isolated cloud Linux runtime. The runner completed non-interactively with exit status 0 and no stderr output. The captured output shows seven input labels reduced to four unique labels. Capitalization and surrounding whitespace were ignored for comparison, while the first spelling and first-seen order were retained. Three duplicate values were reported. The example is safe for isolated execution because it uses only fictional in-memory strings and does not write files, use the network, access credentials, change the registry, execute arbitrary code, or modify system settings. Command used:</p></section>
    </div>
  </details>
</article>
<article id="lab-2026-09-15-batch-status-change-preview" class="lab-detail">
  <div class="lab-detail__header">
    <div>
      <p class="idea-lab__kicker">Lab · 2026-09-15</p>
      <h3>Batch Status Change Preview</h3>
      <p>Preview a batch status change with ShouldProcess before anything is applied, even in an in-memory demo.</p>
    </div>
    <span class="lab-detail__badge">Passed</span>
  </div>
  <div class="lab-detail__grid">
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>Prompt</h4><button class="copy-button" type="button" data-copy-target="prompt-2026-09-15-batch-status-change-preview">Copy</button></div>
      <pre id="prompt-2026-09-15-batch-status-change-preview"><code>Create a fully commented PowerShell 7 script that previews a batch status change before applying it.

Use a small set of fictional in-memory work items with a name, current status, and target status. Implement the operation with the ShouldProcess pattern so it supports PowerShell's -WhatIf and -Confirm common parameters. In preview mode, report each change that would happen. In apply mode, update only the in-memory objects and return a clear result for every item.

Include CmdletBinding, strict mode, parameter validation, readable objects instead of string parsing, and a concise summary of planned versus applied changes. Keep the example safe for isolated execution: do not write files, call the network, change the registry, access credentials, modify system settings, or use Invoke-Expression.

Provide a separate run.ps1 that supplies sample data and invokes the implementation in preview mode. Include exact commands for previewing and applying the in-memory example, state assumptions, and explain why WhatIf should be the default for potentially destructive automation.
</code></pre>
    </section>
    <section class="lab-panel">
      <div class="lab-panel__heading"><h4>PowerShell solution</h4><button class="copy-button" type="button" data-copy-target="solution-2026-09-15-batch-status-change-preview">Copy</button></div>
      <pre id="solution-2026-09-15-batch-status-change-preview"><code>[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    # Accept the work items from the caller so the example is easy to reuse.
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [object[]] $Items
)

# Make uninitialized variables and common scripting mistakes fail early.
Set-StrictMode -Version Latest

function Invoke-StatusPlan {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
    param(
        # Each item must expose Name, CurrentStatus, and TargetStatus properties.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [object[]] $InputObject
    )

    foreach ($item in $InputObject) {
        # Read the properties once so the proposed action is easy to inspect.
        $name = [string]$item.Name
        $currentStatus = [string]$item.CurrentStatus
        $targetStatus = [string]$item.TargetStatus

        if ([string]::IsNullOrWhiteSpace($name)) {
            throw 'Every item must have a non-empty Name.'
        }

        if ([string]::IsNullOrWhiteSpace($targetStatus)) {
            throw &quot;Item '$name' must have a non-empty TargetStatus.&quot;
        }

        if ($currentStatus -eq $targetStatus) {
            [pscustomobject]@{
                Name          = $name
                CurrentStatus = $currentStatus
                TargetStatus  = $targetStatus
                Action        = 'No change'
            }

            continue
        }

        # ShouldProcess honors -WhatIf and -Confirm for the caller.
        $description = &quot;Change status from '$currentStatus' to '$targetStatus'&quot;
        if ($PSCmdlet.ShouldProcess($name, $description)) {
            # This example changes only the in-memory object supplied by the caller.
            $item.CurrentStatus = $targetStatus

            [pscustomobject]@{
                Name          = $name
                CurrentStatus = $currentStatus
                TargetStatus  = $targetStatus
                Action        = 'Applied'
            }
        }
        else {
            # In WhatIf mode, describe the proposed change without applying it.
            [pscustomobject]@{
                Name          = $name
                CurrentStatus = $currentStatus
                TargetStatus  = $targetStatus
                Action        = 'Would change'
            }
        }
    }
}

# Invoke-StatusPlan inherits the script-level -WhatIf and -Confirm settings.
$results = Invoke-StatusPlan -InputObject $Items

$results | Format-Table -AutoSize

[pscustomobject]@{
    TotalItems  = @($results).Count
    Changes     = @($results | Where-Object Action -in @('Applied', 'Would change')).Count
    Applied     = @($results | Where-Object Action -eq 'Applied').Count
    PreviewOnly = @($results | Where-Object Action -eq 'Would change').Count
}
</code></pre>
    </section>
  </div>
  <details class="lab-output">
    <summary>Show sample output and validation</summary>
    <div class="lab-output__grid">
      <section><h4>Run output</h4><pre><code>PowerShell version: 7.6.6
Command: pwsh -NoProfile -NonInteractive -File ./run.ps1

=== STDOUT ===
What if: Performing the operation &quot;Change status from 'Queued' to 'Ready'&quot; on target &quot;Alpha&quot;.
What if: Performing the operation &quot;Change status from 'Queued' to 'Blocked'&quot; on target &quot;Charlie&quot;.

Name    CurrentStatus TargetStatus Action
----    ------------- ------------ ------   
Alpha   Queued        Ready        Would change
Bravo   Ready         Ready        No change
Charlie Queued        Blocked      Would change

TotalItems Changes Applied PreviewOnly
---------- ------- ------- -----------
         3       2       0           2

=== STDERR ===
(empty)

=== EXIT STATUS ===
0
</code></pre></section>
      <section><h4>Validation</h4><p>Validation Status: Passed PowerShell 7.6.6 was available in the isolated cloud Linux runtime. The runner completed non-interactively with exit status 0 and no stderr output. The captured output shows two proposed status changes, one item requiring no change, and zero applied changes. The -WhatIf path did not modify the fictional in-memory records. The example is safe for isolated execution because it uses only sample objects and does not write files, use the network, access credentials, change the registry, or modify system settings. Command used:</p></section>
    </div>
  </details>
</article>
  </section>

  <section class="idea-lab-connect" aria-labelledby="connect-title">
    <div><p class="idea-lab__kicker">Stay connected</p><h2 id="connect-title">Follow along as the lab grows.</h2><p>New experiments are added over time. Find Doug’s videos, projects, and builder community around the work.</p></div>
    <nav aria-label="Doug Finke links">
      <a href="https://www.youtube.com/@dougfinke/videos" target="_blank" rel="noopener noreferrer">YouTube <span>↗</span></a>
      <a href="https://x.com/dfinke" target="_blank" rel="noopener noreferrer">X <span>↗</span></a>
      <a href="https://github.com/dfinke" target="_blank" rel="noopener noreferrer">GitHub <span>↗</span></a>
      <a href="https://www.skool.com/agentic-ai-forge" target="_blank" rel="noopener noreferrer">Agentic AI Forge <span>↗</span></a>
      <a href="https://dougfinke.dev/" target="_blank" rel="noopener noreferrer">DougFinke.dev <span>↗</span></a>
    </nav>
  </section>
</div>

<script defer src="{{ "/assets/idea-lab.js" | relative_url }}?v={{ site.time | date: "%Y%m%d%H%M%S" }}"></script>
