import 'package:flutter/material.dart';

class BaiTap13 extends StatelessWidget {
  const BaiTap13({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài tập 13: Hiển thị Icon'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'a) Hiển thị 1 Icon:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 80,
            ),
            const SizedBox(height: 36),
            const Text(
              'b) Hiển thị 5 Icon theo hàng ngang (Row):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.home, color: Colors.blue, size: 40),
                Icon(Icons.favorite, color: Colors.red, size: 40, semanticLabel: 'Yêu thích'),
                Icon(Icons.star, color: Colors.green, size: 40),
                Icon(Icons.settings, color: Colors.purple, size: 40),
                Icon(Icons.alarm, color: Colors.orange, size: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
