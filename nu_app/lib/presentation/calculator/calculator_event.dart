import 'package:equatable/equatable.dart';
import 'package:nu_app/presentation/calculator/calculator.dart';

class CalculatorEvent {
  factory CalculatorEvent.number(int number) = NumberEvent._;
  factory CalculatorEvent.toggleSign() = ToggleSignEvent._;
  factory CalculatorEvent.process() = ProcessEvent._;
  factory CalculatorEvent.sum() = SumEvent._;
  factory CalculatorEvent.subtract() = SubtractEvent._;
  factory CalculatorEvent.multiply() = MultiplyEvent._;
  factory CalculatorEvent.divide() = DivideEvent._;
  factory CalculatorEvent.clear() = ClearEvent._;
  factory CalculatorEvent.appendDot() = AppendDotEvent._;
}

class DivideEvent extends OperationEvent {
  DivideEvent._() : super._((v1, v2) => v1 / v2);
}

class MultiplyEvent extends OperationEvent {
  MultiplyEvent._() : super._((v1, v2) => v1 * v2);
}

class AppendDotEvent implements CalculatorEvent {
  const AppendDotEvent._();
}

class NumberEvent extends Equatable implements CalculatorEvent {
  NumberEvent._(this.number);

  final int number;

  @override
  List<Object> get props => [number];
}

class ToggleSignEvent implements CalculatorEvent {
  const ToggleSignEvent._();
}

class SumEvent extends OperationEvent {
  SumEvent._() : super._((v1, v2) => v1 + v2);
}

class SubtractEvent extends OperationEvent {
  SubtractEvent._() : super._((v1, v2) => v1 - v2);
}

class ProcessEvent implements CalculatorEvent {
  const ProcessEvent._();
}

class OperationEvent extends Equatable implements CalculatorEvent {
  OperationEvent._(this.operation);

  final Operation operation;

  @override
  List<Object> get props => [operation];
}

class ClearEvent implements CalculatorEvent {
  ClearEvent._();
}
