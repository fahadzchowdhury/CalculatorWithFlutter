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
                        Expanded(
                    child: TextButton(onPressed: () => ButtonFunction("v"),
                        child: Text(
                          "v",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        )
                    )
                ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("("),
                                child: Text(
                                  "(",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("1"),
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("4"),
                                child: Text(
                                  "4",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("7"),
                                child: Text(
                                  "7",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("0"),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        )
                      ],
                    )
                    ),
                    Expanded(child: Column(
                      children: [
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("c"),
                                child: Text(
                                  "c",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction(")"),
                                child: Text(
                                  ")",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("2"),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("5"),
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("8"),
                                child: Text(
                                  "8",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("00"),
                                child: Text(
                                  "00",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                      ],
                    )
                    ),
                    Expanded(child: Column(
                      children: [
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("x"),
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("%"),
                                child: Text(
                                  "%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("3"),
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("6"),
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("9"),
                                child: Text(
                                  "9",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            child: TextButton(onPressed: () => ButtonFunction("."),
                                child: Text(
                                  ".",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                      ],
                    )
                    ),
                    Expanded(child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: TextButton(onPressed: () => ButtonFunction("/"),
                                child: Text(
                                  "/",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: TextButton(onPressed: () => ButtonFunction("*"),
                                child: Text(
                                  "*",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: TextButton(onPressed: () => ButtonFunction("-"),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: TextButton(onPressed: () => ButtonFunction("+"),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                )
                            )
                        ),
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
