import 'package:flutter/material.dart';

import 'widgets/calculator_button.dart';
import 'widgets/number_button.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorState createState() => _CalculatorState();
}

typedef Operation = int Function(int, int);

class _CalculatorState extends State<Calculator> {
  int _number1;
  int _number2;
  Operation _operation;

  String _displayText = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$_displayText',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            Row(
              children: [
                CalculatorButton(title: 'AC'),
                CalculatorButton(title: '+/-'),
                CalculatorButton(title: '%'),
                CalculatorButton(title: '/'),
              ],
            ),
            Row(
              children: [
                NumberButton(7, onPressed: appendNumber),
                NumberButton(8, onPressed: appendNumber),
                NumberButton(9, onPressed: appendNumber),
                CalculatorButton(title: 'x'),
              ],
            ),
            Row(
              children: [
                NumberButton(4, onPressed: appendNumber),
                NumberButton(5, onPressed: appendNumber),
                NumberButton(6, onPressed: appendNumber),
                CalculatorButton(title: '-', onPressed: () {}),
              ],
            ),
            Row(
              children: [
                NumberButton(1, onPressed: appendNumber),
                NumberButton(2, onPressed: appendNumber),
                NumberButton(3, onPressed: appendNumber),
                CalculatorButton(title: '+'),
              ],
            ),
            Row(
              children: [
                NumberButton(0, flex: 2, onPressed: appendNumber),
                CalculatorButton(title: ','),
                CalculatorButton(title: '='),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void appendNumber(int number) {
    setState(() {
      final newNumberStr = _displayText + number.toString();
      final newNumber = int.parse(newNumberStr);

      _displayText = newNumber.toString();
    });
  }

}
