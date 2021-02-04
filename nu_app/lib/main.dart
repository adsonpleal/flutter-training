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
  CalculatorButton({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(child: Text(title), onPressed: () {});
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
                MaterialButton(child: Text('4'), onPressed: _incrementCounter),
                MaterialButton(child: Text('5'), onPressed: _incrementCounter),
                MaterialButton(child: Text('6'), onPressed: _incrementCounter),
                MaterialButton(child: Text('-'), onPressed: _incrementCounter),
              ],
            ),
            Row(
              children: [
                MaterialButton(child: Text('4'), onPressed: _incrementCounter),
                MaterialButton(child: Text('5'), onPressed: _incrementCounter),
                MaterialButton(child: Text('6'), onPressed: _incrementCounter),
                MaterialButton(child: Text('-'), onPressed: _incrementCounter),
              ],
            ),
            Row(
              children: [
                MaterialButton(child: Text('1'), onPressed: _incrementCounter),
                MaterialButton(child: Text('2'), onPressed: _incrementCounter),
                MaterialButton(child: Text('3'), onPressed: _incrementCounter),
                MaterialButton(child: Text('+'), onPressed: _incrementCounter),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
