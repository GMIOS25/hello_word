import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Lesson04Bai03(items: items),
    );
  }
}

class Lesson04Bai03 extends StatelessWidget {
  final List<String> items;

  const Lesson04Bai03({
    super.key,
    List<String>? items,
  }) : items = items ?? const [];

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';
    final listItems = items.isNotEmpty
        ? items
        : List<String>.generate(10000, (i) => 'Item $i');

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: ListView.builder(
        itemCount: listItems.length,
        prototypeItem: ListTile(title: Text(listItems.first)),
        itemBuilder: (context, index) {
          return ListTile(title: Text(listItems[index]));
        },
      ),
    );
  }
}
