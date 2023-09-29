import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double firstNum = 0, secondNum = 0;
  String input = '';
  String output = '';
  String operator = '';
  Color bgColor = Color.fromARGB(255, 19, 19, 19);

  // void onButtonClick(value) {
  //   if (value == "AC") {
  //     input = '';
  //     output = '';
  //   } else if (value == "X") {
  //     input = input.substring(0, input.length - 1);
  //   } else if (value == "=") {
  //     var userInput = input;
  //     userInput = input.replaceAll('x', '*');
  //     Parser p = Parser();
  //     Expression expression = p.parse(userInput);
  //     ContextModel contextModel = ContextModel();
  //     var finalValue = expression.evaluate(EvaluationType.REAL, contextModel);
  //     output = finalValue.toString();
  //   } else {
  //     input += value;
  //   }
  //   setState(() {});
  //   print(value);
  // }
  void onButtonClick(String value) {
    setState(() {
      if (value == 'AC') {
        input = '';
        output = '';
      } else if (value == 'X') {
        if (input.isNotEmpty) input = input.substring(0, input.length - 1);
      } else if (value == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(input);
          ContextModel cm = ContextModel();
          double result = exp.evaluate(EvaluationType.REAL, cm);
          output = result.toString();
        } catch (e) {
          output = 'Error';
        }
      } else {
        input += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: Text(
                      input,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: Text(
                      output,
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 163, 163, 163)),
                    ),
                  ),
                ]),
          )),
          Row(
            children: [
              customButton(
                  num: 'AC',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 46, 46, 46)),
              customButton(
                  num: '<-',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 46, 46, 46)),
              customButton(
                  num: '%',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 46, 46, 46)),
              customButton(
                  num: 'X',
                  textColor: Colors.white,
                  buttonColor: Colors.orange),
            ],
          ),
          Row(
            children: [
              customButton(
                  num: '7',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '8',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '9',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '*',
                  textColor: Colors.white,
                  buttonColor: Colors.orange),
            ],
          ),
          Row(
            children: [
              customButton(
                  num: '4',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '5',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '6',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '-',
                  textColor: Colors.white,
                  buttonColor: Colors.orange),
            ],
          ),
          Row(
            children: [
              customButton(
                  num: '1',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '2',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '3',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '+',
                  textColor: Colors.white,
                  buttonColor: Colors.orange),
            ],
          ),
          Row(
            children: [
              customButton(
                  num: '0',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '.',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 19, 19, 19)),
              customButton(
                  num: '=',
                  textColor: Colors.white,
                  buttonColor: Color.fromARGB(255, 46, 46, 46)),
              customButton(
                  num: '/',
                  textColor: Colors.white,
                  buttonColor: Colors.orange),
            ],
          ),
        ],
      ),
    ));
  }

  Widget customButton(
      {required String num, required Color textColor, required buttonColor}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
          child: Text(
            num,
            style: TextStyle(
                color: textColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          onPressed: () => onButtonClick(num),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(22),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
