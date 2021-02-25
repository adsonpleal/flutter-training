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
    'should sum a number on sum event',
    build: () => CalculatorBloc.test('1000'),
    act: (bloc) {
      bloc.add(CalculatorEvent.sum());
      bloc.add(CalculatorEvent.number(1));
      bloc.add(CalculatorEvent.process());
    },
    expect: ['0', '1', '1001'],
  );

  blocTest(
    'should multiply a number on multiply event',
    build: () => CalculatorBloc.test('1000'),
    act: (bloc) {
      bloc.add(CalculatorEvent.multiply());
      bloc.add(CalculatorEvent.number(2));
      bloc.add(CalculatorEvent.process());
    },
    expect: ['0', '2', '2000'],
  );

  blocTest(
    'should divide a number on divide event',
    build: () => CalculatorBloc.test('1000'),
    act: (bloc) {
      bloc.add(CalculatorEvent.divide());
      bloc.add(CalculatorEvent.number(2));
      bloc.add(CalculatorEvent.process());
    },
    expect: ['0', '2', '500'],
  );

    blocTest(
    'should subtract a number on subtract event',
    build: () => CalculatorBloc.test('100'),
    act: (bloc) {
      bloc.add(CalculatorEvent.subtract());
      bloc.add(CalculatorEvent.number(5));
      bloc.add(CalculatorEvent.number(0));
      bloc.add(CalculatorEvent.process());
    },
    expect: ['0', '5', '50' '50'],
  );
}
