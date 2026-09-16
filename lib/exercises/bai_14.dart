import 'package:flutter/material.dart';

class BaiTap14 extends StatelessWidget {
  const BaiTap14({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bài tập 14: Hiển thị ảnh'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Image.asset(
            'assets/images/cong_an_danh_dan.jpg', // đường dẫn tới ảnh
            width: 500, // chiều rộng
            height: 500, // chiều cao
            fit: BoxFit.contain, // cách hiển thị trong khung
          ),
        ),
      ),
    );
  }
}
