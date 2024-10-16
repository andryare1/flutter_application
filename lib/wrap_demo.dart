import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        Container(
          color: Colors.blueGrey,
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              'W1',
              textScaleFactor: 2,
            ),
          ),
        ),
        Container(
          color: Colors.red,
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              'W2',
              textScaleFactor: 2,
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 64, 196, 52),
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              'W3',
              textScaleFactor: 2,
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 153, 102, 35),
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              'W4',
              textScaleFactor: 2,
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 155, 44, 68),
          width: 200,
          height: 200,
          child: const Center(
            child: Text(
              'W5',
              textScaleFactor: 2,
            ),
          ),
        ),
      ],
    );
  }
}
