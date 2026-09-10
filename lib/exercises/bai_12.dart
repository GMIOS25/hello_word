import 'package:flutter/material.dart';

class BaiTap12 extends StatelessWidget {
  const BaiTap12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập 12: Container hình tròn'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
              color: Colors.red,
              width: 3,
            ),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            'Hello World',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
