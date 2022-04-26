---
layout: post
title:  From clipboard to PowerShell with Read-Clipboard
date:   2021-07-25 09:00
comments: true
description: "From-clipboard-to-PowerShell-with-Read-Clipboard"
categories:
    - PowerShell,Clipboard
tags:
    - PowerShell,NYC Meetup, Speakers, Events
---

# From clipboard to PowerShell with Read-Clipboard
## Read data directly from the clipboard without saving it first

## Using the Read-Clipboard function

The `Read-Clipboard` function is part of my PowerShell Excel module. You can [get it here](https://www.powershellgallery.com/packages/ImportExcel/7.2.1) or at a PowerShell prompt use this command to install it `Install-Module -Name ImportExcel`.

## Read-Clipboard the Video

Check out the short video I did on it.

<a href="https://youtu.be/dv2GOH5sbpA"><img src="https://img.youtube.com/vi/dv2GOH5sbpA/0.jpg" width="400"></a>

## Read-Clipboard the Write Up

The `Read-Clipboard` functions creates an array of object from data copied to the clipboard. It reads text from the clipboard and detects if it is a CSV (including tab delimited), or JSON format.

If you have worked with PowerShells `Import-Csv`, 'ConvertFrom-Csv', or `ConvertFrom-Json` functions, you will be familiar with the `Read-Clipboard` function. The `Read-Clipboard` function is essentially the same. The difference is that the source of data comes from the clipboard.

### Syntax
```powershell
Read-Clipboard [[-Delimiter] <Object>] [[-Header] <Object>]
```

## Usage

1. Copying data from Excel files

![](/images/posts/readClipboard/CopyExcelData.gif)

Now the data has been copied onto the clipboard. Next, we will navigate to a .NET Interactive Notebook (or any IDE) and type in the following code snippet:

```powershell
$data = Read-Clipboard 
$data | format-table
```

![](/images/posts/readClipboard/UseInteractiveNotebook.png)

The copied data gets passed into the variable `$data` and is now available in your environment. 

Here's what it looks like end to end.

![](/images/posts/readClipboard/End2EndCopyExcelData.gif)

2. Copying data from CSV files

If you have a CSV file, or there is CSV in say a markdown file, the steps are the same. `Read-Cilpboard` auto-detects the format of the data on the clipboard. Let's use this CSV data:

```
OrderId,Category,Sales,Quantity,Discount
1,Cosmetics,744.01,07,0.7
2,Grocery,349.13,25,0.3
3,Apparels,535.11,88,0.2
4,Electronics,524.69,60,0.1
5,Electronics,439.10,41,0.0
6,Apparels,56.84,54,0.8
7,Electronics,326.66,97,0.7
8,Cosmetics,17.25,74,0.6
9,Grocery,199.96,39,0.4
10,Grocery,731.77,20,0.3
```

Copy the above data and run the same code as before, see below.

```powershell
$data = Read-Clipboard 
$data | format-table
```

You get the same array as in Step 1. `Read-Cilpboard` auto-detected the format, and set it all up.

![](/images/posts/readClipboard/UseInteractiveNotebook.png)

3. Copying data from Webpages

You can also copy the data from any source, including a web page, as long as it is structured in the form of a table. Here's an example of copying data from a [StackOverflow](https://stackoverflow.com/questions/62318682/get-pandas-datframe-values-by-key) example and importing it to PowerShell.

Here, you'll copy JSON to the clipboard.

![](/images/posts/readClipboard/CopyWebPageJson.gif)


## Saving and Converting data

You can use the clipboard data to save it for later and use it in any format you need to. You can also export it to Excel, SQL, etc.

### Export to Excel

```powershell
$data = Read-Clipboard 
 
$data | Export-Excel 
```

### Convert it to CSV format

```powershell
Read-Clipboard | ConvertTo-Csv

# Save the CSV data to a file
Read-Clipboard | Export-Csv '.\MyData.csv'
```

### Convert it to JSON format

```powershell
Read-Clipboard | ConvertTo-JSON
```

## Conclusion

Now that you’ve learned about the `Read-Clipboard` function, you’ll definitely want to try it out. If you like creating data-related tutorials like I do, this will come in handy.