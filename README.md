🚧[WIP]This package provides archery score calculation.This project is ongoing.

# Features

If you pass scores as a string, it will calculate the total score, number of X's, subtotal points per end, etc.

# 🚀Getting started

Open pubspec.yml and add the following to dependencies

```yml
dependencies:
  archery_score_calculator: any
```

```dart
import 'package:archery_score_calculator/archery_score_calculator.dart';

var calculator = ArcheryScoreCalculator();
```

# Score calculation in archery

In archery, points are assigned according to the distance from the center of the target, ranging from X, 10 to 1, M.
X is the number of arrows that hit the target in a circle further inside the 10-point circle, and is used to determine rank in the event of a tie.

M stands for "Missing", meaning that the arrow did not hit the target. (There are various theories).

According to the rules used in the Olympics, the total score of 36 shots is used to determine the ranking.

For more detailed information, please visit the official World Archery website.

# Usage

```dart
final calculator = ArcheryScoreCalculator();
calculator.addPoint('X');
calculator.addPoint('M');
print(calculator.totalScore)//10
```

## Additional information

This package is under development.🔨 Please note that specifications are subject to change at short notice.
