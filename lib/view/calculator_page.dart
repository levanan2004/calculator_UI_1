import 'package:application1/services/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> listButtons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  // Hàm xử lý màu của các toán tử
  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  // Hàm tính toán
  void equalPresses() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }

  // Hàm Main
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(31, 245, 237, 237),
      body: Column(
        children: [_expanded1(), _expanded2()],
      ),
    ));
  }

  Widget _expanded1() {
    return Expanded(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_ex1_Container1(), _ex1_Container2()],
      ),
    ));
  }

  Widget _expanded2() {
    return Expanded(
        flex: 2,
        child: Container(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemCount: listButtons.length,
              itemBuilder: (BuildContext context, int index) {
                return MyButton(
                  buttontapped: () {
                    if (index == 0) {
                      setState(() {
                        userQuestion = '';
                      });
                    } else if (index == 1) {
                      setState(() {
                        userQuestion =
                            userQuestion.substring(0, userQuestion.length - 1);
                      });
                    } else if (index == listButtons.length - 1) {
                      setState(() {
                        equalPresses();
                      });
                    } else {
                      setState(() {
                        userQuestion += listButtons[index];
                        print(index);
                      });
                    }
                  },
                  buttonText: listButtons[index],
                  color: isOperator(listButtons[index])
                      ? Colors.amber[700]
                      : Colors.black,
                  textcolor: Colors.white,
                );
              }),
        ));
  }

  Widget _ex1_Container1() {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.centerLeft,
      child: Text(
        userQuestion,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _ex1_Container2() {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.centerRight,
      child: Text(
        userAnswer,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
