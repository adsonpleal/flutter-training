class CalculatorEvent {
  factory CalculatorEvent.number(int number) = NumberEvent._;
  factory CalculatorEvent.toggleSign() = ToggleSignEvent._;
  factory CalculatorEvent.sum() = SumEvent._;
  factory CalculatorEvent.process() = ProcessEvent._;
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
