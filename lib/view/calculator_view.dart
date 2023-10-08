import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          CalculatorDisplayOne(
              hint: 'Enter first number', controller: displayOneController),
          const SizedBox(
            height: 30,
          ),
          CalculatorDisplayOne(
              hint: 'Enter second number', controller: displayTwoController),
          const SizedBox(
            height: 30,
          ),
          const Text("0",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 123, 119, 119))),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 160, 184, 244),
                  child: const Icon(CupertinoIcons.add)),
              FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 160, 184, 244),
                  child: const Icon(CupertinoIcons.minus)),
              FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 160, 184, 244),
                  child: const Icon(CupertinoIcons.multiply)),
              FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 160, 184, 244),
                  child: const Icon(CupertinoIcons.divide)),
            ],
          ),
          ButtonTheme(
              minWidth: 300,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Text('clear'),
              ))
        ],
      ),
    );
  }
}

class CalculatorDisplayOne extends StatelessWidget {
  const CalculatorDisplayOne({
    super.key,
    this.hint = "enter a number",
    required this.controller,
  });

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textDirection: TextDirection.ltr,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        hintText: hint,
        hintStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      textAlign: TextAlign.center,
    );
  }
}
