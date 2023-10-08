import 'package:calculatorapp/view/calculator_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 157, 182),
        title: Text('Calculator'),
      ),
      body: CalculatorView(),
    );
  }
}