---
layout: post
title:  "Powershell v5 Classes & Concepts"
date:   2016-08-18 21:46:00
comments: true
description: A deep dive into Powershell WMF5 Classes and OOP Design Patterns.
categories: 
    - PowerShell
tags: 
    - PowerShell
    - classes
thumbnail: /images/posts/powershell-classes-and-concepts/powershell-highlander.png
---

![Img](/images/posts/powershell-classes-and-concepts/powershell-highlander.png)

## Abstract

The release of *Powershell WMF5* added classes to help simplify the creation of DSC resources.
The class wrapper helps us encapsulate and localize variables and methods by creating objects.
Classes expose an entirely new paradigm to Powershell known as Object-Oriented Programming.
Taking a glance at the authoring process for earlier modules and DSC resources we can see a few common problems.
Code duplication, an easily identifiable code smell, is found through many of the open source projects.
Dynamic scoping and encapsulation issues forced developers to clear, cast, or rename variables.
Many of these problems are easily resolved using OOP.
The following article outlines the basic syntax of PowerShell classes while subsequently introducing intermediate and advanced design pattern concepts.

-----

* TOC
{:toc}

-----

## Introduction

Developers new to PowerShell, often find themselves looking for better design patterns to keep code clean and manageable.
Since PowerShell is a *functional* language, it felt worthwhile to experiment with modern design patterns commonly seen in languages like **JavaScript**.
One example of this is `closures`. Keep in mind, treating PowerShell like JavaScript is a recipe for a hard time -- albeit an entertaining challenge.

{% gist 982591df56c84e683fef1f3c33ebbd29 %}

Eventually, we find ourselves settling for the current arsenal such as *Splatting*, *Pipelines*, and *Remoting*.
The introduction of class-based resources rekindles the quest for better code design.
At that time, finding resources on the new syntax was nearly impossible.

Huge thanks go out to [June Blender][juneb] for her section on MVA ([What's new in Powershell v5][WhatsNewV5]) as well as her blog articles over at Sapien.
June's contributions helped us get a handle on the basics and inspired me to help others in return.

* For anyone primarily looking for information on authoring DSC Class based resources.
  * [Matthew Hodgkins][HodgeTips] has an excellent article to get you started.
* For testing *WMF4/5* resources, I highly recommend investing time with `Test-Kitchen` and `Kitchen-DSC`.
  * [Steven Murawski][Test-Kitchen] from Chef provides an exceptional collection of resources.
* Class-based resouces requires some workarounds.
  * [Doug Finke][dougefinke] and [Christopher Hunt][cdhuntTesting] provide a few articles on the caveats.

## Syntax Overview

### Class Structure

The following is an overview of Object-Oriented Programming and Class syntax in WMF5.

#### Classes

We can think of `Classes` as models or blueprints.
To use a *Class*, we create a special *Type* of variable known as an **Object**; an *Object* is an **instance** of a *Class*.

Think of a class as a way to create a specification of variables, functions, and other properties (e.g. a template).
Now to use this model, we must create an instance of the specification (object).
Similarly, this is the same idea where a contractor can use a blueprint to build multiple houses.
Once created, an object has *access* to **properties** and **methods** defined by its class.

```powershell
# Class Syntax
class CyberNinja
{
}
```

#### Properties

`Properties` are a special type of class member which define a **field** (data variable) as well as hidden methods to *get* and *set* the value.

A **Property** is composed of a `data type`, `name`, `default value`, `access modifier`, and `non-access modifier`.

* **Data Type**: A data type can be a built-in type like *[String]*, *[Int32]*, *[Bool]*.
  * Additionally, this could also be a custom data type such as another PowerShell class: `[CyberNinja]`.
* **Name**: The name of the property.
  * The name follows a set of allowed rules such as alphanumeric, underscores, dashes, and, numbers.
* **Default Value (Optional)**: Specifies the default value of a Property when creating an object.
  * If a value is not declared, the property will not always be null.
  * The default value of the properties data type determines the value.
* **Access Modifier (Optional)**: *[public, hidden]*. The default modifier is public; however, we do not use the public keyword.
* **Non-access Modifier (Optional)**: The *static* keyword controls if a property is an *instance* or *class/static* type.

```powershell
# Public Properties
[String] $Alias
[Int32] $HitPoints

# Static Properties
static [String] $Clan = "Posh Shinobi"

# Hidden Properties
hidden [String] $RealName
```

> *Note:* More on Access Modifiers below.
{: .pull .blue }

#### Methods

The term `Method` is a fancy way of describing a function defined inside of a class.
In OOP, a method can take arguments the same as a function; however, they must return a value.

* If a method **does not** return a value, the return type is `[Void]`.
* A **data type** should be type-hinted for each argument in the method header, e.g., `[String] $Name`.

A method should have an `access modifier`, `name`, `arguments`, and `return type`.

* The access modifier is considered **public** if left blank.
* If `static` is **not** declared the property will be an instance type.

```powershell
# Instance Method
[String] getAlias()
{
    return $this.Alias
}

# Static Method
static [String] getClan()
{
    return [CyberNinja]::Clan
}

# Static Method
static [String] Whisper ([String] $Name)
{
    return "Hello {0}!" -f $Name
}
```

#### $this

The `$this` variable describes the **current instance** of the object. It is thought of like `$_` for classes.

* If a property is not static, the syntax `$this.PropertyName` is used to reference the instance property.
* To refer to methods simply use the method name or `$this.MethodName()`.

> *Note:* A static method cannot use **$this**.
{: .pull .red }

#### Constructor

A `Constructor` is a type of method that is called only when an object is created.

* A constructor **must** use the same name as the class.

Let's say we create a class called `CyberNinja` with properties for the ninja's **Alias** and **HitPoints**.
By design, we would not want to allow someone to create a ninja object without filling in the required properties.
To force any required arguments, we need a constructor.

Constructors are similar to the `Begin` block in `Functions`.

```powershell
class CyberNinja
{
    # Constructor
    CyberNinja ([String] $Alias, [int32] $HitPoints)
    {
        $this.Alias = $Alias
        $this.HitPoints = $HitPoints
    }
}
```

#### ToString

`ToString` is one of the convenient object methods seen in traditional OOP.
If an object is passed to a function which accepts a string argument, **ToString** will automatically be called.

* If ToString is not added/overwritten in the class, the default *ToString* method returns the class name.
* The default object behavior can be forced by casting the object to `[System.Object]`.

```powershell
class myColor
{
    [String] $Color
    [String] $Hex

    myColor([String] $Color, [String] $Hex)
    {
        $this.Color = $Color
        $this.Hex = $Hex
    }

    [String] ToString()
    {
        return $this.Color + ":" + $this.Hex
    }
}
```

```console
PS C:\> $red = [myColor]::new("Red", "#FF0000")

PS C:\> Write-Host $red
Red:#FF0000

PS C:\> Write-Host ([System.Object]$red).ToString()
myColor
```

#### Example 1: Class Structure

The following code is a simple example of a basic class.
Next, we look at how to use a class and continue with some more advanced concepts.

```powershell
class CyberNinja
{
    # Properties
    [String] $Alias
    [int32] $HitPoints

    # Static Properties
    static [String] $Clan = "DevOps Library"

    # Hidden Properties
    hidden [String] $RealName

    # Parameterless Constructor
    CyberNinja ()
    {
    }

    # Constructor
    CyberNinja ([String] $Alias, [int32] $HitPoints)
    {
        $this.Alias = $Alias
        $this.HitPoints = $HitPoints
    }

    # Method
    [String] getAlias()
    {
       return $this.Alias
    }

    # Static Method
    static [String] getClan()
    {
        return [CyberNinja]::Clan
    }

    # ToString Method
    [String] ToString()
    {
        return $this.Alias + ":" + $this.HitPoints
    }
}
```

### Creating instances of a class

To use a class, we must instantiate an object unless using static properties or methods.
Most commonly, this is done using the `new()` static method or the [New-Object Command][New-Object].
In some cases, such as creating classes dynamically by type, the *New-Object* command is necessary.

```powershell
# Using Static "new" method.
$Ken = [CyberNinja]::new("Ken", 28)

# Using New-Object. Parameters for Argument list are positional and required by the constructor.
$Hodge = New-Object CyberNinja -ArgumentList "Hodge", 31

# Using a HashTable. Note: requires default or parameterless constructor.
$June = [CyberNinja]@{
    Alias = "June";
    HitPoints = 40;
}

# Dynamic Object Type using a variable name.
$Type = "CyberNinja"
$Steven = New-Object -TypeName $Type
```

When considering code design, it is common to declare the object type explicitly.

```console
PS C:\> [CyberNinja] $Ken = [CyberNinja]::new("Ken", 28)
```

### Static vs. Instance

The keyword `static` is a **non-access modifier** for properties and methods within a class.

* For **properties**, the value is the same across every instance of the class.
* For **methods**, the method cannot use instanced variables such as `$this.Name`

Looking back at *Example 1*, if we create ten *CyberNinja* objects and change the **$Clan** property of any one of them, the change will be reflected in every single *Object*.

#### Static

* Uses the `::` operator to access the property or method.
* Typically called using `[Class]::Property`, where "Class" is the name of the class.

```powershell
[CyberNinja] $Ken = [CyberNinja]::new("Ken", 28)

# Call a Static Method
$Ken::getClan()
[CyberNinja]::getClan()

# Fetch Static Prop Value
$Ken::Clan
[CyberNinja]::Clan

# Set Static Prop Value
$Ken::Clan = "DevOps Library"
[CyberNinja]::Clan = "DevOps Library"
```

#### Instance

* Uses the `.` operator to access the property or method.
* Must be called on an instanced object of a class -- not directly.

```powershell
[CyberNinja] $Ken = [CyberNinja]::new("Ken", 28)

# Call an Instance Method
$Ken.getAlias()

# Fetch Instance Prop Value
$Ken.HitPoints

# Set Instance Prop Value
$Ken.Alias = "Mekuto"
```

### Accessors/Mutators aka Getter/Setter

Properties in a PowerShell class can be `static`, `public`, and `hidden`.

* By default, a property is **public**.
* To **get** a property value from an object, use `$obj.Name`.
* To **set** a property from an object, use `$obj.Name = "New Name"`.

Powershell automatically creates **accessor** methods for getting and setting the value.
These **hidden** accessor methods are called `get_x`, `set_x` where "x" is the property name.

> **Hidden** is not the same as **private** in languages such as C#.
{: .pull .red }

If we create an object of the *[CyberNinja]* class and view the members with `Get-Member`, we can see all of the **public** members.

```console
PS C:\> $Chris = [CyberNinja]::new("Mirishikiari", 28)

PS C:\> $Chris | Get-Member

PS C:\> $Chris | Get-Member

   TypeName: CyberNinja

Name        MemberType Definition
----        ---------- ----------
Equals      Method     bool Equals(System.Object obj)
GetHashCode Method     int GetHashCode()
getAlias    Method     string getAlias()
GetType     Method     type GetType()
ToString    Method     string ToString()
Alias       Property   string Alias {get;set;}
HitPoints   Property   int HitPoints {get;set;}
```

Hidden members can be viewed by supplying the `-Force` Flag to `Get-Member`.

> **Note:** V5 does not have private variables since PowerShell uses PowerShell for debugging.
{: .pull .blue}

In the following code example, notice the **get\_x** and **set_x** methods PowerShell automatically creates for our properties.
Our hidden **RealName** Property is also accessible -- how quaint.

```console
PS C:\> $Mike = [CyberNinja]::new("Xainey", 28)

PS C:\> $Mike | Get-Member -Force

   TypeName: CyberNinja

Name          MemberType   Definition                                 
----          ----------   ----------                                 
pstypenames   CodeProperty System.Collections.ObjectModel.Collection`1...
psadapted     MemberSet    psadapted {Alias, HitPoints, get_Alias, set...
psbase        MemberSet    psbase {Alias, HitPoints, get_Alias, set_Al...
psextended    MemberSet    psextended {}                              
psobject      MemberSet    psobject {Members, Properties, Methods, Imm...
Equals        Method       bool Equals(System.Object obj)             
getAlias      Method       string getAlias()                          
GetHashCode   Method       int GetHashCode()                          
GetType       Method       type GetType()                             
get_Alias     Method       string get_Alias()                         
get_HitPoints Method       int get_HitPoints()                        
get_RealName  Method       string get_RealName()                      
set_Alias     Method       void set_Alias(string )                    
set_HitPoints Method       void set_HitPoints(int )                   
set_RealName  Method       void set_RealName(string )                 
ToString      Method       string ToString()                          
Alias         Property     string Alias {get;set;}                    
HitPoints     Property     int HitPoints {get;set;}                   
RealName      Property     string RealName {get;set;}                 

```

> Hidden properties are masked, but still accessible to the debugger.
> *June Blender - @juneb*
{: .pull .quote }

`Get-Member` can be useful for finding methods on custom objects and built-in objects.

```powershell
# All
[Math] | Get-Member

# Static Only Methods
[Math] | Get-Member -Static

# Hidden
[Math] | Get-Member -Force
```

### Overloaded Methods

`Method Overloading` is a way to define multiple methods with the same name.
Overloaded methods behave differently depending on **the number of arguments** or the **data types of the arguments** supplied.
In the following code example, `SayHello()` and `add()` can be called different ways.

```powershell
class OverloadExample
{
    static [String] SayHello ()
    {
        return "Hello There!"
    }

    static [String] SayHello ([String] $Name)
    {
        return "Hello {0}!" -f $Name
    }

    static [int] add([int] $a, [int] $b)
    {
        return $a + $b
    }

    static [double] add([double] $a, [double] $b)
    {
        return $a + $b
    }
}
```

```console
PS C:\> [OverloadExample]::SayHello()
Hello There!

PS C:\> [OverloadExample]::SayHello("Mike")
Hello Mike!

PS C:\> [OverloadExample]::add(1, 2)
3

PS C:\> [OverloadExample]::add(1.1, 2.3)
3.4
```

> Methods and Constructors are overloadable.
{: .pull .green }

We could also refactor the above example to simplify `SayHello()`.
In this next snippet, the parameterless `SayHello()` method is funneled through the single argument method.

```powershell
class OverloadRefactor
{
    # Calls Overloaded Method
    static [String] SayHello ()
    {
        return [OverloadRefactor]::SayHello("There")
    }

    static [String] SayHello ([String] $Name)
    {
        return "Hello {0}!" -f $Name
    }
}
```

```console
PS C:\> [OverloadRefactor]::SayHello()
Hello There!

PS C:\> [OverloadRefactor]::SayHello("Mike")
Hello Mike!
```

### Inheritance

`Inheritance` allows for programmers to create classes from existing classes by **extending** them.
In this way, we can reuse classes and extend the functionality without editing a closed class. \*cough SOLID\*
When a class is **extended**, all of the members from the base or parent class are inherited (passed on) to the child class.

* To extend a class, use the syntax `Class Child : Parent`.

```powershell
# Foo is the parent class
class Foo
{
    [string] $Message = "Hello!"

    [string] GetMessage()
    {
        return ("Message: {0}" -f $this.Message)
    }
}

# Bar extends Foo and inherits its members
class Bar : Foo
{

}
```

The class **Bar** does not declare any properties or methods.
If we create an instance of the **Bar** class, it will **inherit** all of the members of its parent class.

```console
PS C:\> $myBar = [Bar]::new()

PS C:\> $myBar.Message
Hello!

PS C:\> $myBar.GetMessage()
Message: Hello!
```

> Note: To override this behavior, we must **redeclare** the members in the child class.
{: .pull .blue }

### Using the Base Constructor

A child class can call the constructor of its parent by using the `: base()` command on its constructor.

```powershell
class ZeroWing
{
    [String] $User
    [String] $Message

    ZeroWing([String] $User, [String] $Message)
    {
        $this.User = $User
        $this.Message = $Message
    }

    [String] TurnOn()
    {
        return ("{0} : {1}" -f $this.User, $this.Message)
    }
}

class MainScreen : ZeroWing
{
    MainScreen([String] $User, [String] $Message) : base($User, $Message)
    {

    }
}
```

The constructor for `MainScreen` **maps** parameters to the base constructor.

```console
PS C:\> $mainScreen = [MainScreen]::new("CATS", "All your base are belong to us.")

PS C:\> $mainScreen.User
CATS

PS C:\> $mainScreen.TurnOn()
CATS : All your base are belong to us.
```

### Enumerations

An `Enum` is a special *Type* which defines a set of named constants.
In PowerShell, we can use an **Enum** as an argument type for a method in a *Class*.
The Enum type lets a method **restrict** the argument values it can accept.

```powershell
Enum Turtles
{
    Donatello
    Leonardo
    Michelangelo
    Raphael
}
```

```powershell
Enum Turtles
{
    Donatello = 1
    Leonardo = 2
    Michelangelo = 3
    Raphael = 4
}
```

```console
To get names from an enum
PS C:\> [System.Enum]::GetValues([Turtles])

To get int values from an enum
PS C:\> [System.Enum]::GetValues([Turtles]) | foreach { [int] $_ }
```

## Design Patterns

### Polymorphism

`Polymorphism` commonly uses a **parent class** to reference a **child class**.
In more advanced cases we rely on *interfaces*. However, interfaces are not included natively in PowerShell v5.

Using classes to demonstrate polymorphism is straightforward as seen in the next example.

```powershell
class Foo
{
    [string] $SomePram

    Foo([string]$somePram)
    {
        $this.SomePram = $somePram
    }

    [string] GetMessage()
    {
        return $null
    }

    [void] WriteMessage()
    {
        Write-Host($this.GetMessage())
    }
}

class Bar : Foo
{
    Bar([string]$somePram): base($somePram)
    {

    }

    [string] GetMessage()
    {
        return ("{0} Success" -f $this.SomePram)
    }
}

class Bar2 : Foo
{
    Bar2([string]$somePram): base($somePram)
    {

    }

    [string] GetMessage()
    {
        return ("{0} Success" -f $this.SomePram)
    }
}

[Foo[]] $foos = @([Bar]::new("Bar"), [Bar2]::new("Bar2"))

foreach($foo in $foos)
{
    $foo.WriteMessage()
}
```

```console
Bar Success
Bar2 Success
```

While this may work in some cases, we may decide that the logic for `WriteMessage()` should not be in the base class.
If we had interfaces, this feat would be simple enough.
Since we do not, this brings us to the next pattern: *Abstract Classes*.

### Abstract Classes

An `Abstract Class` is similar to a combination of an **Interface** and a **Class**.
It can be used to define the underlying contract required by any class extending it.

* In OOP a class which extends an abstract class **should implement** all of the defined methods, similar to an interface.
* Additionally, we **cannot** create an instance of an abstract class.

Since PowerShell **does not** have the `abstract` keyword, we need to simulate this functionality. In the next example:

* *Foo* **cannot** be directly instantiated
* `SayHello()` in the *Foo* class **must be overridden** by a child class. Otherwise, we should throw an error.

```powershell
class Foo
{
    Foo ()
    {
        $type = $this.GetType()

        if ($type -eq [Foo])
        {
            throw("Class $type must be inherited")
        }
    }

    [string] SayHello()
    {
        throw("Must Override Method")
    }
}

class Bar : Foo
{
    Bar ()
    {

    }

    [string] SayHello()
    {
        return "Hello"
    }
}

```

```console
# Can not instantiate [Foo]
# $Foo = [Foo]::new()

# Since we cannot create a direct object from [Foo] we cannot call SayHello()
# $Foo.SayHello()

# [Bar] must override SayHello()
$Bar = [Bar]::new()
$Bar.SayHello()

# Can use polymorphism
[Foo[]] $MyFoo = @([Bar]::new())

foreach($obj in $MyFoo)
{
    $obj.SayHello()
}
```

### Singleton

The `Singleton` design pattern used to restrict the instantiation of a *Class* to **one object only**.
Many other design patterns require a singleton implementation.

Typically, we want to use a singleton when:

* There should only be a single global object.
* There is a need to control concurrent access to a shared resource.

```powershell
class Singleton
{
    # Instanced Property
    [int] $SomeParm

    static [Singleton] $instance

    static [Singleton] GetInstance()
    {
        if ([Singleton]::instance -eq $null)
        {
            [Singleton]::instance = [Singleton]::new()
        }

        return [Singleton]::instance
    }
}
```

```console
PS C:\> $single = [Singleton]::GetInstance()

PS C:\> $single.SomeParm = "Highlander"

PS C:\> $single.SomeParm
Highlander

PS C:\> $another = [Singleton]::GetInstance()

PS C:\> $another.SomeParm
Highlander
```

> There can be only one!
{: .pull .red }

### Factory Pattern

The `Factory Pattern` considered a **creational pattern**, is by far one of the most valuable models.
It lets us create objects, though a common factory interface, *without* needing to reference an exact class.
This pattern also allows for the creation of objects without exposing the underlying creation logic.

> Note: The following example builds on my earlier concepts on abstract classes.
{: .pull .blue }

```powershell
<#
 # Abstract Class: Drink
 # Create an Abstract drink class to serve as the interface.
 # Constructor restricts this class being instantiated directly.
 # Methods are defined and force children to override.
 #>
class Drink
{
    [String] $Name

    [Int32] $Caffeine

    Drink ([String] $Name, [Int32] $Caffeine)
    {
        $type = $this.GetType()

        if ($type -eq [Drink])
        {
            throw("Class $type must be inherited")
        }

        $this.Name = $Name
        $this.Caffeine = $Caffeine
    }

    [string] Open()
    {
        throw("Must Override Method")
    }

}

<#
 # EnergyDrink Class: implements Drink
 # Constructor uses base constructor.
 # Methods overrides are declared.
 #>
class EneryDrink : Drink
{
    EneryDrink ([String] $Name, [Int32] $Caffeine) : base ($Name, $Caffeine)
    {
    }

    # @Override
    [string] Open()
    {
        return "Popped the tab on a can of: {0}" -f $this.Name
    }
}

<#
 # Soda Class: implements Drink
 # Constructor uses base constructor.
 # Methods overrides are declared.
 #>
class Soda : Drink
{
    Soda ([String] $Name, [Int32] $Caffeine) : base ($Name, $Caffeine)
    {
    }

    # @Override
    [string] Open()
    {
        return "Twisted the top of a bottle of: {0}" -f $this.Name
    }
}

<#
 # Factory Class: DrinkFactory
 # Instance Methods generate new Drinks.
 # Static Properties/Methods demonstrate Storage/Fetch Concepts.
 #>
class DrinkFactory
{
    #Store and Fetch
    static [Drink[]] $Drinks

    static [Object] getByType([Object] $O)
    {
        return [DrinkFactory]::Drinks.Where({$_ -is $O})
    }

    static [Object] getByName([String] $Name)
    {
        return [DrinkFactory]::Drinks.Where({$_.Name -eq $Name})
    }

    #Create an instance
    [Drink] makeDrink([String] $Name, [String] $Caffeine, [String] $Type)
    {
        return (New-Object -TypeName "$Type" -ArgumentList $Name, $Caffeine)
    }
}
```

#### Standard Factory Object Generation

```console
PS C:\> [DrinkFactory] $DrinkFactory = [DrinkFactory]::new()

PS C:\> [Drink] $Beverage1 = $DrinkFactory.makeDrink("RedBull", 100, "EneryDrink")

PS C:\> [Drink] $Beverage2 = $DrinkFactory.makeDrink("Monster", 100, "EneryDrink")

PS C:\> [Drink] $Beverage3 = $DrinkFactory.makeDrink("Coke", 100, "Soda")

PS C:\> $Beverage1.Open()
Popped the tab on a can of: RedBull

PS C:\> $Beverage2.Open()
Popped the tab on a can of: Monster

PS C:\> $Beverage3.Open()
Twisted the top of a bottle of: Coke
```

#### Using Static Methods to Set/Fetch Objects

```console
PS C:\> [DrinkFactory]::Drinks = @(
            [EneryDrink]::new("RedBull", 28),
            [EneryDrink]::new("Monster", 20),
            [Soda]::new("Coke", 24)
        )

PS C:\> [DrinkFactory]::getByType([EneryDrink])

Name    Caffeine
----    --------
RedBull       28
Monster       20


PS C:\> [DrinkFactory]::getByName("Coke")

Name Caffeine
---- --------
Coke       24

```

### Method Chaining

`Method chaining` is a popular design pattern in languages such as *JavaScript* and *PHP*. 
Traditionally, in functional languages, functions or constructors required large numbers of positional arguments.
Method chaining gives us a way to create an object and set these values in a maintainable and readable fashion.

This pattern is also known as the **named parameter idiom**. To create this pattern:

1. Create a method to set a property.
2. Set the return type of the method to the class type.
3. Set an instance variable.
4. Return `$this`.

> *Note:* The following example uses Enums to handle defaults easily.
{: .pull .blue }

```powershell
Enum Crust
{
    Thin
    HandTossed
    DeepDish
}

Enum Sauce
{
    Marinara
    GarlicParmesan
    Buffalo
}

Enum Toppings
{
    Pepperoni
    Sausage
    Chicken
}

class Pizza
{
    [Crust] $crust
    [Sauce] $sauce
    [Toppings] $toppings

    # Default, Parameterless Constructor
    Pizza()
    {

    }

    # Named Constructor
    static [Pizza] newOrder()
    {
        return [Pizza]::New()
    }


    [Pizza] chooseCrust([Crust] $crust)
    {
        $this.crust = $crust
        return $this
    }

    [Pizza] addSauce([Sauce] $sauce)
    {
        $this.sauce = $sauce
        return $this
    }

    [Pizza] addToppings([Toppings] $toppings)
    {
        $this.toppings = $toppings
        return $this
    }

    [Void] placeOrder()
    {
        Write-Host ("Pizza ordered. Details {0}" -f $this.toString())
    }

    [String] toString()
    {
        return "Crust: {0} Sauce: {1} Toppings: {2}" -f $this.crust, $this.sauce, $this.toppings
    }

}
```

```console
# separate steps
$myPizza = [Pizza]::new()
$myPizza.chooseCrust("DeepDish").addSauce("GarlicParmesan").addToppings("Sausage") | Out-Null
$myPizza.placeOrder()

# combined steps, using named constructor
[Pizza]::newOrder().chooseCrust("HandTossed").addSauce("Marinara").addToppings("Pepperoni").placeOrder()

# Using Normal Constructor: Parens not required in first example
([Pizza]::new()).placeOrder()

(New-Object -TypeName Pizza).placeOrder()

# Chaining Example Multiline. The "." on the right feels strange.
cls
[Pizza]::newOrder().
    chooseCrust("HandTossed").
    addSauce("Marinara").
    addToppings("Pepperoni").
    placeOrder()

# Chaining Example 2 Multiline
[Pizza]::newOrder() `
   | %{$_.chooseCrust("HandTossed")} `
   | %{$_.addSauce("Marinara")} `
   | %{$_.addToppings("Chicken")} `
   | %{$_.placeOrder()}
```

### Base Splat Pattern

While this may not be a traditional class design pattern, I created this pattern to simply **using object properties** with other PowerShell commands.

Calling a function with many positional arguments OR many named Parameters can become difficult to manage.

To solve this issue, we use a technique known as **Splatting**.

#### Using object properties to Splat a function

```powershell
class Concept
{
    [String] $Name
    [Int32] $Answer

    Concept ([String] $Name, [Int32] $Answer)
    {
        $this.Name = $Name
        $this.Answer = $Answer
    }
}

function Get-Meaning ($Name, $Answer)
{
    "The meaning of {0} is {1}." -f $Name, $Answer
}

[Concept] $concept = [Concept]::new("Life", 42)

$parms = @{
    Name   = $concept.Name
    Answer = $concept.Answer
}

Get-Meaning @parms
```

#### Using Base Helper to Generate Splat HashTable

```powershell
class Helper
{
    [HashTable] Splat([String[]] $Properties)
    {
        $splat = @{}

        foreach($prop in $Properties)
        {
            if($this.GetType().GetProperty($prop))
            {
                $splat.Add($prop, $this.$prop)
            }
        }

        return $splat
    }
}

class Concept : Helper
{
    [String] $Name
    [Int32] $Answer
    [Boolean] $HasTowel

    Concept ([String] $Name, [Int32] $Answer)
    {
        $this.Name = $Name
        $this.Answer = $Answer
    }
}

function Get-Meaning ($Name, $Answer)
{
    "The meaning of {0} is {1}." -f $Name, $Answer
}
```

Using the `Helper` class, anytime we need to *Splat* selected properties from an object, the base class handles the heavy lifting.

```console
PS C:\> [Concept] $concept = [Concept]::new("Life", 42)

PS C:\> $splat = $concept.Splat(("Name", "Answer"))

PS C:\> Get-Meaning @splat
The meaning of Life is 42.
```

### Loading Class Files

Currently, there are some **restrictions** for loading class files.

* Parent classes **must** load before their children.

Thankfully, classes and child classes do not have to be in the same file.

If we use the following common example of **dot source** loading `.ps1` files, we could run into this restriction.

```powershell
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )

# Dot source the files
foreach($import in $Public)
{
    try
    {
        . $import.fullname
    }
    catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

Export-ModuleMember -Function $Public.Basename
```

#### Possible Workarounds

* Class/child class naming conventions which force alphabetic ordering precedence.
* Recursive try/catch until all of the classes load.
* Manually define the order and files in the module manifest.
* Use a lower level directory structure for child classes.

## Conclusion

The PowerShell language is steadily evolving, which in turn adapts developer methodologies.
People are amazing at taking a great invention and using it for entirely new ideas. Perhaps this is one of the reasons open source thrives.
Take Play-Doh for example, Noah McVicker invented this goop as a wallpaper cleaner in the 1930s, around 20 years later it became a children's toy.
Hopefully, this article helps others learn PowerShell class syntax, OOP concepts, design patterns and explore new ideas.

Feel free to ask questions or send a pull request if you find anything that needs improvement.

## References

1. [Five Tips for Writing DSC Resources][HodgeTips].
2. [What's new in PowerShell Version 5][WhatsNewV5].
3. [Inheritance in PowerShell Classes][JuneInheritance]
4. [Enumerations in PowerShell Classes][JuneEnum]
5. [Scripting Guys: PowerShell 5 create a simple class][ScriptingGuy]
6. [New-Object Command][New-Object]
7. [Testing PowerShell Classes][cdhuntTesting]
8. [Getting Started With Test-Kitchen and DSC][Test-Kitchen]
9. [Development in a Blink][dougefinke]

[New-Object]:       https://technet.microsoft.com/en-us/library/hh849885.aspx
[WhatsNewV5]:       https://mva.microsoft.com/en-US/training-courses/whats-new-in-powershell-v5-16434
[HodgeTips]:        https://hodgkins.io/five-tips-for-writing-dsc-resources-in-powershell-version-5
[JuneInheritance]:  https://www.sapien.com/blog/2016/03/16/inheritance-in-powershell-classes/
[JuneEnum]:         https://www.sapien.com/blog/2015/01/05/enumerators-in-windows-powershell-5-0/
[ScriptingGuy]:     https://blogs.technet.microsoft.com/heyscriptingguy/2015/09/01/powershell-5-create-simple-class/
[cdhuntTesting]:    https://www.automatedops.com/blog/2016/01/28/testing-powershell-classes/
[Test-Kitchen]:     http://stevenmurawski.com/powershell/2016/05/getting-started-with-test-kitchen-and-dsc/
[dougefinke]:       http://dougfinke.com/blog/

[juneb]:            https://github.com/juneb

*[MVA]: Microsoft Virtual Academy
*[DSC]: Desired State Configuration
*[OOP]: Object-Oriented Programming
*[instantiate]: create an instance
