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
                CalculatorButton(title: 'AC', onPressed: _allClear),
                CalculatorButton(title: '+/-'),
                CalculatorButton(title: '%'),
                CalculatorButton(title: '/'),
              ],
            ),
            Row(
              children: [
                NumberButton(7, onPressed: _appendNumber),
                NumberButton(8, onPressed: _appendNumber),
                NumberButton(9, onPressed: _appendNumber),
                CalculatorButton(title: 'x'),
              ],
            ),
            Row(
              children: [
                NumberButton(4, onPressed: _appendNumber),
                NumberButton(5, onPressed: _appendNumber),
                NumberButton(6, onPressed: _appendNumber),
                CalculatorButton(title: '-', onPressed: () {}),
              ],
            ),
            Row(
              children: [
                NumberButton(1, onPressed: _appendNumber),
                NumberButton(2, onPressed: _appendNumber),
                NumberButton(3, onPressed: _appendNumber),
                CalculatorButton(title: '+', onPressed: _sum,),
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
    _operation = (int v1,int v2) => v1 + v2;
    _number1 = int.parse(_displayText);

    setState(() {
        _displayText = '0';
    });
  }

  void _process() {
    if (_operation != null) {
      final newValue = _operation(_number1, int.parse(_displayText));

      _clearRegisters();

      setState(() {
          _displayText = newValue.toString();
      });
    }
  }

  void _clearRegisters() {
    _number1 = null;
    _number2 = null;
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
      final newNumber = int.parse(newNumberStr);

      _displayText = newNumber.toString();
    });
  }

}
