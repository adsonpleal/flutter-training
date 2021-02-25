import 'package:nu_app/presentation/calculator/calculator.dart';

class CalculatorEvent {
  factory CalculatorEvent.number(int number) = NumberEvent._;
  factory CalculatorEvent.toggleSign() = ToggleSignEvent._;
  factory CalculatorEvent.sum() = SumEvent._;
  factory CalculatorEvent.subtract() = SubtractEvent._;
  factory CalculatorEvent.process() = ProcessEvent._;
  factory CalculatorEvent.multiply() = MultiplyEvent._;
  factory CalculatorEvent.divide() = DivideEvent._;
  factory CalculatorEvent.clear() = ClearEvent._;
}

class DivideEvent extends OperationEvent {
  DivideEvent._() : super._((v1, v2) => v1 / v2);
}

class MultiplyEvent extends OperationEvent {
  MultiplyEvent._() : super._((v1, v2) => v1 * v2);
}

class NumberEvent implements CalculatorEvent {
  NumberEvent._(this.number);

  final int number;
}

class ToggleSignEvent implements CalculatorEvent {
  ToggleSignEvent._();
}

class SumEvent extends OperationEvent {
  SumEvent._() : super._((v1, v2) => v1 + v2);
}

class SubtractEvent extends OperationEvent {
  SubtractEvent._() : super._((v1, v2) => v1 - v2);
}

class ProcessEvent implements CalculatorEvent {
  ProcessEvent._();
}

class OperationEvent implements CalculatorEvent {
  OperationEvent._(this.operation);

  final Operation operation;
}

class ClearEvent implements CalculatorEvent {
  ClearEvent._();
}
