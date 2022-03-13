import 'package:flutter_test/flutter_test.dart';

import 'package:archery_score_calculator/archery_score_calculator.dart';

void main() {
  test('test of toPoint()', () {
    final calculator = ArcheryScoreCalculator();
    expect(calculator.toPoint('0'), 0);
    expect(calculator.toPoint('1'), 1);
    expect(calculator.toPoint('2'), 2);
    expect(calculator.toPoint('3'), 3);
    expect(calculator.toPoint('4'), 4);
    expect(calculator.toPoint('5'), 5);
    expect(calculator.toPoint('6'), 6);
    expect(calculator.toPoint('7'), 7);
    expect(calculator.toPoint('8'), 8);
    expect(calculator.toPoint('9'), 9);
    expect(calculator.toPoint('10'), 10);
    expect(calculator.toPoint('X'), 10);
    expect(calculator.toPoint('M'), 0);
  });

  test('test of addPoint()', () {
    final calculator = ArcheryScoreCalculator();

    // Add some points
    calculator.addPoint('1');
    calculator.addPoint('X');
    calculator.addPoint('5');

    // Check total score
    expect(calculator.totalScore, 16);

    // update existing score
    calculator.addPoint('X', index: 0);
    expect(calculator.totalScore, 25);

    // update existing score
    calculator.addPoint('X', index: 2);
    expect(calculator.totalScore, 30);
  });

  test('test of removePoint()', () {
    final calculator = ArcheryScoreCalculator();

    // Add some points
    calculator.addPoint('1');
    calculator.addPoint('X');
    calculator.addPoint('M');
    calculator.addPoint('5');

    // Check total score
    expect(calculator.totalScore, 16);

    // Calling removePoint() with no arguments(Removed from the end)
    calculator.removePoint();
    expect(calculator.totalScore, 11);

    // Calling removePoint() with index arguments
    // (The points of the specified index are deleted.)
    calculator.removePoint(index: 1);
    expect(calculator.totalScore, 1);

    // remove existing score
    calculator.removePoint(index: 1);
    expect(calculator.totalScore, 1);
  });

  test('test of totalPoint()', () {
    final calculator = ArcheryScoreCalculator();
    // The initial value of the total score is of course 0
    expect(calculator.totalPoint(), 0);
    // Add a single point without no arguments
    calculator.addPoint('1');
    expect(calculator.totalPoint(), 1);
    calculator.removePoint();
    expect(calculator.totalPoint(), 0);
    calculator.addPoint('X');
    expect(calculator.totalPoint(), 10);

    // Add a single point with index argument
    calculator.addPoint('1', index: 0);
    expect(calculator.totalPoint(), 1);
    calculator.addPoint('X');
    expect(calculator.totalPoint(), 11);
    calculator.removePoint(index: 0);
    expect(calculator.totalPoint(), 10);
  });

  test('test of getScorePerEnd()', () {
    final calculator = ArcheryScoreCalculator();
    // The initial value of the total score is of course 0
    expect(calculator.getScorePerEnd(), [0, 0, 0, 0, 0, 0]);
    // Add a single point without no arguments
    calculator.addPoint('1');
    expect(calculator.getScorePerEnd(), [1, 0, 0, 0, 0, 0]);
    calculator.addPoint('X');
    expect(calculator.getScorePerEnd(), [11, 0, 0, 0, 0, 0]);

    calculator.addPoint('10');
    calculator.addPoint('10');
    calculator.addPoint('10');
    calculator.addPoint('10');
    calculator.addPoint('10');
    expect(calculator.getScorePerEnd(), [51, 10, 0, 0, 0, 0]);

    calculator.removePoint();
    expect(calculator.getScorePerEnd(), [51, 0, 0, 0, 0, 0]);
  });

  test('score distribution test', () {
    final calculator = ArcheryScoreCalculator();

    // Add some points
    calculator.addPoint('1');
    calculator.addPoint('X');
    calculator.addPoint('5');

    // Check the score distribution
    expect(calculator.scoreDistribution, [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1]);

    // Add some points
    calculator.addPoint('1', index: 0);
    calculator.addPoint('X', index: 1);
    calculator.addPoint('M', index: 2);

    // Check the score distribution
    expect(calculator.scoreDistribution, [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1]);
  });

  test('nums of arrows test', () {
    final calculator = ArcheryScoreCalculator();

    // Add some points
    calculator.addPoint('1');
    calculator.addPoint('X');
    calculator.addPoint('5');

    // Check the number of arrows
    expect(calculator.numsOfArrows, 3);

    // Update some points
    calculator.addPoint('1', index: 0);

    // Check the number of arrows
    expect(calculator.numsOfArrows, 3);

    // remove some points
    calculator.removePoint();
    expect(calculator.numsOfArrows, 2);
  });
}
