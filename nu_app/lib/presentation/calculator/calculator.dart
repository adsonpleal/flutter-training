import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nu_app/presentation/calculator/calculator_event.dart';

import '../../widgets/calculator_button.dart';
import '../../widgets/number_button.dart';
import 'calculator_bloc.dart';

typedef Operation = double Function(double, double);

class Calculator extends StatelessWidget {
  Calculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<CalculatorBloc, String>(
                  builder: (context, state) => Text(
                    '$state',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CalculatorButton(
                  title: 'AC',
                  onPressed: context.addEvent(CalculatorEvent.clear()),
                  flex: 2,
                ),
                CalculatorButton(
                  title: '+/-',
                  onPressed: context.addEvent(CalculatorEvent.toggleSign()),
                ),
                CalculatorButton(
                  title: '/',
                  onPressed: context.addEvent(CalculatorEvent.divide()),
                ),
              ],
            ),
            Row(
              children: [
                NumberButton(7),
                NumberButton(8),
                NumberButton(9),
                CalculatorButton(
                  title: 'x',
                  onPressed: context.addEvent(CalculatorEvent.multiply()),
                ),
              ],
            ),
            Row(
              children: [
                NumberButton(4),
                NumberButton(5),
                NumberButton(6),
                CalculatorButton(
                  title: '-',
                  onPressed: context.addEvent(CalculatorEvent.subtract()),
                ),
              ],
            ),
            Row(
              children: [
                NumberButton(1),
                NumberButton(2),
                NumberButton(3),
                CalculatorButton(
                  title: '+',
                  onPressed: context.addEvent(CalculatorEvent.sum()),
                ),
              ],
            ),
            Row(
              children: [
                NumberButton(0, flex: 2),
                CalculatorButton(
                  title: '.',
                  onPressed: context.addEvent(CalculatorEvent.appendDot()),
                ),
                CalculatorButton(
                  title: '=',
                  onPressed: context.addEvent(CalculatorEvent.process()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on BuildContext {
  VoidCallback addEvent(CalculatorEvent event) {
    return () => read<CalculatorBloc>().add(event);
  }
}
