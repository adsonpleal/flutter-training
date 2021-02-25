import 'dart:js';

import 'package:flutter/material.dart';
import 'package:nu_app/presentation/calculator/calculator_bloc.dart';
import 'package:nu_app/presentation/calculator/calculator_event.dart';
import 'package:nu_app/widgets/calculator_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef NumberCallback = void Function(int);

class NumberButton extends Builder {
  NumberButton(int number, {int flex = 1, NumberCallback onPressed})
      : super(
          builder: (context) => CalculatorButton(
            title: number.toString(),
            flex: flex,
            onPressed: () => context
                .read<CalculatorBloc>()
                .add(CalculatorEvent.number(number)),
          ),
        );
}
