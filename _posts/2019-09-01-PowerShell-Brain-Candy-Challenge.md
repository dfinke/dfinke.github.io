---
layout: post
title:  "PowerShell Brain Candy Challenge"
date:   2019-09-01 07:00
comments: true
description: "PowerShell-Brain-Candy-Challenge"
categories:
    - PowerShell
tags:
    - PowerShell, Brain, Candy, Puzzle
---

I posted this challenge on the PowerShell [Facebook](https://www.facebook.com/groups/powershell/permalink/2529810203743809/) page and [Twitter](https://twitter.com/dfinke/status/1167559940598370304). Below are the varied solutions presented.

If you don't want to be influenced by others answers, stop here and try to solve the puzzle.

Otherwise, read on.

> Thanks to all who took the time solve the challenge.

![](/images/posts/powerShellBrainCandy.png)

# Solutions

One cool result about posting PowerShell puzzles is you get to seed the different ways people solve it. Seeing how others go about gives you ideas and adds techniques to your toolbox.

Check it out.

## From Facebook

I posted the PowerShell Brain Candy challenge on the Facebook page, here's what came back.

### Brandon Lucas

```powershell
$j = 0

foreach($i in (1..9)) {
    $j = $j*10+$i
    write-host "$(" "*(9-$i))$j x " -backgroundcolor white -foregroundcolor black -nonewline
    write-host "8" -backgroundcolor white -foregroundcolor red -nonewline
    write-host " + $i = $($j*8+$i)$(" "*(9-$i))" -backgroundcolor white -foregroundcolor black
}
```

### Chris Chisholm

```powershell
$RunningValue = 0
$MinValue = 1
$MaxValue = 9
$MultipleBy = 8
ForEach ($Count in $MinValue..$MaxValue){
    $RunningValue = (($RunningValue * 10) + $Count)
    $OutputValue = "{1} x {2} + {0} = {3}" -f $Count, $RunningValue, $MultipleBy, $(($RunningValue * $MultipleBy) + $Count)
    $OutputValue.PadLeft((($MaxValue - $Count)) + $OutputValue.Length)
}
```

### Francis Mercier

```powershell
for ($i = 1; $i -lt 10; $i++) {
    $Currentnumstr = "$Currentnumstr$i"
    Write-Host "$($Currentnumstr.PadLeft(9,' ')) x " -NoNewline
    Write-Host "8" -NoNewline -ForegroundColor Red
    Write-Host " + $i = $([int]$Currentnumstr * 8 + $i)"
}
```

### Duncan Kirkland

Needs color.

```powershell
1..9 | %{
    $x=[int]((1..$_)-join'')
    "$(' '*(9-$_))$x x 8 + $_ = $($x*8+$_)"
}
```

### Subhash Konduru

Needs alignment and color.

```powershell
$i=""
1..9|%{
    [int]$i = ($i.tostring() + ($_).tostring())
    "$i*8+($_) ="+$i*8+($_)
}
```

### Aaron Melverton

Needs alignment and color.

```powershell
1..9 | %{
    $z=[int]("$z$_")
    "$z X 8 + $_ = $($z * 8 + $_)"
}
```

## From Twitter
I posted the PowerShell Brain Candy challenge on Twitter, here's what came back.

### James Tryand

```powershell
1..9 | %{
    $sb = [text.stringbuilder]::new()}{ [void]$sb.Append($_)
    $ws = [string]::Join('',[linq.enumerable]::Repeat(' ',9 - $_))
    "$($ws)$($sb.ToString()) x 8 + $_ = $([int]$sb.ToString() * 8 + $_)$($ws)" } | %{
        write-host $_.substring(0,12) -b white -f black -NoNewline
        write-host $_.substring(12,1) -b white -f red -NoNewline
        write-host $_.substring(13) -b white -f black
    }
```

### James O'Neill

Needs color

```powershell
$j=1
1..9 | %{
    "{0,9} x 8 + $_ = $($j*8+$_)" -f $j
    $j=$J*10+1+$_
}
```

### Rob Campbell

Needs alignment. First time through line 1 errors, after, it works

```powershell
rv i,n
While(++$i-le9){
    $n="$n$i"
    "$n x 8 + $i = $(8*$n+$i)"
}
```

### Mathias Jessen

Needs color.

```powershell
# 1..9|%{"{0,9} x 8 + $_ = $(8*($a=1..$_-join'')+$_)"-f$a}

1..9 | %{
    "{0,9} x 8 + $_ = $(8*($a=1..$_-join'')+$_)" -f $a
}
```

### Prasoon Karunan V


```powershell
# $a='';1..9|%{"{0,9} x 8 + $_ = $(8*($a+=$_)+$_)"-f$a}

$a=''
1..9 | %{
    "{0,9} x 8 + $_ = $(8*($a+=$_)+$_)" -f $a
}

```

### Maximilian Otter

```powershell
$base = 10
$num = ''
$esc = [char]27
$red = "$esc[31m"
$blue = "$esc[34m"
$reset = "$esc[39m"
for ($i = 1; $i -lt 10; $i++) {
    $num = $num + $i
    (' ' * ($base-$i-1)) + $num + ' x ' + $red + [string]($base*0.8) + $reset + ' + ' + $blue + $i + $reset + ' = ' + [string]([int32]$num * ($base * 0.8) + $i)
}
```

### Don Hunt

```powershell
$series1to9 = '123456789'
$series9to1 = '987654321'
$fmtstring = '{0,9} x 8 + {1} = {2}'

foreach ($n in 1..9) {
    $fmtstring -f
    $series1to9.Substring(0,$n),
    $n,
    $series9to1.Substring(0,$n)
}
```

### Tim Pringle

Needs alignment and color.

```powershell
$col1 = 1..9 -join ''
$col2 = 9..1 -join ''
$pos = 1

While ($pos -lt ($col1.Length + 1)) {
    Write-Output ('{0} x 8 + {2} = {1}' -f $col1.Substring(0, $pos), $col2.Substring(0, $pos), $col1.Substring($pos - 1, 1))
    $pos ++
}
```