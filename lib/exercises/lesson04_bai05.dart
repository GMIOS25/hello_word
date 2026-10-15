import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Lesson04Bai05(),
    );
  }
}

class Lesson04Bai05 extends StatelessWidget {
  const Lesson04Bai05({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
      ),
      body: GridView.count(
        // Create a grid with 2 columns.
        // If you change the scrollDirection to horizontal,
        // this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the list.
        children: List.generate(100, (index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.yellow, // màu nền
              border: Border.all(
                color: Colors.red, // màu viền
                width: 3, // độ dày viền
              ),
              borderRadius: BorderRadius.circular(16), // bo góc
            ),
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        }),
      ),
    );
  }
}
