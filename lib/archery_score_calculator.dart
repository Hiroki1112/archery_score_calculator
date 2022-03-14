library archery_score_calculator;

/// A Calculator for archery.
/// Author: Hiroki Iwashita
/// Released under the MIT license

class ArcheryScoreCalculator {
  // ignore: constant_identifier_names
  static const ALLOWED_INPUTS = [
    'M',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'X',
  ];
  List<String> _pointList = [];
  List<int> scoreDistribution = List.generate(11, (i) => 0);
  int get totalScore => totalPoint();
  int get numsOfArrows => _pointList.length;

  /// constructor.
  ArcheryScoreCalculator({List<String>? pointList}) {
    if (pointList != null) {
      _pointList = pointList.map((point) => validateInput(point)).toList();
      for (var p in _pointList) {
        int point = toPoint(p);
        scoreDistribution[point]++;
      }
    }
  }

  /// Add a point to the list.
  /// [point] is a string of the form "X".
  /// [point] must be in the range of [0, 10] or "X" or "M".
  /// If [point] is invalid, this method converts it to "0".
  void addPoint(String point, {int index = -1}) {
    if (index == -1) {
      _pointList.add(point);
    } else {
      // Update an existing point.
      int oldPoint = toPoint(_pointList[index]);
      scoreDistribution[oldPoint]--;
      _pointList[index] = point;
    }
    int pointInt = toPoint(point);
    scoreDistribution[pointInt]++;
  }

  /// Remove a point from the list.
  /// [index] is the index of the point to be removed.
  /// If [index] isn't passed, the last point is removed.
  void removePoint({int index = -1}) {
    int point = toPoint(_pointList.last);
    scoreDistribution[point]--;
    if (index == -1) {
      _pointList.removeLast();
    } else {
      _pointList.removeAt(index);
    }
  }

  /// Convert string to point.
  /// [point] must be in the range of [0, 10] or "X" or "M".
  /// If [point] is invalid, this method converts it to "0".
  int toPoint(String point) {
    point = validateInput(point);
    if (point == 'X') {
      return 10;
    } else if (point == 'M') {
      return 0;
    } else {
      return int.parse(point);
    }
  }

  /// Get the total point.
  int totalPoint() {
    return _pointList.fold(
        0, (previousValue, element) => previousValue + toPoint(element));
  }

  /// Get point per end.(Sum of 6 arrows)
  List<int> getScorePerEnd() {
    List<int> scorePerEnd = List.generate(6, (i) => 0);
    for (int i = 0; i < _pointList.length; i++) {
      scorePerEnd[i ~/ 6] += toPoint(_pointList[i]);
    }
    return scorePerEnd;
  }

  /// Get point per half end.(Sum of 3 arrows)
  List<int> getScorePerHalfEnd() {
    List<int> scorePerEnd = List.generate(12, (i) => 0);
    for (int i = 0; i < _pointList.length; i++) {
      scorePerEnd[i ~/ 3] += toPoint(_pointList[i]);
    }
    return scorePerEnd;
  }

  /// Validate inputs.
  /// [input] must be in the range of [0, 10] or "X" or "M".(Defined in [ALLOWED_INPUTS])
  /// If [input] is invalid, this method returns "M".
  /// If [input] is valid, this method returns [input].
  String validateInput(String input) {
    if (!ALLOWED_INPUTS.contains(input)) {
      // throw ArgumentError('Invalid input: $input');
      return "M";
    }
    return input;
  }
}
