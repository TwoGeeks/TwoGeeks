// model for user
class UserProfileModel {
  final String name;
  final String age;
  final String country;
  final String currentSchool;
  final String currentSchoolYear;
  final String aboutMe;
  final String gender;
  final String profilePic;
  final strength;
  final weakness;
  final hobbies;

  UserProfileModel(
      {this.name,
      this.age,
      this.country,
      this.currentSchool,
      this.currentSchoolYear,
      this.aboutMe,
      this.gender,
      this.profilePic,
      this.strength,
      this.weakness,
      this.hobbies});

  static dynamic _isEmpty(dynamic value) {
    if (value == null) {
      return "Undefined";
    }
    return value;
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return null;
    }
    final String name = _isEmpty(data["name"]).toString();
    final String age = _isEmpty(data["age"]).toString();
    final String country = _isEmpty(data["country"]).toString();
    final String currentSchool = _isEmpty(data["currentSchool"]).toString();
    final String currentSchoolYear =
        _isEmpty(data["currentSchoolYear"]).toString();
    final String aboutMe = _isEmpty(data["aboutMe"]).toString();
    final String gender = _isEmpty(data["gender"]).toString();
    final String profilePic = _isEmpty(data["profilePic"]).toString();
    final strength = _isEmpty(data["strength"]);
    final weakness = _isEmpty(data["weakness"]);
    final hobbies = _isEmpty(data["hobbies"]);
    return UserProfileModel(
        name: name,
        age: age,
        country: country,
        currentSchool: currentSchool,
        currentSchoolYear: currentSchoolYear,
        aboutMe: aboutMe,
        gender: gender,
        profilePic: profilePic,
        strength: strength,
        weakness: weakness,
        hobbies: hobbies);
  }
}
