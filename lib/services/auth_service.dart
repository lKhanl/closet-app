class AuthService {
  bool register(String fullName, String email, String password,
      String passwordConfirmation) {
    return true;
  }

  String login(String email, String password) {
    return "token";
  }
}
