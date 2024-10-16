import 'package:flutter/material.dart';

const double textSize = 22;

class ListviewDemo extends StatelessWidget {
  const ListviewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // children: const [
      //   Text("Tom", style: TextStyle(fontSize: textSize)),
      //   Text("Alice", style: TextStyle(fontSize: textSize)),
      //   Text("Bob", style: TextStyle(fontSize: textSize)),
      //   Text("Sam", style: TextStyle(fontSize: textSize)),
      //   Text("Kate", style: TextStyle(fontSize: textSize)),
      // ],
      itemCount: 50,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return Text('Item № ${index + 1}');
      },
    );
  }
}
