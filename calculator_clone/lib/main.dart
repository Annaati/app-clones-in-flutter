import 'package:flutter/material.dart';

void main() => runApp(const CalculatorClone());

class CalculatorClone extends StatelessWidget {
  const CalculatorClone({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(),
      home: const HomeSvcreen()//Text('Flutter Demo Home Page'),
    );
  }
}


class HomeSvcreen extends StatefulWidget {
  
  
  const HomeSvcreen({ Key? key }) : super(key: key);

  @override
  State<HomeSvcreen> createState() => _HomeSvcreenState();
}

class _HomeSvcreenState extends State<HomeSvcreen> {
  final TextEditingController _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              TextField(
                controller: _inputController,
              )
            ],
          )
        ],
      ),
    );
  }
}