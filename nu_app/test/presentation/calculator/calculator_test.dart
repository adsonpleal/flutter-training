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

  testWidgets('calculator should have only one 0', (tester) async {
    await startWidget(tester);

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('on 0 click should add number event to bloc', (tester) async {
    await startWidget(tester);

    await tester.tap(find.text('0'));

    verify(bloc.add(CalculatorEvent.number(0))).called(1);
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
