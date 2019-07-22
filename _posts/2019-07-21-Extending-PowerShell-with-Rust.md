---
layout: post
title:  "Extending PowerShell with Rust"
date:   2019-07-21 10:00
comments: true
description: "Extending-PowerShell-with-Rust"
categories:
    - PowerShell
tags:
    - PowerShell, Rust, C#, P/Invoke
---

To improve the performance of your PowerShell code you may need to rewrite the performance-critical parts in C#. This is a great option, and the more options the better. You can increase your options by choosing a language like Rust which guarantees memory and thread safety and it is performant, plus it brings other things to the table.

In this post, I'll demo one way to do this.

## Calling Rust Methods from PowerShell

Rust allows to expose functionality with a C interface. In PowerShell, you can access this API using the .NET framework which lets you work with Win32 functions through a technique called P/Invoke (Platform Invocation Services.)

##  First Install Rust

The first step is to install Rust. On Windows, go to [https://www.rust-lang.org/tools/install](https://www.rust-lang.org/tools/install) and follow the instructions. To check whether you have Rust installed correctly, open a PowerShell console and enter this line:

```powershell
PS C:\> rustc --version
```

# Simple Approach

This will all be demoed from a single PowerShell script, it's a quick an easy way to see the moving parts. It'll compile the Rust code on the fly. This is a viable option, but as your Rust code grows in complexity, it'd be better to move to using [Rust's package manager Cargo](https://doc.rust-lang.org/cargo/).


# The Rust Code

Here you're defining a Rust function that takes two numbers as parameters, adds and returns them. Lets set that Rust program string to the PowerShell variable `$rustPgm`

```powershell
$rustPgm = @"
#[no_mangle]
pub extern "C" fn add_numbers(number1: i32, number2: i32) -> i32 {
    number1 + number2
}
"@
```

Next, save the the program to a local file.

```powershell
$rustPgm | Set-Content -Encoding UTF8 .\lib.rs
```

Now, compile it using the Rust copiler.

```powershell
rustc .\lib.rs --crate-type dylib --crate-name powershell_to_rust
```

Finally, you need to compile some C# to do the P/Invoke.

```powershell
    $definition = @"
[DllImport("powershell_to_rust.dll")]
public static extern Int32 add_numbers(Int32 number1, Int32 number2);
"@

    $target = Add-Type -MemberDefinition $definition -Name AddNum -PassThru
```

We can now invoke the static C# method which will interop with the Rust.

```powershell
$target::add_numbers(3, 8)

# Prints 11
```

# The Full Script

Just getting started. You can see it is pretty straightforward. Great for experimenting to see what you do with PowerShell and Rust.

It's interesting to note, in <20 lines of code, you're compiling Rust, C# and using it all in PowerShell. You can even store the results from `$target::add_numbers(3, 8)` in a PowerShell variable.

This opens the door for lots of possibilities. Again, this is just to kick the tires.

Using the Rust package manager and standard development techinques, you can build large complex Rust implementations, do unit testing, and then compile it to a DLL. Follwed by compiling the API P/Invoke parts in C# and then gluing them all together in PowerShell.

Very cool.

```powershell
$rustPgm = @"
#[no_mangle]
pub extern "C" fn add_numbers(number1: i32, number2: i32) -> i32 {
    number1 + number2
}
"@

$rustPgm | Set-Content -Encoding UTF8 .\lib.rs
rustc .\lib.rs --crate-type dylib --crate-name powershell_to_rust

## start another PS so dll doesn't get locked
powershell -noprofile -command {
    $definition = @"
[DllImport("powershell_to_rust.dll")]
public static extern Int32 add_numbers(Int32 number1, Int32 number2);
"@

    $target = Add-Type -MemberDefinition $definition -Name AddNum -PassThru
    $target::add_numbers(3, 8)
}
```