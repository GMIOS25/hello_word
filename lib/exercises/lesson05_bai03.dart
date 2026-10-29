// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lesson 05 - Bài tập 3',
      home: Lesson05Bai03(),
    );
  }
}

class Lesson05Bai03 extends StatefulWidget {
  const Lesson05Bai03({super.key});

  @override
  State<Lesson05Bai03> createState() => _Lesson05Bai03State();
}

class _Lesson05Bai03State extends State<Lesson05Bai03> {
  // Trạng thái bật/tắt của bóng đèn tại các phòng
  final Map<String, bool> _lights = {
    'Living Room': true,
    'Bedroom': false,
    'Dining Room': true,
    'Kitchen': true,
    'Entrance': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Checkbox Demo'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Tiêu đề phần danh sách công tắc
            const Text(
              'Light Switches',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            // Danh sách các phòng kèm Checkbox để bật/tắt đèn
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: _lights.keys.map((room) {
                  return CheckboxListTile(
                    title: Text(room),
                    value: _lights[room],
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (bool? value) {
                      setState(() {
                        _lights[room] = value ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),
            // Tiêu đề phần hiển thị icon đèn
            const Text(
              'Light Icons',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Hiển thị các bóng đèn dạng card nằm ngang
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: _lights.entries.map((entry) {
                  final room = entry.key;
                  final isOn = entry.value;

                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 8.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.lightbulb,
                            size: 50,
                            color: isOn ? Colors.amber : Colors.grey[400],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            room,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

