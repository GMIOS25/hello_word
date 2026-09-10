import 'package:flutter/material.dart';

class BaiTap11 extends StatelessWidget {
  const BaiTap11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập 11: Container chữ nhật'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          width: 250,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
              color: Colors.red,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Hello World',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
