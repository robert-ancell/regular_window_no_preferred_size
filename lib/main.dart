import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/_window.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runWidget(MyApp());
}

class MyApp extends StatelessWidget {
  // Fails on Windows if preferredSize is not set, e.g.
  // preferredSize: const Size(400, 300)
  //
  // Error is:
  // [FATAL:flutter/shell/platform/windows/host_window_regular.cc(19)] Check failed: preferred_size.has_preferred_view_size.
  final RegularWindowController controller = RegularWindowController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewCollection(
      views: [
        RegularWindow(
          controller: controller,
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: .fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
