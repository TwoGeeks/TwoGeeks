import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/services/api_paths.dart';

void main() {
  test("Api user path should show correct path", () {
    String path = APIPath.user("userID");
    expect(path, "users/userID");
  });
  test("Api message path should show correct path", () {
    String path = APIPath.message("sender", "receiver", "theMessage");
    expect(path, "messages/sender/receiver/theMessage");
  });
}
