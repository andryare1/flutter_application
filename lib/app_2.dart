import 'package:flutter/material.dart';
import 'package:flutter_application_1/page.dart';

class App2 extends StatelessWidget {
  const App2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return const Page1();
        },
        '/page2': (context) {
          final arguments = (ModalRoute.of(context)?.settings.arguments ??
              <String, dynamic>{}) as Map;

          return Page2(title: arguments['title']);
        },
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Page 1'),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/page2',
                    arguments: {'title': 'New Title2'});
              },
              child: const Text('Go to Page2'),
            ),
          ],
        ),
      ),
    );
  }
}


class Page2 extends StatelessWidget{
  final String title;
  const Page2({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
             Text('Page2 - $title'),
            ElevatedButton(
              onPressed: () async {
                 Navigator.of(context).pop("Result 123");
              },
              child: const Text('return'),
            ),
          ],
        ),
      ),
    );
  }

  
}