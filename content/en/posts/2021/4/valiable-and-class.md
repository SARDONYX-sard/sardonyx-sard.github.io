---
title: "On the image of variables and classes"
description: Think about variables and classes
date: "2021-04-22"
lastmod: '2021-12-15'
toc: true
tags:
  - javascript
categories:
  - programming
series:
  - Road of TypeScript
---

## The question of whether variables are boxes and their destructive and non-destructive behavior

When you first learned about variables and classes, what was the image you were
taught?

When I first learned about them, I was taught that variables are like boxes.

However, this was a little difficult for me to visualize.

The first time I learned this, I was taught that a variable is like a box, but
this was a little hard to visualize, because once you put data into a variable,
when you took it out, it was separated into copying and extracting data.

<br>

For example, let's say you have this code

```javascript
// const means constant, a variable declaration that cannot be reassigned
const i = "Hello";
const j = i;

console.log(j); // >>Hello
```

The data in variable i is copied and passed to j.

At this point, if it were really a box, it would be gone when it is taken out,
but in the actual code, it is not.

The `j = i` is a copy of the data and the data is copied to a memory address in
another location and stored.

Copying and extracting are generally called non-destructive or destructive,
depending on the method you call.

In this case, since it is an assignment, it is a copy.

In the destructive case, it looks like this

```javascript
const numbers = [1, 2, 3];
numbers.pop();
```

Extract the end of the array, i.e., 3.

The variable numbers will be left with [1, 2].

The variable numbers is still [1, 2], so why don't we imagine the variable as "a
chunk of data with a name attached to it"?

Hmmm... if you remember whether it's destructive or non-destructive, and if you
think of a variable as a "box", you'll be fine.

I think it would be easier to understand static typing if we use the term "box",
so we should use "box".

What is the image of a ## class?

When you learn programming to a certain extent, you will encounter a problem.

This is the class.

When you learn several languages, you will commonly hear that a class is "like a
blueprint.

To be honest, it is hard to understand. How about "a group of functions and
variables that are used as a group"?

If you are aware that a class is like a blueprint, it will be difficult to
understand when you learn static methods, so if you remember that a class is
used after instantiation, you will be able to get by.

## Eventually

The best way to understand is to move your hands, look at the sample code, and
then try to create your own variables and classes.
