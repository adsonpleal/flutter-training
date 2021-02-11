import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton({@required this.title, this.flex = 1});

  final String title;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        padding: EdgeInsets.all(30),
        color: Colors.deepPurpleAccent,
        shape: Border.all(
          color: Colors.deepPurple,
        ),
        onPressed: () {},
      ),
      flex: flex,
    );
  }
}
