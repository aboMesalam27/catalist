import 'package:email_validator/email_validator.dart';

class AppValidateStrings {
  static const enterYourPassword = 'Enter Your Password';

  static const passwordMustBe = 'Must be at least 8 characters in length';
  static const passwordMustBeUpperChar = 'Must contain at least one uppercase';
  static const passwordMustBeLowerChar = 'Must contain at least one lowercase';
  static const passwordMustBeNumber = 'Must contain at least one digit';
  static const passwordSameAbove = 'Password must be same as above';
  static const passwordMustBeSpecialChar =
      'Contain at least one special character: !@#&*~';
  static const enterYourEmail = 'Enter Your Email';
  static const validEmail = 'Please enter valid  email';
}

class AppValidate {
  static String? validateEmail(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterYourEmail;
    }
    if (EmailValidator.validate(value) != true) {
      return AppValidateStrings.validEmail;
    } else {
      return null;
    }
  }

  static String? validatePassword(String value, context) {
    if (value.isEmpty) {
      return AppValidateStrings.enterYourPassword;
    }
    if (value.length < 8) {
      return AppValidateStrings.passwordMustBe;
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return AppValidateStrings.passwordMustBeLowerChar;
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return AppValidateStrings.passwordMustBeUpperChar;
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return AppValidateStrings.passwordMustBeNumber;
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return AppValidateStrings.passwordMustBeSpecialChar;
    }

    return null;
  }
}
