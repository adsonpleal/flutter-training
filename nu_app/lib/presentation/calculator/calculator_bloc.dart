import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../extensions/double_extension.dart';
import 'calculator_event.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, String> {
  CalculatorBloc() : super('0');

  double bufferizedNumber = 0;

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

    if (event is SumEvent) {
      yield sum();
    }

    if (event is ProcessEvent) {
      yield process();
    }
  }

  String process() {
    return (bufferizedNumber + double.parse(state)).asDisplayString;
  }

  String sum() {
    bufferizedNumber = double.parse(state);
    return '0';
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
}
