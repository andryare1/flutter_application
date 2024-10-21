import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_2.dart';

class App3 extends StatelessWidget {
  const App3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const Page1());
        }

        var uri = Uri.parse(settings.name ?? '');

        if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'details') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder:  (context) => Page2(title: id));
        }

        return MaterialPageRoute(builder: (context) => Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text('uncnown page'),
          ),
        ),
        );
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
                Navigator.pushNamed(context, '/details/5');
              },
              child: const Text('Go to Page2'),
            ),
          ],
        ),
      ),
    );
  }
}

