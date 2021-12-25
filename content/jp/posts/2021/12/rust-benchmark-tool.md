---
title: "Rustで書かれたベンチマークツール hyperfineの紹介"
description: "Rustで書かれたベンチマークツール、hyperfineを試用"
featuredImage: https://camo.githubusercontent.com/88a0cb35f42e02e28b0433d4b5e0029e52e723d8feb8df753e1ed06a5161db56/68747470733a2f2f692e696d6775722e636f6d2f7a31394f5978452e676966
date: "2021-12-15"
lastmod: "2021-12-25"
toc: true
tags:
  - rust
  - benchmark
categories:
  - programming, Performance
series:
  - "Rustを楽しもう"
draft: false
---

## はじめに

[scoop-search](https://github.com/shilangyu/scoop-search)というscoopのツール検索の高速化を図るライブラリを見つけた時、readmeに書いてあったベンチマークツールに目が留まりました。

それがこちら、hyperfineです。

- hyperfine: <https://github.com/sharkdp/hyperfine>

<br/>

なお、PowerShellユーザーということもあり今回はscoopでインストールしました。

```powerShell
scoop install hyperfine
```

## lsdとcoreutils lsの速度比較検証

- ではサンプルとして、[lsd](https://github.com/Peltoche/lsd)と[coreutils](https://github.com/uutils/coreutils)の`ls`の2つの速度を計測してみましょう。

```powerShell
hyperfine --warmup 3 'lsd' 'coreutils ls'
```

<br/>

すると結果は以下のようになりました。

![hyperfine](/images/programming/rust/hyperfine.webp)

coreutils ls の方が lsdよりも3.41 ± 0.16倍速い結果となりました。

lsdはアイコンおよびcolorが有効である分の遅延でしょう。

以上便利ベンチマークコマンドでした。
