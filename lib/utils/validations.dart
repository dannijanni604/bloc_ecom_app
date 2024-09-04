class Validations {
  static bool emailValidator(String email) {
    bool emailValid = RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,3}$').hasMatch(email);
    return emailValid;
  }
}
