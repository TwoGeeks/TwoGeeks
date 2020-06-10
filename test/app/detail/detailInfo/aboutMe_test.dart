import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/detail/detailInfo/aboutMe.dart';
import '../../../createWidgetTester.dart';

void main() {
  group("About me", () {
    testWidgets("show about me text and info title",
        (WidgetTester tester) async {
      final aboutMeText = "This is a test about me";
      await tester.pumpWidget(createWidgetTester(aboutMe(aboutMeText)));

      final aboutMeFinder = find.text(aboutMeText);
      final titleFinder = find.text("About me");

      expect(aboutMeFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });
  });
}
