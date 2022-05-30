<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This packages is for building simple bar graphic.

## Features

The height of each bar is going to be calculated based on the max value of the list [values].

## Example

GraphGap(
    widthGraph: 60,
    horizontalSeparation: 20,
    verticalSize: 300,
    horizontalSize: 300,
    titles: const ["January", "February", "March", "April"],
    values: const [
    10,
    30,
    25.3,
    0,
    ],
),
