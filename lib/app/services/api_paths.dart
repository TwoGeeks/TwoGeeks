class APIPath {
  static String user(String uid) => 'users/$uid';
  static String message(String sender, String receiver, String message)
  => 'messages/$sender/$receiver/$message';
}
