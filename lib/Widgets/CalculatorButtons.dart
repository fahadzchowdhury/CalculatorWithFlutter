import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorButton extends StatefulWidget {
  final String ButtonSign;
  const CalculatorButton(this.ButtonSign, {super.key});

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  late String UserInput = "";

  late String result = "";

  late Parser p = Parser();

  late ContextModel cm = ContextModel();

  void ButtonFunction(String ButtonSign) {
    setState(() {
      if (ButtonSign == '=') {
        try {
          Expression expression = p.parse(UserInput);
          double evalResult =
          expression.evaluate(EvaluationType.REAL, cm);

          if (evalResult == evalResult.toInt()) {
            result = evalResult.toInt().toString();
          } else {
            result = evalResult.toStringAsPrecision(10);
          }
        } catch (e) {
          result = 'Error';
        }
        ;
      } else if (ButtonSign == 'C') {
        UserInput = '';
        result = '0';
      } else if (ButtonSign == 'X') {
        if (UserInput.isNotEmpty) {
          UserInput = UserInput.substring(0, UserInput.length - 1);
        }
      } else if (ButtonSign == '%') {
        UserInput = UserInput.replaceAll('%', '');
        double inputNumber = double.tryParse(UserInput) ?? 0;
        double resultValue = inputNumber / 100;
        UserInput = resultValue.toString();
      } else {
        UserInput += ButtonSign;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        Expanded(
            child: TextButton(onPressed: () => ButtonFunction(widget.ButtonSign),
                child: Text(
                  widget.ButtonSign,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                )
            )
        )
      ;
  }
}
