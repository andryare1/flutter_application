import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Container(width: 100, height: 200, color: Colors.white),
        // Container(width: 100, height: 100, color: Colors.red),
        // Container(width: 100, height: 100, color: Colors.green),
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
            )),
        Expanded(
            child: Container(
          color: Colors.blue,
        )),
        Expanded(
            child: Container(
          color: Colors.green,
        )),
      ],
    );
  }
}
