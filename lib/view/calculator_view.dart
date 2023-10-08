// ignore_for_file: avoid_print

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

  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onResume: _onResume,
      onPause: _onPause,
      onDetach: _onDetach,
      onHide: _onHide,
      onShow: _onShow,
      onInactive: _onInactive,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );
  }

  void _onShow() {
    print('onShow');
  }

  void _onRestart() {
    print('onRestart');
  }

  void _onInactive() {
    print('inactive rn');
  }

  void _onHide() {
    print('Hiding rn');
  }

  void _onDetach() {
    print('Detaching rn');
  }

  void _onPause() {
    print('Pausing rn');
  }

  void _onResume() {
    print('Resuming rn');
  }

  void _onStateChange(AppLifecycleState state) {
    print('State changing rn : $state');
  }

  @override
  void dispose() {

    super.dispose();
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
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
          Text(z.toString(),
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 123, 119, 119))),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! +
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 160, 184, 244),
                  child: const Icon(CupertinoIcons.add)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! -
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 160, 184, 244),
                  child: const Icon(CupertinoIcons.minus)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! *
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 160, 184, 244),
                  child: const Icon(CupertinoIcons.multiply)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! %
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 160, 184, 244),
                  child: const Icon(CupertinoIcons.divide)),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            backgroundColor: const Color.fromARGB(255, 160, 184, 244),
            icon: const Icon(CupertinoIcons.delete),
            label: const Text('Clear'),
          ),
          const SizedBox(
            height: 30,
          )
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
            borderSide:
                BorderSide(color: Color.fromARGB(255, 5, 205, 245), width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        hintText: hint,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      textAlign: TextAlign.center,
    );
  }
}
