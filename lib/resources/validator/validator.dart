class Validator {
  static String? validateForm(String? value, String? name) {
    if (value!.isEmpty) {
      return "$name is required.";
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Name is Required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final email = value!.trim();

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    if (email.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(email)) {
      return "Invalid Email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Password is required.";
    } else if (value.length < 6) {
      return "Password must be 6 or more characters.";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value!.isEmpty) {
      return "Password is required.";
    } else if (value.length < 6) {
      return "Password must be 6 or more characters.";
    } else if (value != password) {
      return "Password and Confirm Password are not same.";
    }
    return null;
  }
}