import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nu_app/presentation/calculator/calculator_bloc.dart';
import 'package:nu_app/presentation/calculator/calculator_event.dart';

void main() {
  blocTest(
    'should append numbers on number event',
    build: () => CalculatorBloc(),
    act: (bloc) {
      bloc.add(CalculatorEvent.number(1));
      bloc.add(CalculatorEvent.number(2));
      bloc.add(CalculatorEvent.number(6));
      bloc.add(CalculatorEvent.number(1));
      bloc.add(CalculatorEvent.number(7));
    },
    expect: ['1', '12', '126', '1261', '12617'],
  );

  test('initial state should be 0', () {
    expect(CalculatorBloc().state, '0');
  });

  blocTest(
    'should toggle sign',
    build: () => CalculatorBloc.test('1000'),
    act: (bloc) {
      bloc.add(CalculatorEvent.toggleSign());
      bloc.add(CalculatorEvent.toggleSign());
    },
    expect: ['-1000', '1000'],
  );

    blocTest(
    'should sum a number on number event',
    build: () => CalculatorBloc.test('1000'),
    act: (bloc) {
      bloc.add(CalculatorEvent.sum());
      bloc.add(CalculatorEvent.number(1));
      bloc.add(CalculatorEvent.process());
    },
    expect: ['0', '1', '1001'],
  );
}
