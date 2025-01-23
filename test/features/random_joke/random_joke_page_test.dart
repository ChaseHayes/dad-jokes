// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dad_jokes/features/random_joke/random_joke_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders page', (WidgetTester tester) async {
    const randomJoke = 'Knock knock';
    String getRandomJokeMock() => randomJoke;
    await tester.pumpWidget(MaterialApp(home: RandomJokePage(getRandomJoke: getRandomJokeMock)));

    await tester.scrollUntilVisible(find.text('Next'), 200);

    expect(find.text(randomJoke), findsOneWidget);
    expect(find.text('How did I do?'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
  });

  testWidgets('user can rate a joke', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RandomJokePage()));

    await tester.scrollUntilVisible(find.text('How did I do?'), 200);

    await tester.tap(find.text('How did I do?'));

    expect(find.text('Submit'), findsOneWidget);
  });
}
