import 'package:nu_app/widgets/calculator_button.dart';

typedef NumberCallback = void Function(int);

class NumberButton extends CalculatorButton {
  NumberButton(
    int number, {
    int flex = 1,
    NumberCallback onPressed,
  }) : super(
          title: number.toString(),
          flex: flex,
          onPressed: () => onPressed(number),
        );
}
