import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/detail/detailHeader.dart';
import '../../createWidgetTester.dart';

void main() {
  group("Detail Header", () {
    testWidgets("should contain name, age, gender, school, and schoolyear",
        (WidgetTester tester) async {
      final data = {
        "name": "Jon",
        "age": "23",
        "gender": "m",
        "currentSchool": "NUS",
        "currentSchoolYear": "year2 sem1"
      };
      final List<Widget> widgets = detailHeader(data);

      expect(widgets.length, 3);

      await tester.pumpWidget(createWidgetTester(widgets[0]));
      final nameFinder = find.text("Jon");
      expect(nameFinder, findsOneWidget);

      await tester.pumpWidget(createWidgetTester(widgets[1]));
      final ageAndGenderFinder = find.text("23, Male");
      expect(ageAndGenderFinder, findsOneWidget);

      await tester.pumpWidget(createWidgetTester(widgets[2]));
      final currentSchoolFinder = find.text("NUS, year2 sem1");
      expect(currentSchoolFinder, findsOneWidget);
    });

    testWidgets("data does not contain currentSchool",
        (WidgetTester tester) async {
      final data = {
        "name": "Jon",
        "age": "23",
        "gender": "m",
        "currentSchool": "",
        "currentSchoolYear": "year2 sem1"
      };
      final List<Widget> widgets = detailHeader(data);

      await tester.pumpWidget(createWidgetTester(widgets[2]));
      final currentSchoolFinder = find.text("year2 sem1");
      expect(currentSchoolFinder, findsOneWidget);
    });

    testWidgets("data does not contain currentSchoolYear",
        (WidgetTester tester) async {
      final data = {
        "name": "Jon",
        "age": "23",
        "gender": "m",
        "currentSchool": "NUS",
        "currentSchoolYear": ""
      };
      final List<Widget> widgets = detailHeader(data);

      await tester.pumpWidget(createWidgetTester(widgets[2]));
      final currentSchoolFinder = find.text("NUS");
      expect(currentSchoolFinder, findsOneWidget);
    });
  });
}
