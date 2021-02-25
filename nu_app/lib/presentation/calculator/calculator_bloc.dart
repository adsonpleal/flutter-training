import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../extensions/double_extension.dart';
import 'calculator_event.dart';

typedef Operation = double Function(double, double);

class CalculatorBloc extends Bloc<CalculatorEvent, String> {
  CalculatorBloc() : super('0');

  double bufferizedNumber = 0;
  Operation operation;

  @visibleForTesting
  CalculatorBloc.test(String initialState) : super(initialState);

  @override
  Stream<String> mapEventToState(CalculatorEvent event) async* {
    if (event is NumberEvent) {
      yield appendNumber(event.number);
    }

    if (event is ToggleSignEvent) {
      yield toggleSign();
    }

    if (event is ProcessEvent) {
      yield process();
    }

    if (event is SumEvent) {
      yield sum();
    }
    if (event is MultiplyEvent) {
      yield multiply();
    }
    if (event is DivideEvent) {
      yield divide();
    }
  }

  String process() {
    return operation(bufferizedNumber, double.parse(state)).asDisplayString;
  }

  String appendNumber(int number) {
    final newNumberStr = state + number.toString();
    final newNumber = double.parse(newNumberStr);

    return newNumber.asDisplayString;
  }

  String toggleSign() {
    final newNumber = double.parse(state) * -1;
    return newNumber.asDisplayString;
  }

  String sum() {
    operation = (v1, v2) => v1 + v2;
    return _compute();
  }

  String multiply() {
    operation = (v1, v2) => v1 * v2;
    return _compute();
  }

  String divide() {
    operation = (v1, v2) => v1 / v2;
    return _compute();
  }

  String _compute() {
    bufferizedNumber = double.parse(state);
    return '0';
  }
}
