import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_word/exercises/lesson03_bai09.dart';

void main() {
  testWidgets('Lesson03BaiTap09 smoke test', (WidgetTester tester) async {
    // Build widget Lesson03BaiTap09
    await tester.pumpWidget(const MaterialApp(home: Lesson03BaiTap09()));

    // Verify Title Section text is present
    expect(find.text('Oeschinen Lake Campground'), findsOneWidget);
    expect(find.text('Kandersteg, Switzerland'), findsOneWidget);

    // Verify 3 Buttons are present
    expect(find.text('CALL'), findsOneWidget);
    expect(find.text('ROUTE'), findsOneWidget);
    expect(find.text('SHARE'), findsOneWidget);

    // Verify FavoriteWidget initial count and icon
    expect(find.text('41'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);

    // Tap to unfavorite
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    // Verify count decremented and star_border icon shown
    expect(find.text('40'), findsOneWidget);
    expect(find.byIcon(Icons.star_border), findsOneWidget);

    // Tap again to favorite
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    // Verify count incremented back to 41 and star icon shown
    expect(find.text('41'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}
