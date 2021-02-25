import 'package:flutter_test/flutter_test.dart';
import 'package:nu_app/presentation/calculator/calculator.dart';
import 'package:nu_app/presentation/calculator/calculator_event.dart';

void main() {
  test(
    'sum, multiply and divide should be an OperationEvent and have a operation',
    () {
      _expectOperationEvent(CalculatorEvent.divide());
      _expectOperationEvent(CalculatorEvent.sum());
      _expectOperationEvent(CalculatorEvent.multiply());
    },
  );
}

void _expectOperationEvent(dynamic event) {
  expect(event, isA(OperationEvent));
  expect(event.operation, isA(Operation));
}
