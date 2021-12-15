---
title: "Static Typing"
date: "2021-04-23"
lastmod: "2021-12-15"
tags:
  - JavaScript
  - TypeScript
categories:
  - programming
series:
  - "Road of TypeScript"
---

## Types of variables

In the last article, I talked about variables. Boxes, and that they might be a
good idea after all.

Now, there are two types of programming languages: dynamically typed and
statically typed, and there is a mechanism to fix the type of data to be stored
in a variable.

Let's talk about that...

In JavaScript, which I often write.

<br>
<br>

First, I would like to mention that there are several types of data that can be
stored in variables.

string: string "hello", "world", etc., enclosed in single or double quotes.

number: 1, 2, 3, etc., but not enclosed.

```javascript
// const means constant, a variable declaration that cannot be reassigned
const greeting = "hello";
const num = 1;
```

I'm not going to get into the good and bad of Japanese variables.

The above code declares hello as a variable called string. The number is 1. The
above code stores hello in the variable "string" and 1 for the number, and
stores the number in the variable "string".

In this case, the variable for string, "string", is replaced by the type number.

However, when you want to fix the type of data to be stored, this is not a good
idea.

Here's another example.

```javascript
// let is a variable declaration that can be reassigned
let cockroach = "cockroach"; // OK
let fruit = "apple"; // OK

let fruit = cockroach; // Error!
```

Put the cockroach in the box for the fruit. It will go in.

But we don't want it to go in...

So what do we do?

Convert a statically typed language to a dynamically typed language.

TypeScript can do that for you.

## TypeScript

TypeScript is a statically typed version of JavaScript. This language, created
by Microsoft, allows you to limit the data that goes into variables.

TypeScript itself takes some effort to install via CDN or Node.js
(`npm install typescript`), but the performance is worth the effort.

```typescript
// Use `:` to limit the data that goes into a variable
let cockroach: "cockroach" = "cockroach"; // OK
let fruit: "apple" = "apple"; // OK

fruit = cockroach; // Error!
```

The image is like a box with names written on it, one for apples and one for
cockroaches.

After checking for type errors, the code is automatically converted to
JavaScript.

By limiting the number of errors, it reduces the number of errors and makes the
code easier to read because it's easier to see what goes in.

Static typing is not so bad, I think.
