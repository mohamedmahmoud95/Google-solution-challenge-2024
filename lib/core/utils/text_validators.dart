class TextValidator{
  static bool validateText(String text) {
    return text.isNotEmpty;
  }

  static bool validatePassword(String password) {
    return password.length >= 8;
  }

  static bool validateEmail(String email) {
    // A simple regex pattern for email validation
    // This pattern may not cover all possible valid email addresses
    final RegExp emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', caseSensitive: false);

    return emailRegex.hasMatch(email);
  }
}