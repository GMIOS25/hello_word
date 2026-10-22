import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_word/exercises/lesson05_bai02A.dart';
import 'package:hello_word/exercises/lesson05_bai02B.dart';

void main() {
  group('Lesson 05 Bài 02 Tests', () {
    testWidgets('TapboxA toggles state on tap', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Lesson05Bai02A()));

      // Initially Inactive
      expect(find.text('Inactive'), findsOneWidget);
      expect(find.text('Active'), findsNothing);

      // Tap on TapboxA
      await tester.tap(find.byType(TapboxA));
      await tester.pump();

      // State becomes Active
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('Inactive'), findsNothing);

      // Tap again
      await tester.tap(find.byType(TapboxA));
      await tester.pump();

      // State toggles back to Inactive
      expect(find.text('Inactive'), findsOneWidget);
      expect(find.text('Active'), findsNothing);
    });

    testWidgets('TapboxB toggles state via ParentWidget on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Lesson05Bai02B()));

      // Initially Inactive
      expect(find.text('Inactive'), findsOneWidget);
      expect(find.text('Active'), findsNothing);

      // Tap on TapboxB
      await tester.tap(find.byType(TapboxB));
      await tester.pump();

      // State becomes Active
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('Inactive'), findsNothing);

      // Tap again
      await tester.tap(find.byType(TapboxB));
      await tester.pump();

      // State toggles back to Inactive
      expect(find.text('Inactive'), findsOneWidget);
      expect(find.text('Active'), findsNothing);
    });
  });
}
