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

  UserProfileModel({this.name, this.age, this.country, this.currentSchool, this.currentSchoolYear, this.aboutMe,
    this.gender, this.profilePic, this.strength, this.weakness, this.hobbies});

  static dynamic _ifEmpty(dynamic value, dynamic altVal){
    if(value == null || value == ""){
      return altVal;
    }
    return value;
  }

  factory UserProfileModel.fromMap(Map<String,dynamic> data){
    if(data.isEmpty){
      return null;
    }
    final String name = _ifEmpty(data["name"], "No name given").toString();
    final String age = _ifEmpty(data["age"], "undefined").toString();
    final String country = _ifEmpty(data["country"], "undefined").toString();
    final String currentSchool = _ifEmpty(data["currentSchool"], "undefined").toString();
    final String currentSchoolYear = _ifEmpty(data["currentSchoolYear"], "Others").toString();
    final String aboutMe = _ifEmpty(data["aboutMe"], "").toString();
    final String gender = _ifEmpty(data["gender"], "neutral").toString();
    final String profilePic = _ifEmpty(data["profilePic"], "").toString();
    final strength = _ifEmpty(data["strength"], []);
    final weakness = _ifEmpty(data["weakness"], []);
    final hobbies = _ifEmpty(data["hobbies"], []);
    return UserProfileModel(name: name, age: age ,country: country, currentSchool: currentSchool,
    currentSchoolYear: currentSchoolYear, aboutMe: aboutMe, gender: gender,
    profilePic: profilePic, strength: strength, weakness: weakness, hobbies: hobbies);
  }
}