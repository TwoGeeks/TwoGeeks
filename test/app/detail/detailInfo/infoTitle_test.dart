import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/detail/detailInfo/infoTitle.dart';
import '../../../createWidgetTester.dart';

void main() {
  group("Info Title", () {
    testWidgets("show title text", (WidgetTester tester) async {
      final title = "Title Test";
      await tester.pumpWidget(createWidgetTester(infoTitle(title)));

      final titleFinder = find.text(title);

      expect(titleFinder, findsOneWidget);
    });
  });
}
