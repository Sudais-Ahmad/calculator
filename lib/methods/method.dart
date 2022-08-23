

import 'package:math_expressions/math_expressions.dart';

void pressEqual (){
  var inPut = '';
  var result = '';

  String finalInput = inPut;
  finalInput = inPut.replaceAll('x', '*');

  Parser parser = Parser();
  Expression expression = parser.parse(finalInput);
  ContextModel contextModel = ContextModel();

  double evaluation = expression.evaluate(EvaluationType.REAL, contextModel);
  result = evaluation.toString();
}