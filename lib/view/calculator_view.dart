import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          TextField(
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.number,
            autofocus: true,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 3.0
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 3.0
                )
              ),
              hintText: 'Enter a search term',
              hintStyle: TextStyle(color: Colors.white,), 
            ),
            // textAlign: TextAlign.center, 
          ),
        ],
        // results
        // buttons
      ),
    );
  }
}