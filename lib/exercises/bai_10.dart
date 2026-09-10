import 'package:flutter/material.dart';

class BaiTap10 extends StatelessWidget {
  const BaiTap10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập 10: Style Text'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Hello World!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.red,
            backgroundColor: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
