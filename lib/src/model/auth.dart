class UserInfo {
  String emailOrPhone;
  String password;
  bool isEnteringPhoneNumber;

  UserInfo(
      {required this.emailOrPhone,
      required this.password,
      required this.isEnteringPhoneNumber});

  @override
  String toString() {
    return '{ emailOrPhone: $emailOrPhone, password: $password, isEnteringPhoneNumber: $isEnteringPhoneNumber }';
  }
}
