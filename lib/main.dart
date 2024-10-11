import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text('First App'),
      backgroundColor: Colors.purple,
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
  double textSize = 14;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: color,
                //child: Image.asset('assets/back.jpg'),
                child: Center(
                  child: Text(
                    'Test',
                    style: TextStyle(fontSize: textSize),
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    textSize += 2;
                  });
                },
                child: const Text('Увеличить')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    textSize -= 2;
                    if (textSize <= 0) {
                      textSize = 0;
                    }
                  });
                },
                child: const Text('Уменьшить'))
          ],
        ));
  }
}
