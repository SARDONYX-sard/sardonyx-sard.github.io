---

title: "From jpg to webp"
date: "2021-05-05"
lastmod: "2021-12-15"
tags:
  - webp
  - lighthouse
  - performance
categories:
  - programming, Performance
---

## Why do we use webp?

I'm currently taking a PHP course at Udemy, where I learned about the webp
extension.

It seems to be an extension created by Google that can compress images with
**reversible compression** and **alpha (transparency)**.

## Free image samples from the Internet

- Try to convert a free image from the net to webp
- The following is a sample image I'll be using. These are images that I used in
  my blog in the past, and may use in the future.
- (The images shown below are webp converted images)

<br/>

- daffodils ![daffodils](/images/samples/webp/daffodils.webp)
- kissingSpring ![kissingSpring](/images/samples/webp/kissingSpring.webp)
- orangeFlower ![orangeFlower](/images/samples/webp/orangeFlower.webp)
- springFlower ![springFlower](/images/samples/webp/springFlower.webp)
- threeCuteChicks ![threeCuteChicks](/images/samples/webp/threeCuteChicks.webp)

## Trial results

Example: A 324KB jpg is now compressed to 110KB, 30% of its original size.

|         home image name          | jpg size | webp size | compression ratio |
| :------------------------------: | -------: | --------: | :---------------: |
|            daffodils             |   324 KB |    110 KB |        30%        |
|          kissingSpring           |   874 KB |    537 KB |        61%        |
|           orangeFlower           |   421 KB |   73.7 KB |        18%        |
| I'm not sure what to do with it. |          |           |                   |
|         threeCuteChicks          |   333 KB |    124 KB |        37%        |

Measurements by LightHouse on the old blog:

![light-house2021-05-05](/images/light-house/light-house2021-05-05.webp)

## Conclusion

- Except for one image that slightly increased in size, the result was a
  significant compression.
- The old blog, which had a performance score of about 70, went up to 97.
- Image loading also became about 1.5 times faster.

Webp is a little difficult to use when saving images, so I need to make some
adjustments in that area, but considering the speed of loading, I think Webp is
a great option.
