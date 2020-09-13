class FormData {
  FormData(
      {this.username = "",
      this.fullName = "",
      this.email = "",
      this.phone = "",
      this.address = "",
      this.password = ""});

  /// Username
  String username;

  String usernameValidator(String value) {
    return value.isEmpty ? "Enter username" : null;
  }

  void usernameOnChange(String value) {
    username = value;
  }

  /// Full Name

  String fullName;

  String fullNameValidator(String value) {
    return value.isEmpty ? "Enter full name" : null;
  }

  void fullNameOnChange(String value) {
    fullName = value;
  }

  /// Email

  String email;

  String emailValidator(String value) {
    return value.isEmpty ? "Enter email" : null;
  }

  void emailOnChange(String value) {
    email = value;
  }

  bool isEmail(String emailString) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailRegexp);
    return regExp.hasMatch(emailString);
  }

  /// Phone
  String phone;

  String phoneValidator(String value) {
    return value.isEmpty ? "Enter phone number" : null;
  }

  void phoneOnChange(String value) {
    phone = value;
  }

  /// Address
  String address;

  String addressValidator(String value) {
    return value.isEmpty ? "Enter address" : null;
  }

  void addressOnChange(String value) {
    address = value;
  }

  /// Password
  String password;

  String passwordValidator(String value) {
    return value.isEmpty ? "Enter password" : null;
  }

  void passwordOnChange(String value) {
    password = value;
  }

  @override
  String toString() {
    return "FormData($username, $fullName, $email, $phone, $address, $password)";
  }
}
