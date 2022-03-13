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

  test('test of totalPoint()', () {
    final calculator = ArcheryScoreCalculator();
    // The initial value of the total score is of course 0
    expect(calculator.totalPoint(), 0);
    // Add a single point
    calculator.addPoint('1');
    expect(calculator.totalPoint(), 1);
    calculator.removePoint();
    expect(calculator.totalPoint(), 0);

    // Add X
    calculator.addPoint('X');
    expect(calculator.totalPoint(), 10);
  });

  test('score distribution test', () {
    final calculator = ArcheryScoreCalculator();

    // Add some points
    calculator.addPoint('1');
    calculator.addPoint('X');
    calculator.addPoint('5');

    // Check the score distribution
    expect(calculator.scoreDistribution, [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1]);
  });
}
