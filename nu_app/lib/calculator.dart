import 'package:flutter/material.dart';

import 'widgets/calculator_button.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _displayText = 0;

  void _incrementCounter() {
    setState(() {
      _displayText++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _displayText--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                CalculatorButton(title: '7'),
                CalculatorButton(title: '8'),
                CalculatorButton(title: '9'),
                CalculatorButton(title: 'x'),
              ],
            ),
            Row(
              children: [
                CalculatorButton(title: '4'),
                CalculatorButton(title: '5'),
                CalculatorButton(title: '6'),
                CalculatorButton(title: '-', onPressed: _decrementCounter),
              ],
            ),
            Row(
              children: [
                CalculatorButton(title: '1'),
                CalculatorButton(title: '2'),
                CalculatorButton(title: '3'),
                CalculatorButton(title: '+', onPressed: _incrementCounter),
              ],
            ),
            Row(
              children: [
                CalculatorButton(title: '0', flex: 2),
                CalculatorButton(title: ','),
                CalculatorButton(title: '='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
