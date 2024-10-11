import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text('First App'),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
    ),
    body: const ColorContainer(color: Color.fromARGB(255, 213, 81, 81)),
    floatingActionButton:
        IconButton(onPressed: () {}, icon: const Icon(Icons.minimize)),
  )));
}

class ColorContainer extends StatefulWidget {
  const ColorContainer({super.key, required this.color});

  final Color color;

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  late Color color;
  @override
  void initState() {
    super.initState();
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          color = Colors.green;
        });
      },
      child: Container(
        color: color,
        child: Image.asset('assets/back.jpg'),
      ),
    );
  }
}
