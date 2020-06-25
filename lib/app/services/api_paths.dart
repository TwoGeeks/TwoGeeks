class APIPath {
  static String user(String uid) => 'users/$uid';
  static String name(String uid) => 'users/$uid/name';
  static String hobbies(String uid) => 'users/$uid/hobbies';
  static String age(String uid) => 'users/$uid/age';
  static String currentSchool(String uid) => 'users/$uid/currentSchool';
  static String currentSchoolYear(String uid) => 'users/$uid/currentSchoolYear';
}