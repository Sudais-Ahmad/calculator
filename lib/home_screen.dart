import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var inPut = '';
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          inPut.toString(),
                          style:
                              const TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          result.toString(),
                          style:
                              const TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onPress: () {
                            inPut = '';
                            result = '';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          onPress: () {
                            inPut += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '%',
                          onPress: () {
                            inPut += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '/',
                          onPress: () {
                            inPut += '/';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            inPut += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onPress: () {
                            inPut += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '9',
                          onPress: () {
                            inPut += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'x',
                          onPress: () {
                            inPut += 'x';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            inPut += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          onPress: () {
                            inPut += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '6',
                          onPress: () {
                            inPut += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '-',
                          onPress: () {
                            inPut += '-';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            inPut += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          onPress: () {
                            inPut += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '3',
                          onPress: () {
                            inPut += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          onPress: () {
                            inPut += '+';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            inPut += '0';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: '.',
                          onPress: () {
                            inPut += '.';
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: 'DEL',
                          onPress: () {
                            inPut = inPut.substring(0,inPut.length - 1);
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: '=',
                          onPress: () {
                            pressEqual();
                            setState(() {

                            });
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void pressEqual (){

    String finalInput = inPut;
    finalInput = inPut.replaceAll('x', '*');

    Parser parser = Parser();
    Expression expression = parser.parse(finalInput);
    ContextModel contextModel = ContextModel();

    double evaluation = expression.evaluate(EvaluationType.REAL, contextModel);
    result = evaluation.toString();
  }
}
