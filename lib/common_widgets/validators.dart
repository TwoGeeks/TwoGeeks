// Use this class to create validators for inputs
abstract class Validator<T> {
  bool isValid(T value);
}

class StringValidator implements Validator<String> {
  // Returns true if string is not empty
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

// Used as a mixin for email-password form
class EmailAndPasswordValidator {
  final StringValidator emailValidator = StringValidator();
  final StringValidator passwordValidator = StringValidator();
  final String emailCannotBeEmpty = "Email can\'t be empty";
  final String passwordCannotBeEmpty = "Password can\'t be empty";
}
