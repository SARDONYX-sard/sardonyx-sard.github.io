---
title: "静的型付け"
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

## 変数の型

先回の記事で変数について話した。箱、という認識で結局はいいかもしれないという。

さて、プログラミング言語には動的型付けと静的型付けというものがあり、変数に格納するデータの種類を固定させる仕組みがある。

それについて話していこう…

私がよく書くJavaScriptで。

<br>
<br>

まず、変数に格納できるデータはいくつかあることを述べておきたい。

string: 文字列 "hello", "world" などシングル、またはダブルクォートで囲む。

number: 1, 2, 3 など、囲まない。

```javascript
// constはconstantの意味で再代入不可の変数宣言
const greeting = "hello";
const num = 1;
```

日本語変数の良しあしは目をつむっておくとして、

上記コードは文字列という変数にhelloを。数字には1を。そして文字列という変数に数字を格納している。

このときstring用の変数、「文字列」はnumber型に置き換わるのだ。

だが、データを入れる種類を固定しておきたいときが来たときこれでは困る。

別の例がこれだ。

```javascript
// letは再代入可能な変数宣言
let cockroach = "ごきぶり"; // OK
let fruit = "りんご"; // OK

let fruit = cockroach; // Error！
```

フルーツ用の箱にごきぶりを入れる。入ってしまうのだ。

でも入れると困る…

ではどうするか。

静的型付けの言語を動的型付けの言語へ変換しよう。

TypeScriptならそれが可能だ。

## TypeScript

JavaScriptを静的型付けにした言語、それがTypeScript。 マイクロソフトが作ったこの言語で変数に入るデータを制限できるのだ。

TypeScript自体はCDNまたはNode.js(`npm install typescript`)でインストールしておく手間がかかるけれど、その手間に見合う性能を持つ。

```typescript
// `:`を使って変数に入るデータを制限する
let cockroach: "ごきぶり" = "ごきぶり"; // OK
let fruit: "りんご" = "りんご"; // OK

fruit = cockroach; // Error！
```

イメージとしては箱に名前を書いてりんご専用、ごきぶり専用としたといったところか。

型のミスがないかチェックが入った後、JavaScriptへ自動変換してくれる。

制限することでエラーを減らし、何が入るのかわかりやすいため、コードが読みやすくなる。

静的型付けも悪くない、そう思う。
