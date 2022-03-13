library archery_score_calculator;

/// A Calculator for archery.
/// Score is passed as string, and converted to int.
/// Always use functions to add and remove scores
class ArcheryScoreCalculator {
  List<String> _pointList = [];
  List<int> scoreDistribution = List.generate(11, (i) => 0);
  int get totalScore => totalPoint();
  int get numsOfArrows => _pointList.length;

  void addPoint(String score, {int index = -1}) {
    if (index == -1) {
      _pointList.add(score);
    } else {
      // Update an existing point.
      int oldPoint = toPoint(_pointList[index]);
      scoreDistribution[oldPoint]--;
      _pointList[index] = score;
    }
    int point = toPoint(score);
    scoreDistribution[point]++;
  }

  void removePoint({int index = -1}) {
    int point = toPoint(_pointList.last);
    scoreDistribution[point]--;
    if (index == -1) {
      _pointList.removeLast();
    } else {
      _pointList.removeAt(index);
    }
  }

  int toPoint(String point) {
    if (point == 'X') {
      return 10;
    } else if (point == 'M') {
      return 0;
    } else {
      try {
        return int.parse(point);
      } catch (e) {
        return 0;
      }
    }
  }

  int totalPoint() {
    return _pointList.fold(
        0, (previousValue, element) => previousValue + toPoint(element));
  }

  List<int> getScorePerEnd() {
    List<int> scorePerEnd = List.generate(6, (i) => 0);
    for (int i = 0; i < _pointList.length; i++) {
      scorePerEnd[i ~/ 6] += toPoint(_pointList[i]);
    }
    return scorePerEnd;
  }

  List<int> getScorePerHalfEnd() {
    List<int> scorePerEnd = List.generate(12, (i) => 0);
    for (int i = 0; i < _pointList.length; i++) {
      scorePerEnd[i ~/ 3] += toPoint(_pointList[i]);
    }
    return scorePerEnd;
  }
}
