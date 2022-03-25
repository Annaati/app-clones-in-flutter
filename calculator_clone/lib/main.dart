import 'package:flutter/material.dart';

void main() => runApp(const CalculatorClone());



class CalculatorClone extends StatelessWidget {
  const CalculatorClone({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(),
      home: const Text('Flutter Demo Home Page'),
    );
  }
}
