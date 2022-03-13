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

🚧[WIP]This package provides archery score calculation.This project is ongoing.

## Features

If you pass scores as a string, it will calculate the total score, number of X's, subtotal points per end, etc.

## 🚀Getting started

Open pubspec.yml and add the following to dependencies

```yml
dependencies:
  archery_score_calculator: any
```

```dart
import 'package:archery_score_calculator/archery_score_calculator.dart';

var calculator = ArcheryScoreCalculator();
```

## Usage

```dart
final calculator = ArcheryScoreCalculator();
calculator.addPoint('X');
calculator.addPoint('M');
print(calculator.totalScore)//10
```

## Additional information

This package is under development.🔨 Please note that specifications are subject to change at short notice.
