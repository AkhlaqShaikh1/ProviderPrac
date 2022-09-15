import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountProvider(),
      child: const MaterialApp(
        title: 'Provider Practice',
        home: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _count = Provider.of<CountProvider>(context);
    print("Rebuilding BUILD");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text("Provider Prac"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Count is: ${context.watch<CountProvider>()._count}",
              style: const TextStyle(color: Colors.black),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    context.read<CountProvider>().increment();
                  },
                  child: const Text("Increment")),
              TextButton(
                  onPressed: () {
                    context.read<CountProvider>().decrement();
                  },
                  child: const Text("decrement"))
            ],
          )
        ],
      ),
    );
  }
}

class CountProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
