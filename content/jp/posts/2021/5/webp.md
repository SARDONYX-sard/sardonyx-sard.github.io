---

title: "jpgからwebpへ"
date: "2021-05-05"
lastmod: "2021-12-15"
toc: true
tags:
  - webp
  - lighthouse
  - performance
categories:
  - programming, Performance
---

## なぜwebpをつかうのか

現在Udemyで、PHPの講座を受講しているのだけれど、そこでwebp拡張子の存在を知った。

どうやらGoogleが作った拡張子らしく、**可逆圧縮**かつ **アルファ値（透明度）** を持ったまま画像を圧縮できるようだ。

## ネットから拾った無料画像サンプル

- ネットから拾った無料画像をwebpに変換してみる
- 今回使うサンプル画像は以下。昔ブログで使っていた画像で、今後もいつか使うかもしれない。
- (以下に掲載されている画像はwebp変換済みのもの)

<br/>

- daffodils ![daffodils](/images/samples/webp/daffodils.webp)
- kissingSpring ![kissingSpring](/images/samples/webp/kissingSpring.webp)
- orangeFlower ![orangeFlower](/images/samples/webp/orangeFlower.webp)
- springFlower ![springFlower](/images/samples/webp/springFlower.webp)
- threeCuteChicks ![threeCuteChicks](/images/samples/webp/threeCuteChicks.webp)

## 試行結果

例：324KBのjpgがその30%の110KBに圧縮された。

|     ホーム画像名      | jpgサイズ | webpサイズ | 圧縮率  |
| :-------------: | -----: | ------: | :--: |
|    daffodils    | 324 KB |  110 KB | 30%  |
|  kissingSpring  | 874 KB |  537 KB | 61%  |
|  orangeFlower   | 421 KB | 73.7 KB | 18%  |
|  springFlower   | 532 KB |  566 KB | 106% |
| threeCuteChicks | 333 KB |  124 KB | 37%  |

旧ブログのLightHouseによる計測：

![light-house2021-05-05](/images/light-house/light-house2021-05-05.webp)

## おわりに

- 1つの画像だけサイズが微増したこと以外は、大幅に圧縮がなされる結果となった。
- パフォーマンススコアが70ぐらいだった旧ブログが97まで上昇した。
- 画像読み込みも体感1.5倍ぐらい速くなった。

画像を保存するときWebpだと少々使いづらいのでその辺はまた調整する必要があるけれど、読み込みの速さを考慮すればWebpの選択肢は大いにあると思う。
