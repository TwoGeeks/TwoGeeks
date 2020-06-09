import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/services/user.dart';

void main() {
  test("User class should have attribute uid", () {
    User testUser = User(uid: "testingUid");
    expect(testUser.uid, "testingUid");
  });
}