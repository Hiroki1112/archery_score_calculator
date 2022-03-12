library archery_score_calculator;

/// A Calculator for archery.
/// Score is passed as string, and converted to int.
class ArcheryScoreCalculator {
  List<String> _scoreList = [];

  int toPoint(String point) {
    if (point == 'X') {
      return 10;
    } else if (point == 'M') {
      return 0;
    } else {
      return int.parse(point);
    }
  }
}
