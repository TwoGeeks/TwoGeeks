import 'package:flutter_test/flutter_test.dart';
import 'package:twoGeeks/app/models/user_model.dart';

void main() {
  group("User Model", () {
    test(
        "should contain name, age, country, currentSchool, currentSchoolYear, aboutMe, gender, ProfilePic, strength, weakness, hobbies, tutor, friend_user_uid, friendrequest_user_uid, tutor_user_uid, tutorrequest_user_uid",
        () {
      final model = UserModel(
        name: "Tim",
        age: "23",
        country: "Singapore",
        currentSchool: "NUS",
        currentSchoolYear: "Year2",
        aboutMe: "Hi! I am from nus",
        gender: "f",
        profilePic: "www.google.com",
        strength: ["math"],
        weakness: ["english"],
        hobbies: ["volleyball"],
        tutor: true,
        friends_user_uid: ["id1"],
        friendrequest_user_uid: ["id2"],
        tutors_user_uid: ["id3"],
        tutorrequest_user_uid: ["id4"],
      );

      expect(model.name, "Tim");
      expect(model.age, "23");
      expect(model.country, "Singapore");
      expect(model.currentSchool, "NUS");
      expect(model.currentSchoolYear, "Year2");
      expect(model.aboutMe, "Hi! I am from nus");
      expect(model.gender, "f");
      expect(model.profilePic, "www.google.com");
      expect(model.strength[0], "math");
      expect(model.weakness[0], "english");
      expect(model.hobbies[0], "volleyball");
      expect(model.tutor, true);
      expect(model.friends_user_uid[0], "id1");
      expect(model.friendrequest_user_uid[0], "id2");
      expect(model.tutors_user_uid[0], "id3");
      expect(model.tutorrequest_user_uid[0], "id4");
    });
  });
}
