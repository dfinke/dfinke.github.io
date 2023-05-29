---
layout: post
title:  "Excel Tables and PowerShell ImportExcel: A Powerful Combination for Data Analysis"
date:   2023-05-31 10:00
comments: true
description: "Excel-Tables-and-PowerShell-ImportExcel-A-Powerful-Combination-for-Data-Analysis"
categories:
    - PowerShell, ImportExcel, Excel Tables, Excel
tags:
    - PowerShell, ImportExcel, Excel Tables, Excel
---

# Excel Tables and PowerShell Import-Excel

The PowerShell ImportExcel module can create Excel Tables. You can apply table styles, add a totals row, and use structured references to include values from the table in formulae.

To create a table you'll need a list of data. The fields of the instances will become columns in the table.

Let's start with a small dataset containing the contributions to UK electricity generation by various classes of energy source.

```powershell
$data = ConvertFrom-Csv @"
Year, Coal, Oil, Natural Gas, Nuclear, Hydro, Wind/Solar, Other, Total
1996, 33.67, 3.87, 17.36, 22.18, 0.29, 0.04, 2.14, 79.55
1997, 28.30, 1.85, 21.57, 21.98, 0.38, 0.06, 2.29, 76.43
1998, 29.94, 1.70, 23.02, 23.44, 0.44, 0.08, 2.52, 81.14
1999, 25.51, 1.54, 27.13, 22.22, 0.46, 0.07, 2.79, 79.72
2000, 28.67, 1.55, 27.91, 19.64, 0.44, 0.08, 2.93, 81.21
2001, 31.61, 1.42, 26.87, 20.77, 0.35, 0.08, 2.91, 84.01
2002, 29.63, 1.29, 28.33, 20.10, 0.41, 0.11, 3.13, 83.00
2003, 32.54, 1.19, 27.85, 20.04, 0.28, 0.11, 3.93, 85.95
2004, 31.31, 1.10, 29.25, 18.16, 0.42, 0.17, 4.15, 84.57
2005, 32.58, 1.31, 28.52, 18.37, 0.42, 0.25, 5.23, 86.68
2006, 35.94, 1.43, 26.78, 17.13, 0.40, 0.36, 5.02, 87.06
2007, 32.92, 1.16, 30.60, 14.04, 0.44, 0.46, 4.68, 84.28
2008, 29.96, 1.58, 32.40, 11.91, 0.44, 0.61, 4.67, 81.58
2009, 24.66, 1.51, 30.90, 15.23, 0.45, 0.80, 4.87, 78.42
2010, 25.56, 1.18, 32.43, 13.93, 0.31, 0.89, 5.11, 79.41
2011, 26.03, 0.78, 26.58, 15.63, 0.49, 1.39, 5.62, 76.52
2012, 34.33, 0.73, 18.62, 15.21, 0.46, 1.82, 6.07, 77.24
2013, 31.33, 0.59, 17.70, 15.44, 0.40, 2.61, 6.45, 74.52
2014, 24.01, 0.55, 18.73, 13.85, 0.51, 3.10, 7.73, 68.48
2015, 18.34, 0.61, 18.28, 15.48, 0.54, 4.11, 9.36, 66.72
2016, 7.53, 0.58, 25.63, 15.41, 0.46, 4.09, 9.96, 63.67
2017, 5.55, 0.54, 24.60, 15.12, 0.51, 5.25, 10.13, 61.71
2018, 4.24, 0.49, 23.51, 14.06, 0.47, 5.98, 11.13, 59.88
2019, 1.85, 0.39, 23.45, 12.09, 0.51, 6.56, 11.35, 56.19
2020, 1.47, 0.36, 19.98, 10.72, 0.59, 7.61, 11.65, 52.38
2021, 1.67, 0.41, 21.83, 9.90, 0.47, 6.60, 12.12, 53.01
"@

$data | Export-Excel
```

## PowerShell Gets it Done

The resulting Excel file contains a worksheet with the data in a table, and more. The `Export-Excel` function does all the work for you. It has a lot of options, but the defaults are pretty good.

Here are what the defaults look like.

![Alt text](/images/posts/ExcelTables/FullDataSet.png)

The Export-Excel function does several things:

- Takes the object(s) passed to it, created by the `ConvertFrom-CSV` function, and creates a worksheet in a new workbook. Notice the property names are the column headers.
- Creates a table from the data.
- Formats the table with a style, here you see it is Zebra stripped.
- Notice the drop-down arrows in the column headers. These allow you to filter the data.
- Finally, the columns are sized to fit the data. The `Import-Excel` handles this for you.

## Getting Setup

To use the ImportExcel module you'll need to install it. The easiest way is to use the PowerShell Gallery.

```powershell
Install-Module ImportExcel
```

If you want more details on the module, check out the [ImportExcel GitHub repository](https://github.com/dfinke/ImportExcel).

## Upcoming

I'll post more to answer things like:

- How to create after the fact.
- How to customize a table.
- How to create a table on a different part of the worksheet.

