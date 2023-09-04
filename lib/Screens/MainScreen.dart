import 'package:calculator/Widgets/CalculatorButtons.dart';
import 'package:calculator/Widgets/CalculatorColumn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color navyBlue = Color(0xff0E2433);
  Color buttonColor = Color(0xff0B344F);
  Color lightBlue = Color(0xff296D98);

  String UserInput = "";
  String result = "0";
  Parser p = Parser();
  ContextModel cm = ContextModel();


  void ButtonFunction(String buttonPress) {
    setState(() {
      if (buttonPress == '=') {
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
      } else if (buttonPress == 'c') {
        UserInput = '';
        result = '00';
      } else if (buttonPress == 'X') {
        if (UserInput.isNotEmpty) {
          UserInput = UserInput.substring(0, UserInput.length - 1);
        }
      } else if (buttonPress == '%') {
        UserInput = UserInput.replaceAll('%', '');
        double inputNumber = double.tryParse(UserInput) ?? 0;
        double resultValue = inputNumber / 100;
        UserInput = resultValue.toString();
      } else {
        UserInput += buttonPress;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculator",
        style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w700)),
        backgroundColor: navyBlue,
      ),

      body: Column(
        children: [
          Expanded(
              child: Container(
                color: navyBlue,
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          UserInput, style: TextStyle(color: Colors.white, fontSize: 28),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(result, style: TextStyle(color: Colors.white, fontSize: 35),)
                      ],
                    )
                  ],
                ),
              )
          ),
          Expanded(
              child: Container(
                color: buttonColor,
                child: Row(
                  children: [
                    Expanded(child: Column(
                      children: [
                        CalculatorButton("v"),
                        CalculatorButton("("),
                        CalculatorButton("1"),
                        CalculatorButton("4"),
                        CalculatorButton("7"),
                        CalculatorButton("0")
                      ],
                    )
                    ),
                    Expanded(child: Column(
                      children: [
                        CalculatorButton("c"),
                        CalculatorButton(")"),
                        CalculatorButton("2"),
                        CalculatorButton("5"),
                        CalculatorButton("8"),
                        CalculatorButton("00")
                      ],
                    )
                    ),
                    Expanded(child: Column(
                      children: [
                        CalculatorButton("x"),
                        CalculatorButton("%"),
                        CalculatorButton("3"),
                        CalculatorButton("6"),
                        CalculatorButton("9"),
                        CalculatorButton(".")
                      ],
                    )
                    ),
                    Expanded(child: Column(
                      children: [
                        LastColumn("/", flexNumber: 1),
                        LastColumn("*", flexNumber: 1),
                        LastColumn("-", flexNumber: 1),
                        LastColumn("+", flexNumber: 1),
                        Expanded(
                          flex: 2,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(lightBlue),
                                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                                )
                              ),
                                onPressed: () => ButtonFunction("="),
                                child: Text("=", style: TextStyle(fontSize: 20, color: Colors.white),),
                            )
                        )
                      ],
                    ))
                  ],
                )


                  // ],
                ),
              )
        ],
      ),
    );
  }
}
