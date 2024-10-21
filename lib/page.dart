import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String title;

  const Page1({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Page - $title'),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop("Result 123");
              },
              child: const Text('return'),
            )
          ],
        ),
      ),
    );
  }
}
