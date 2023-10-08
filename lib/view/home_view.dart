import 'package:calculatorapp/view/calculator_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 113, 196, 234),
        title: Text('Calculator'),
      ),
      body: CalculatorView(),
    );
  }
}