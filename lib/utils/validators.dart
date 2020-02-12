class Validators {
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
