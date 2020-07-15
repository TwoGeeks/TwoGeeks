// model for user
class UserPreferenceModel {
  final String currentSchoolYear;
  final String gender;

  UserPreferenceModel(
      {
        this.currentSchoolYear,
        this.gender,
   });

  static dynamic _ifEmpty(dynamic value, dynamic altVal){
    if(value == null || value == ""){
      return altVal;
    }
    return value;
  }

  factory UserPreferenceModel.fromMap(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return null;
    }
    final String currentSchoolYear = _ifEmpty(data["preferredCurrentSchoolYear"], "Others");
    final String gender = _ifEmpty(data["preferredGender"], "neutral");

    return UserPreferenceModel(currentSchoolYear: currentSchoolYear, gender: gender);
  }
}