// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dad_jokes/features/random_joke/random_joke_page.dart';
import 'package:dad_jokes/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Renders a random joke', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Next'), findsOneWidget);
  });
}
