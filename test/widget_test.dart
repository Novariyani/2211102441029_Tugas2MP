// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:patternscodelab/main.dart';

void main() {
  testWidgets('Document app displays correct initial text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DocumentApp());

    // Verify that title is displayed.
    expect(find.text('My Document'), findsOneWidget);

    // Verify that initial text content is displayed.
    expect(find.text('Chapter 1'), findsOneWidget);
    expect(find.text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'), findsOneWidget);
    expect(find.text('Learn Dart 3'), findsOneWidget);

    // Verify that last modified date is displayed.
    expect(find.text('Last modified: '), findsOneWidget);
  });
}
