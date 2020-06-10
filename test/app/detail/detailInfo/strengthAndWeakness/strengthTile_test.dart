import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/strengthTile.dart';
import '../../../../createWidgetTester.dart';

void main() {
  group("Strength Tile", () {
    testWidgets("show subject text and icon", (WidgetTester tester) async {
      final subject = "Math";
      await tester.pumpWidget(createWidgetTester(strengthTile(subject)));

      final subjectFinder = find.text(subject);
      final iconFinder = find.byKey(Key("Icon"));

      expect(subjectFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);
    });
  });
}
