import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nu_app/presentation/calculator/calculator.dart';
import 'package:nu_app/presentation/calculator/calculator_bloc.dart';
import 'package:nu_app/presentation/calculator/calculator_event.dart';

class CalculatorBlocMock extends Mock implements CalculatorBloc {}

void main() {
  // ignore: close_sinks
  CalculatorBloc bloc;
  StreamController<String> controller;

  setUp(() {
    bloc = CalculatorBlocMock();
    controller = StreamController<String>();
    whenListen(bloc, controller.stream);
  });

  tearDown(() {
    controller.close();
  });

  Future<void> addState(WidgetTester tester, String newState) async {
    controller.add(newState);
    await tester.pump();
  }

  Future<void> startWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: bloc,
            child: Calculator(),
          ),
        ),
      ),
    );
  }

  Future pressNumberButton(WidgetTester tester, CalculatorBloc bloc, int number) async {
    await tester.tap(find.text(number.toString()));

    verify(bloc.add(CalculatorEvent.number(number))).called(1);
 }

  testWidgets('calculator should have only one elem for each number from 0 to 9', (tester) async {
    await startWidget(tester);

    for(final elem in Iterable<int>.generate(9)) {
      expect(find.text(elem.toString()), findsOneWidget);
    }
  });

  testWidgets('on all numbers from 0 to 9 click should add number event to bloc', (tester) async {
    await startWidget(tester);

    for(final elem in Iterable<int>.generate(9)) {
      await pressNumberButton(tester, bloc, elem);
    }
  });

  group('Operation taps', () {
    testWidgets('on a + click, should add a SumEvent to bloc', (tester) async {
      await startWidget(tester);

      await tester.tap(find.text('+'));

      verify(bloc.add(argThat(isA<SumEvent>()))).called(1);
    });

    testWidgets('on a - click, should add a SubtractEvent to bloc', (tester) async {
      await startWidget(tester);

      await tester.tap(find.text('-'));

      verify(bloc.add(argThat(isA<SubtractEvent>()))).called(1);
    });

    testWidgets('on a x click, should add a MultiplyEvent to bloc', (tester) async {
      await startWidget(tester);

      await tester.tap(find.text('x'));

      verify(bloc.add(argThat(isA<MultiplyEvent>()))).called(1);
    });
  });

  testWidgets(
    'when there is a state it should show on the screen',
    (tester) async {
      when(bloc.state).thenReturn('1000');

      await startWidget(tester);
      expect(find.text('1000'), findsOneWidget);
      await addState(tester, '5555');
      expect(find.text('5555'), findsOneWidget);
    },
  );
}

