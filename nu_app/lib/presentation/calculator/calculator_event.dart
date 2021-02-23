class CalculatorEvent {
  factory CalculatorEvent.number(int number) = NumberEvent._;
  factory CalculatorEvent.toggleSign() = ToggleSignEvent._;
}

class NumberEvent implements CalculatorEvent {
  NumberEvent._(this.number);

  final int number;
}

class ToggleSignEvent implements CalculatorEvent {
  ToggleSignEvent._();
}
