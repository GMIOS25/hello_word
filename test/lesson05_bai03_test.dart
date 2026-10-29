import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_word/exercises/lesson05_bai03.dart';

void main() {
  group('Lesson 05 Bài 03 Tests', () {
    testWidgets('Displays all room switches and icons correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Lesson05Bai03()));

      // Kiểm tra tiêu đề
      expect(find.text('Flutter Checkbox Demo'), findsOneWidget);
      expect(find.text('Light Switches'), findsOneWidget);
      expect(find.text('Light Icons'), findsOneWidget);

      // Kiểm tra sự xuất hiện của các phòng
      final rooms = [
        'Living Room',
        'Bedroom',
        'Dining Room',
        'Kitchen',
        'Entrance'
      ];

      for (final room in rooms) {
        // Mỗi phòng xuất hiện 2 lần: 1 lần ở Switch list, 1 lần ở Icon card
        expect(find.text(room), findsNWidgets(2));
      }

      // Kiểm tra trạng thái ban đầu của Bedroom (false - tắt)
      final bedroomCheckbox = tester.widget<Checkbox>(
        find.descendant(
          of: find.widgetWithText(CheckboxListTile, 'Bedroom'),
          matching: find.byType(Checkbox),
        ),
      );
      expect(bedroomCheckbox.value, isFalse);

      // Nhấn vào switch Bedroom để bật đèn
      await tester.tap(find.widgetWithText(CheckboxListTile, 'Bedroom'));
      await tester.pump();

      // Kiểm tra Bedroom đã chuyển sang true (bật)
      final updatedBedroomCheckbox = tester.widget<Checkbox>(
        find.descendant(
          of: find.widgetWithText(CheckboxListTile, 'Bedroom'),
          matching: find.byType(Checkbox),
        ),
      );
      expect(updatedBedroomCheckbox.value, isTrue);

      // Nhấn lại để tắt đèn
      await tester.tap(find.widgetWithText(CheckboxListTile, 'Bedroom'));
      await tester.pump();

      final revertedBedroomCheckbox = tester.widget<Checkbox>(
        find.descendant(
          of: find.widgetWithText(CheckboxListTile, 'Bedroom'),
          matching: find.byType(Checkbox),
        ),
      );
      expect(revertedBedroomCheckbox.value, isFalse);
    });
  });
}

