import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_word/main_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_test_');
    Hive.init(tempDir.path);
    await Hive.openBox('login');
    await Hive.openBox('accounts');
  });

  testWidgets('Test Lesson 07 Bai 01 Login and Register flow',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MainApp());
    await tester.pump();

    // Verify Login screen
    expect(find.text('Welcome back'), findsOneWidget);

    // Navigate to Signup
    await tester.tap(find.widgetWithText(TextButton, 'Signup'));
    await tester.pumpAndSettle();

    expect(find.text('Create your account'), findsOneWidget);

    // Test Task 2: Real-time password strength check
    final passwordField = find.widgetWithText(TextFormField, 'Password');

    // Weak password (< 8 chars)
    await tester.enterText(passwordField, 'abc');
    await tester.pump();
    expect(
      find.text('Mật khẩu chưa đủ mạnh (cần ít nhất 8 ký tự, gồm số và ký tự đặc biệt)'),
      findsOneWidget,
    );

    // Password with 8 chars but no number / special char
    await tester.enterText(passwordField, 'abcdefgh');
    await tester.pump();
    expect(
      find.text('Mật khẩu chưa đủ mạnh (cần ít nhất 8 ký tự, gồm số và ký tự đặc biệt)'),
      findsOneWidget,
    );

    // Password with number but no special char
    await tester.enterText(passwordField, 'abcdef12');
    await tester.pump();
    expect(
      find.text('Mật khẩu chưa đủ mạnh (cần ít nhất 8 ký tự, gồm số và ký tự đặc biệt)'),
      findsOneWidget,
    );

    // Strong password (>= 8 chars, number, special char)
    await tester.enterText(passwordField, 'Pass123@');
    await tester.pump();
    expect(find.text('Mật khẩu đủ mạnh'), findsOneWidget);

    // Fill the rest of the registration fields
    await tester.enterText(find.widgetWithText(TextFormField, 'Username'), 'user1');
    await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'user1@example.com');
    await tester.enterText(find.widgetWithText(TextFormField, 'Confirm Password'), 'Pass123@');
    await tester.pump();

    // Tap Register
    await tester.tap(find.widgetWithText(ElevatedButton, 'Register'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    // Verify user stored in accounts Box
    final accountsBox = Hive.box('accounts');
    expect(accountsBox.get('user1'), 'Pass123@');

    // Login with registered credentials
    await tester.enterText(find.widgetWithText(TextFormField, 'Username'), 'user1');
    await tester.enterText(find.widgetWithText(TextFormField, 'Password'), 'Pass123@');
    await tester.pump();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();
    await tester.pumpAndSettle();

    // Verify Home screen
    expect(find.text('Welcome 🎉'), findsOneWidget);
    expect(find.text('user1'), findsOneWidget);

    // Logout from Home
    await tester.tap(find.byIcon(Icons.logout_rounded));
    await tester.pump();
    await tester.pumpAndSettle();

    // Verify back to Login screen
    expect(find.text('Welcome back'), findsOneWidget);
  });
}
