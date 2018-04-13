---
layout: page

title: "PowerShell and Design Patterns"
date:   2018-04-13 15:00:00
comments: true
description: "PowerShell and Design Patterns"
categories:
    - PowerShell, Design Patterns
tags:
    - PowerShell, Design Patterns
---

Writing good software is hard. Writing reusable software, is even harder.

Writing good PowerShell scripts is hard. Writing reusable PowerShell scripts, is even harder. This is re-phrasing a line from the book "Design Patterns Elements of Reusable Object-Oriented Software".

> Designing object-oriented software is hard, and designing reusable object-oriented software is even harder.

The book is an excellent guide on how to think about what you're building.

## Benefits
How many times have you written PowerShell scripts only to re-write them when you need to do something a bit different? Or worse, hacked up what you've done, make it work but you have a set of scripts that are very fragile and brittle. They start to break more with each change an addition.

Design Patterns help you fix that.

When you hand over your PowerShell scripts to others, a co-worker, in your open source projects and you go to explain how parts of these scirpts work, how painful is that? Is there an easy explanation?

Design Patterns help you fix that.

Are desgin patterns worth learning? I suggest they are. The really good news is, they apply to pretty much any software language. Go Google any of the following:

* design patterns C#
* design patterns Ruby
* design patterns Python
* design patterns JavaScript
* design patterns Groovy
* design patterns Rust

And, it doesn't stop there. Plus, you'll find in other languages there are design patterns created that ares not in the original book, because each language is tuned to do different things. There are even books on *Anti-Patterns* describing how to detect/analyze what is not good in the code/script you're inheriting/writing.

Learning design patterns can be fun, make you more productive, and a better PowerShell scripter. They are concepts that apply across languages and projects.

*Note*: Design Patterns was inspired by books written by Christopher Alexander on architecture and building

## How Did I Get Here
Chris Hunt and I have collaborating for the past few years in different capacities. He reached out to me with ideas and ultimately a pull request on an open source project I put together PowerShellHumanizer. It didn't stop there.

We interact regularly, sharing ideas, both good and bad (on both sides), giving and receiving feedback on approaches, code and more.

Recently we chatted about going from PowerShell scripter to PowerShell open source scripter and what that takes. More on that in later blog posts.

I brought up design patterns and started sharing scripts on implementing the in PowerShell using classes. This led to chats about testing, automated testing, testing in both PowerShell Classic and PowerShell Core. This opened conversations to using PowerShell classes (which have challenges), blending it with scripting and delivering solutions that were pure PowerShell and still had the intent of a Design Pattern.

As will anything, once you start trying these ideas out, it leads to many questions, answers and trade offs.

In addition, the best place to try these new practices out is on a set of PowerShell scripts you've implemented. You already have a solution to a problem, and you can redo it with the new ideas so you can weigh the benefits.

That is what Chris did. I helped by working up examples of Design Patterns in PowerShell, and the he an I would set time to discuss issues, blockers, successes, trade-offs and next steps.

We've only just got started, and we've learned a lot. There is more to come.

## Getting Started
To kick off, we'll look at two patterns, I'll cover the `Adapter Pattern` in this post and Chris re-worked a PowerShell project and implemented the original [Gang of Four (GoF) Strategy Pattern](https://en.wikipedia.org/wiki/Strategy_pattern).

[Here's Chris' write up and implementation](https://www.automatedops.com/blog/2018/04/11/software-design-patterns-in-powershell-strategy-pattern/). Pay attention to the strategy pattern implementation, PowerShell classes and the [fluent interface](https://en.wikipedia.org/wiki/Fluent_interface) that Chris enabled.

Enjoy!

## Adapter Pattern in PowerShell

### Intent
The adapter pattern, also known as Wrapper, allows the interface of an existing item to be used as another.

## PowerShell Example

Both of these PowerShell statements return 3. The underlying .NET Array has a `Length` property and PowerShell employees the `adapter pattern` (wrapper) so you can use `Count`

```PowerShell
(1,2,3).Count
(1,2,3).Length
```

Here is a part of the `$PSHOME\types.ps1xml` file that makes this happen. The `Count` property uses the `Length` property to print the results.

```xml
  <Type>
    <Name>System.Array</Name>
    <Members>
      <AliasProperty>
        <Name>Count</Name>
        <ReferencedMemberName>Length</ReferencedMemberName>
      </AliasProperty>
    </Members>
  </Type>
```

This is a very useful technique. For example, when you have a set of objects that do similar things but you need to call a different property/method on each. Using the `adapter pattern`, you can wrap the objects so they have a consitent way to call them. This super simplifies your code and you'll see this in action at the end of this post.

## Adapter Pattern In Action

Below we'll use three PowerShell classes. A class declaration is like a blueprint that is used to create instances or objects at run time.
[More on PowerShell Classes](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes?view=powershell-6 )

The first three classes are `Computer`, `Synthesizer` and `Human`. The last class is `Adapter` which has the code that'll let us `adapt` the others.

Each of the classes has a method that returns a string. `Computer` has `Execute`, `Synthesizer` has `Play` and `Human` has `Speak`. If we want to print these strings, we'd have to know which one we were working with and then call the correct name to get the result. It'd be much easier if we could call the same method on each. It would simplfy our code, wouldn't need a switch or if statements, the script would be short and there would less of a chance of introducing errors.

```powershell
class Computer {
    [string] Execute() {
        return "$this executes a program"
    }
}

class Synthesizer {
    [string] Play() {
        return "$this is playing an electronic song"
    }
}

class Human {
    [string] Speak() {
        return "$this says hello"
    }
}

class Adapter {
    [object] static Adapt($obj, $alias, $referenced) {

        # doesn't work
        # return $obj | Add-Member -PassThru -Force -MemberType ScriptMethod -Name $alias -Value {$this.$referenced}

        # Use Invoke-Expression
        return ("`$obj | Add-Member -PassThru -Force -MemberType ScriptMethod -Name $alias -Value {`$this.$referenced}") | Invoke-Expression
    }
}
```

Let's just pick `Execute` as the name we want to call on each to get the string back. First we'll create an array `$targetObjects = @()` to hold Computer, Synthesizer and Human. That way we can leverage PowerShell's capability to unroll the array and call a mehod on each like this `$targetObjects.Execute()`.

```PowerShell
$targetObjects = @()
$targetObjects+= [Computer]::new()

$o=[Synthesizer]::new()
$targetObjects+=[Adapter]::Adapt($o, "execute", "play()")

$o=[Human]::new()
$targetObjects+=[Adapter]::Adapt($o, "execute", "speak()")

$targetObjects.Execute()
```

With PowerShell classes, you need to create a "new" one by instantiating it. `$o=[Computer]::new()` is one way to do it and `$o=New-Object Human` is an alternate way. Here's how we *adapt* or *wrap* an existing method to a new name. Or think of it like the way PowerShell makes an *AliasProperty* `Count` for `Length`

```powershell
$targetObjects+=[Adapter]::Adapt($o, "execute", "play()")
```

`[Adapter]::Adapt` takes three parameters, an object `$o` (Synthesizer) and a string for the alias `"execute"` and a string for the referenced name `"play()"`. Under the covers, the `[Adapter]::Adapt` method then uses the PowerShell `Add-Member` to make the "alias" point to the existing method.

You do this for each object and now `$targetObjects.Execute()` works like a charm.

## Summary

This is a powerful addition to your toolbox. As you progress to building toolkits and frameworks in PowerShell, knowing how to emply this technique will make you more productive. Plus, this is only one of the twenty three patterns in the original Design Patterns book, and because PowerShell is a dynamic language, there are other ways to leverage these approaches to make your scripts more maintainable and easier to read.

So, stay tuned and invest some time into learning how Design Patterns can make you a better thinker, communicator and implementor.