import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/focus.dart';
import 'package:flutter_application_1/form.dart';
//import 'package:flutter_application_1/form.dart';

void main() {
// runApp(MaterialApp(
//       home: Scaffold(
//     appBar: AppBar(
//       title: const Text('First App'),
//       backgroundColor: Colors.purple,
//       actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
//     ),
//     body: const ColorContainer(color: Color.fromARGB(255, 213, 81, 81)),
//     floatingActionButton:
//         IconButton(onPressed: () {}, icon: const Icon(Icons.minimize)),
//   )));
  // runApp(const MaterialApp(
  //   home: PositionedTile(),
  // ));
  //runApp(const App1());
  //runApp(const App2());
  //runApp(const App3());
  //runApp(const App4());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormPage(),
      // home: FocusForm(),
    );
  }
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

class PositionedTile extends StatefulWidget {
  const PositionedTile({super.key});

  @override
  State<PositionedTile> createState() => _PositionedTileState();
}

class _PositionedTileState extends State<PositionedTile> {
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = [
      StatefullColorTile(
        key: UniqueKey(),
      ),
      StatefullColorTile(
        key: UniqueKey(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        )),
        floatingActionButton: FloatingActionButton(
            onPressed: swapTiles,
            child: const Icon(
              Icons.switch_access_shortcut,
            )),
        appBar: AppBar(
            title: const Text('Lecture 3'),
            backgroundColor: const Color.fromARGB(255, 130, 154, 219)));
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatefullColorTile extends StatefulWidget {
  const StatefullColorTile({super.key});

  @override
  State<StatefullColorTile> createState() => _StatelfulColorfulTileState();
}

class _StatelfulColorfulTileState extends State<StatefullColorTile> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: color);
  }
}
