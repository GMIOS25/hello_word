import 'package:flutter/material.dart';
import 'exercises/bai_10.dart';
import 'exercises/bai_11.dart';
import 'exercises/bai_12.dart';
import 'exercises/bai_13.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lesson 01',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ExerciseMenuScreen(),
    );
  }
}

class ExerciseInfo {
  final int number;
  final String title;
  final String description;
  final IconData icon;
  final Widget page;

  const ExerciseInfo({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.page,
  });
}

class ExerciseMenuScreen extends StatelessWidget {
  const ExerciseMenuScreen({super.key});

  static const List<ExerciseInfo> exercises = [
    ExerciseInfo(
      number: 10,
      title: 'Bài tập 10: Áp dụng kiểu cho Text',
      description: 'Cỡ chữ, in đậm, màu chữ đỏ, màu nền vàng',
      icon: Icons.text_fields,
      page: BaiTap10(),
    ),
    ExerciseInfo(
      number: 11,
      title: 'Bài tập 11: Container hình chữ nhật',
      description: 'Kích thước 250x100, bo góc 16px, viền đỏ 3px',
      icon: Icons.crop_landscape,
      page: BaiTap11(),
    ),
    ExerciseInfo(
      number: 12,
      title: 'Bài tập 12: Container hình tròn',
      description: 'Kích thước 200x200, BoxShape.circle, chữ ở giữa',
      icon: Icons.circle_outlined,
      page: BaiTap12(),
    ),
    ExerciseInfo(
      number: 13,
      title: 'Bài tập 13: Hiển thị Icon',
      description: 'Hiển thị 1 icon yêu thích và 5 icon theo chiều ngang (Row)',
      icon: Icons.emoji_emotions_outlined,
      page: BaiTap13(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Lesson 01 - Danh Sách Bài Tập',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: exercises.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = exercises[index];
          return Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                child: Text(
                  '${item.number}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(item.description),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.page),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
