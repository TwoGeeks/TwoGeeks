import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/detail/detailInfo/strengthAndWeakness/strengthAndWeakness.dart';
import '../../../../createWidgetTester.dart';

void main() {
  group("Strength and Weakness", () {
    final List<String> strengthList = ["Math", "English"];
    final List<String> weaknessList = ["Science", "Biology", "Chinese"];

    testWidgets("show correct number of tiles for each strength and weakness",
        (WidgetTester tester) async {
      await tester.pumpWidget(
          createWidgetTester(strengthAndWeakness(strengthList, weaknessList)));

      final mathFinder = find.text("Math");
      final englishFinder = find.text("English");
      final scienceFinder = find.text("Science");
      final biologyFinder = find.text("Biology");
      final chineseFinder = find.text("Chinese");
      final iconFinder = find.byKey(Key("Icon"));

      expect(mathFinder, findsOneWidget);
      expect(englishFinder, findsOneWidget);
      expect(scienceFinder, findsOneWidget);
      expect(biologyFinder, findsOneWidget);
      expect(chineseFinder, findsOneWidget);
      expect(iconFinder, findsNWidgets(5));
    });

    testWidgets("show info title", (WidgetTester tester) async {
      await tester.pumpWidget(
          createWidgetTester(strengthAndWeakness(strengthList, weaknessList)));

      final titleFinder = find.text("Strengths and Weaknesses");

      expect(titleFinder, findsOneWidget);
    });
  });
}
