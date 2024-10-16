import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: 300,
        height: 300,
        foregroundDecoration: BoxDecoration(
          color: Colors.blue.withAlpha(50),
        ),
        padding: const EdgeInsets.all(30),
        // constraints: const BoxConstraints(
        //   maxHeight: 200,
        //   maxWidth: 200,
        // ),
        child: Container(
          // transform: Matrix4.skewY(0.3)..rotateZ(pi / 12),
          color: Colors.black,
          // decoration: const BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(80)),
          //   boxShadow: [BoxShadow(color: Colors.black, offset: Offset(5, 13))],
          //   gradient: LinearGradient(colors: [
          //     Colors.purpleAccent,
          //     Colors.yellow,
          //   ]),
          // ),
        ));
  }
}
