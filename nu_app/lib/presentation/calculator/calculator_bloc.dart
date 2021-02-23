import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../extensions/double_extension.dart';

class CalculatorEvent {
  CalculatorEvent();

  factory CalculatorEvent.number(int number) = NumberEvent._;
}

class NumberEvent extends CalculatorEvent {
  NumberEvent._(this.number);

  final int number;
}

class CalculatorBloc extends Bloc<CalculatorEvent, String> {

  CalculatorBloc() : super('0');

  @visibleForTesting
  CalculatorBloc.test(String initialState) : super(initialState);

  @override
  Stream<String> mapEventToState(CalculatorEvent event) async* {
    if(event is NumberEvent) {
      final newNumberStr = state + event.number.toString();
      final newNumber = double.parse(newNumberStr);

      yield newNumber.asDisplayString;
    }
  }
}
