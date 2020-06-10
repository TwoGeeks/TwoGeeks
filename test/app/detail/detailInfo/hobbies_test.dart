import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/detail/detailInfo/hobbies.dart';
import '../../../createWidgetTester.dart';

void main() {
  group("Hobbies", () {
    testWidgets("show list of hobbies text and info title",
        (WidgetTester tester) async {
      final hobbiesList = ["Badminton", "Volleyball"];
      await tester.pumpWidget(createWidgetTester(hobbies(hobbiesList)));

      final badmintonFinder = find.text("Badminton");
      final volleyballFinder = find.text("Volleyball");
      final titleFinder = find.text("Hobbies");

      expect(badmintonFinder, findsOneWidget);
      expect(volleyballFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });
  });
}
