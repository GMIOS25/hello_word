import 'package:flutter/material.dart';

import 'exercises/bai_10.dart';
import 'exercises/bai_11.dart';
import 'exercises/bai_12.dart';
import 'exercises/bai_13.dart';
import 'exercises/bai_14.dart';
import 'exercises/bai_15.dart';
import 'exercises/bai_16.dart';
import 'exercises/bai_17.dart';
import 'exercises/lesson03_bai01.dart';
import 'exercises/lesson03_bai09.dart';
import 'exercises/lession04_bai01.dart';
import 'exercises/lesson04_bai02.dart';
import 'exercises/lesson04_bai03.dart';
import 'exercises/lesson04_bai04.dart';
import 'exercises/lesson04_bai05.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises',
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

  static const List<ExerciseInfo> exercisesLesson01 = [
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
    ExerciseInfo(
      number: 14,
      title: 'Bài tập 14: Hiển thị ảnh',
      description: 'Hiển thị ảnh từ assets folder',
      icon: Icons.image,
      page: BaiTap14(),
    ),
    ExerciseInfo(
      number: 15,
      title: 'Bài tập 15: Hiển thị ảnh từ Internet',
      description: 'Sử dụng Image.network tải ảnh từ URL',
      icon: Icons.wifi,
      page: BaiTap15(),
    ),
    ExerciseInfo(
      number: 16,
      title: 'Bài tập 16: Hiển thị nút (ElevatedButton)',
      description: 'Bấm nút hiển thị SnackBar và in console',
      icon: Icons.smart_button,
      page: BaiTap16(),
    ),
    ExerciseInfo(
      number: 17,
      title: 'Bài tập 17: Bộ khung với Scaffold',
      description: 'AppBar, Drawer, Body, FAB và BottomNavigationBar',
      icon: Icons.dashboard_customize_outlined,
      page: BaiTap17(),
    ),
  ];

  static const List<ExerciseInfo> exercisesLesson03 = [
    ExerciseInfo(
      number: 1,
      title: 'Bài tập 1: Vẽ widget tree (Mục 2.2)',
      description: 'Cụm 3 nút CALL, ROUTE, SHARE & Sơ đồ Widget tree',
      icon: Icons.account_tree_outlined,
      page: Lesson03BaiTap01(),
    ),
    ExerciseInfo(
      number: 9,
      title: 'Bài tập 9: Xây dựng Layout theo Tutorial',
      description: 'Màn hình Lake Oeschinen đầy đủ 4 Sections & FavoriteWidget',
      icon: Icons.landscape_outlined,
      page: Lesson03BaiTap09(),
    ),
  ];

  static const List<ExerciseInfo> exercisesLesson04 = [
    ExerciseInfo(
      number: 1,
      title: 'Bài tập 1: Horizontal List',
      description: 'ListView cuộn ngang (scrollDirection: Axis.horizontal)',
      icon: Icons.view_carousel_outlined,
      page: Lession04Bai01(),
    ),
    ExerciseInfo(
      number: 2,
      title: 'Bài tập 2: ListView cơ bản với ListTile',
      description: 'ListView chứa các mục Map, Album, Phone',
      icon: Icons.list_alt_outlined,
      page: Lesson04Bai02(),
    ),
    ExerciseInfo(
      number: 3,
      title: 'Bài tập 3: Long List (ListView.builder)',
      description: 'Danh sách dài 10.000 phần tử dùng prototypeItem',
      icon: Icons.format_list_numbered_outlined,
      page: Lesson04Bai03(),
    ),
    ExerciseInfo(
      number: 4,
      title: 'Bài tập 4: Mixed List (Nhiều kiểu item)',
      description: 'ListView.builder với HeadingItem và MessageItem',
      icon: Icons.dynamic_feed_outlined,
      page: Lesson04Bai04(),
    ),
    ExerciseInfo(
      number: 5,
      title: 'Bài tập 5: GridView.count (Lưới 2 cột)',
      description: 'GridView.count 100 Container bo góc viền đỏ nền vàng',
      icon: Icons.grid_view_outlined,
      page: Lesson04Bai05(),
    ),
  ];

  Widget _buildExerciseList(BuildContext context, List<ExerciseInfo> list) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: list.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = list[index];
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
              foregroundColor:
                  Theme.of(context).colorScheme.onPrimaryContainer,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2, // Mặc định mở tab Lesson 04 để xem ngay bài vừa làm
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter - Danh Sách Bài Tập',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Lesson 01'),
              Tab(text: 'Lesson 03'),
              Tab(text: 'Lesson 04'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildExerciseList(context, exercisesLesson01),
            _buildExerciseList(context, exercisesLesson03),
            _buildExerciseList(context, exercisesLesson04),
          ],
        ),
      ),
    );
  }
}

