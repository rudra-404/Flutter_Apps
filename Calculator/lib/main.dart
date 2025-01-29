import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

double firstNum = 0.0;
double secondNum = 0.0;
var input = '';
var output = '';
var operation = '';
var hideInput = false;
var outputSize = 35.0;

onButtonClick(value) {
  if (value == "AC") {
    input = '';
    output = '';
  } else if (value == "<") {
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
    }
  } else if (value == "=") {
    if(input.isNotEmpty) {
      var userInput = input;
      userInput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
      if (output.endsWith(".0")) {
        output = output.substring(0, output.length - 2);
      }
      input = output;
      hideInput = true;
      outputSize = 50.0;
    }
  } else {
    input += value;
    hideInput = false;
    outputSize = 35.0;
  }
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            // Input Output Area -------------------------------->

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      hideInput ? '' : input,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                    Text(
                      output,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: outputSize,
                      ),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),

            // BUTTON Area --------------------------------------->

            Row(
              children: [
                button(text: "AC", buttonBgColor: operatorColor, tColor: orangeColor, flex: 2),
                button(text: "<", buttonBgColor: operatorColor, tColor: orangeColor),
                button(text: "/", buttonBgColor: operatorColor, tColor: orangeColor),
              ],
            ),
            Row(
              children: [
                button(text: "7"),
                button(text: "8"),
                button(text: "9"),
                button(text: "x", buttonBgColor: operatorColor, tColor: orangeColor),
              ],
            ),
            Row(
              children: [
                button(text: "4"),
                button(text: "5"),
                button(text: "6"),
                button(text: "-", buttonBgColor: operatorColor, tColor: orangeColor),
              ],
            ),
            Row(
              children: [
                button(text: "1"),
                button(text: "2"),
                button(text: "3"),
                button(text: "+", buttonBgColor: operatorColor, tColor: orangeColor),
              ],
            ),
            Row(
              children: [
                button(text: "%", buttonBgColor: operatorColor, tColor: orangeColor),
                button(text: "0"),
                button(text: "."),
                button(text: "=", buttonBgColor: orangeColor,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonBgColor = buttonColor, flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBgColor,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            setState(() {
              onButtonClick(text);
            });
          },
          child: Text(
            text,
            style: TextStyle(
              color: tColor,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

