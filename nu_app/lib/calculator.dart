import 'package:flutter/material.dart';

import 'widgets/calculator_button.dart';
import 'widgets/number_button.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorState createState() => _CalculatorState();
}

typedef Operation = double Function(double, double);

class _CalculatorState extends State<Calculator> {
  double _number1;
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
                CalculatorButton(title: 'AC', onPressed: _allClear),
                CalculatorButton(title: '+/-'),
                CalculatorButton(title: '%'),
                CalculatorButton(title: '/', onPressed: _divide),
              ],
            ),
            Row(
              children: [
                NumberButton(7, onPressed: _appendNumber),
                NumberButton(8, onPressed: _appendNumber),
                NumberButton(9, onPressed: _appendNumber),
                CalculatorButton(title: 'x', onPressed: _multiply),
              ],
            ),
            Row(
              children: [
                NumberButton(4, onPressed: _appendNumber),
                NumberButton(5, onPressed: _appendNumber),
                NumberButton(6, onPressed: _appendNumber),
                CalculatorButton(title: '-', onPressed: _subtract),
              ],
            ),
            Row(
              children: [
                NumberButton(1, onPressed: _appendNumber),
                NumberButton(2, onPressed: _appendNumber),
                NumberButton(3, onPressed: _appendNumber),
                CalculatorButton(
                  title: '+',
                  onPressed: _sum,
                ),
              ],
            ),
            Row(
              children: [
                NumberButton(0, flex: 2, onPressed: _appendNumber),
                CalculatorButton(title: ','),
                CalculatorButton(title: '=', onPressed: _process),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _sum() {
    _operation = (double v1, double v2) => v1 + v2;
    _compute();
  }

  void _subtract() {
    _operation = (double v1, double v2) => v1 - v2;
    _compute();
  }

  void _multiply() {
    _operation = (double v1, double v2) => v1 * v2;
    _compute();
  }

  void _divide() {
    _operation = (double v1, double v2) => v1 * v2;
    _compute();
  }

  void _compute() {
    _number1 = double.parse(_displayText);

    setState(() {
      _displayText = '0';
    });
  }

  void _process() {
    if (_operation != null) {
      final newValue = _operation(_number1, double.parse(_displayText));

      _clearRegisters();

      setState(() {
        _displayText = newValue.toString();
      });
    }
  }

  void _clearRegisters() {
    _number1 = null;
    _operation = null;
  }

  void _allClear() {
    _clearRegisters();

    setState(() {
      _displayText = '0';
    });
  }

  void _appendNumber(int number) {
    setState(() {
      final newNumberStr = _displayText + number.toString();
      final newNumber = double.parse(newNumberStr);

      _displayText = newNumber.toString();
    });
  }
}
