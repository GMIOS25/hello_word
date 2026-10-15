import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Lession04Bai01(),
    );
  }
}

class Lession04Bai01 extends StatelessWidget {
  const Lession04Bai01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Horizontal List')),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(width: 160, color: Colors.red),
            Container(width: 160, color: Colors.blue),
            Container(width: 160, color: Colors.green),
            Container(width: 160, color: Colors.yellow),
            Container(width: 160, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
