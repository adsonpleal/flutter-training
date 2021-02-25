import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../extensions/double_extension.dart';
import 'calculator_event.dart';

typedef Operation = double Function(double, double);

const _initialValue = '0';

class CalculatorBloc extends Bloc<CalculatorEvent, String> {
  CalculatorBloc() : super(_initialValue);

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

    if (event is ClearEvent) {
      yield clear();
    }

    if (event is OperationEvent) {
      operation = event.operation;
      yield _compute();
    }

    if (event is AppendDotEvent) {
      yield _appendDot();
    }
  }

  String _appendDot() {
    if (!state.contains('.')) {
      return state + '.';
    }
    return state;
  }

  String clear() {
    return _initialValue;
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

  String _compute() {
    bufferizedNumber = double.parse(state);
    return _initialValue;
  }
}
