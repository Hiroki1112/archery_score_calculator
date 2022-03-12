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
}
