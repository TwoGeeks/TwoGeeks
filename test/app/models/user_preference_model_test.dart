import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/models/user_preference_model.dart';

void main() {
  group("User preference model", () {
    test("should contain currentSchoolYear and gender", () {
      final model =
          UserPreferenceModel(currentSchoolYear: "year2", gender: "f");

      expect(model.currentSchoolYear, "year2");
      expect(model.gender, "f");
    });
  });
}
