import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CalculatorButton extends StatelessWidget {
  CalculatorButton({@required this.title, this.flex = 1});

  final String title;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        child: Text(title),
        onPressed: () {},
        color: Colors.red,
      ),
      flex: flex,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
                CalculatorButton(title: '-'),
              ],
            ),
            Row(
              children: [
                CalculatorButton(title: '1'),
                CalculatorButton(title: '2'),
                CalculatorButton(title: '3'),
                CalculatorButton(title: '+'),
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
