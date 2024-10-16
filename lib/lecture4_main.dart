import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lecture_4',
      home: Scaffold(
          backgroundColor: Colors.white,
          body: LayoutBuilder(builder: ((context, constraints) {
            return Row(
              children: [
                if (constraints.maxWidth > 800) ...[
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    color: const Color.fromARGB(255, 27, 177, 27),
                  ),
                ] else
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.yellow,
                  ),
              ],
            );
          }))),
    );
  }
}
