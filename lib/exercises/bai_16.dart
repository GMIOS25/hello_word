import 'package:flutter/material.dart';

class BaiTap16 extends StatelessWidget {
  const BaiTap16({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập 16: Nút (ElevatedButton)'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: const TextStyle(fontSize: 18),
          ),
          onPressed: () {
            // Khi nhấn nút, hiển thị SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Bạn vừa nhấn nút!'),
                duration: Duration(seconds: 2),
              ),
            );
            // Đồng thời in ra console (Debug Console)
            // ignore: avoid_print
            print('Button pressed!');
          },
          child: const Text('Nhấn tôi!'),
        ),
      ),
    );
  }
}
