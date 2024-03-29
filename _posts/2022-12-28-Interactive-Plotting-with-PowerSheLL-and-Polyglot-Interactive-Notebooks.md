---
layout: post
title:  Interactive Plotting with PowerShell and Polyglot Interactive Notebooks
date:   2022-12-28 09:00
comments: true
description: "Interactive-Plotting-with-PowerShell-and-Polyglot-Interactive-Notebooks"
categories:
    - PowerShell, Polyglot, Interactive Notebooks, ScottPlot
tags:
    - PowerShell, Polyglot, Interactive Notebooks, ScottPlot
---

# PowerShell ScottPlot

Uses Polyglot Interactive Notebooks to demonstrate the capabilities of ScottPlot via PowerShell.

*Repo*: [https://github.com/dfinke/PowerShellScottPlot](https://github.com/dfinke/PowerShellScottPlot)

## Check out the video

This walks through creating data visualizations with PowerShell and ScottPlot in the interactive notebook rendering  visualizations inline.

<a href="https://youtu.be/nL0JRukCU4k"><img src="https://img.youtube.com/vi/nL0JRukCU4k/0.jpg" width="200">

## ScottPlot

Is a free and [open-source plotting library](https://scottplot.net/) for .NET that makes it easy to interactively display large datasets.

![](/images/posts/ScottPlot/ScottPlot.png)


## How to run

- Follow these instructions to setup VS Code and the [Polyglot Interactive Notebooks extension](https://devblogs.microsoft.com/dotnet/polyglot-notebooks-december-2022-release/)
- Clone the repo locally `git clone https://github.com/dfinke/PowerShellScottPlot.git`
- Finally, open the `ScottPlot.ipynb` file in VS Code

## Summary
There are two helper PowerShell scripts.

- ScottPlotHelper.ps1
    - Loads the `ScottPlot.dll` and `psgraphNB.ps1`
    - Has the `Show-ScottPlotInNotebook` function
        - `Show-ScottPlotInNotebook $plt "$pwd\test.png"`
        - Takes a ScottPlot plot, and name of the image file to generate
        - Generates the image file
        - Calls the `Show-ImageInNotebook` function from `psgraphNB.ps1`
        - Then removes the image file

- PSGraphNB.ps1
    - Has the `Show-ImageInNotebook` function
        - `Show-ImageInNotebook "$pwd\test.png"`
        - Takes the name of the image file to display
        - Displays the image in the output cell of the notebook

## What's in the notebook

### A simple way to share Polyglot Notebooks
Check out the rendered notebook and charts here in [nbviewer](https://nbviewer.org/github/dfinke/PowerShellScottPlot/blob/master/ScottPlot.ipynb).

### Here's some of what you can do
![](/images/posts/ScottPlot/RadialChart.png)

![](/images/posts/ScottPlot/SignalChart.png)