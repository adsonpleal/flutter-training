class CalculatorEvent {
  factory CalculatorEvent.number(int number) = NumberEvent._;
  factory CalculatorEvent.toggleSign() = ToggleSignEvent._;
  factory CalculatorEvent.sum() = SumEvent._;
  factory CalculatorEvent.process() = ProcessEvent._;
  factory CalculatorEvent.multiply() = MultiplyEvent._;
  factory CalculatorEvent.divide() = DivideEvent._;
}

class DivideEvent implements CalculatorEvent {
  DivideEvent._();
}

class MultiplyEvent implements CalculatorEvent {
  MultiplyEvent._();
}

class NumberEvent implements CalculatorEvent {
  NumberEvent._(this.number);

  final int number;
}

class ToggleSignEvent implements CalculatorEvent {
  ToggleSignEvent._();
}

class SumEvent implements CalculatorEvent {
  SumEvent._();
}

class ProcessEvent implements CalculatorEvent {
  ProcessEvent._();
}
