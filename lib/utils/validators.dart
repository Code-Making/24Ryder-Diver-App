import 'package:get/get.dart';

class Validator {
  static String? isValidWebsite(String? url) {
    if (url == null) {
      return null;
    }
    if (url.isEmpty) {
      return null;
    }
    if (url.contains(' ')) {
      return "Invalid url";
    }
    if (url.isURL) return null;
    if (Uri.parse(url).isAbsolute) {
      return null;
    }

    return "Invalid url";
  }

  static String? validateNepaliMobile(String? mobile) {
    // var regex = RegExp(r'^(98)\d{8}$', caseSensitive: false);
    // if ((mobile ?? '').isEmpty || (mobile ?? "").length != 10) {
    // return "Invalid mobile number.";
    // }
    var regex = RegExp(r'^(98)\d{8}$', caseSensitive: false);
    if (!regex.hasMatch(mobile ?? "")) return "Invalid mobile number.";
    return null;
  }

  static RegExp get cardValidator => RegExp(r"^[A-Za-z0-9]{12}");
  static RegExp get residentCardValidator =>
      RegExp(r'^[A-Za-z]{2}[0-9]{8}[A-Za-z]{2}$', caseSensitive: false);
  static RegExp nameRegex = RegExp(r"^[a-zA-zぁ-ん一-龯]+([\s][a-zA-Zぁ-ん一-龯]+)*$",
      caseSensitive: false, unicode: true, dotAll: true);
  static String? isName(String? name) {
    if ((name ?? '').isEmpty) return "* Required";
    return nameRegex.hasMatch(name!.trim() ?? "") ? null : "Invalid Name";
  }

  static RegExp get njapaneseMobileNumber =>
      RegExp(r'^(70|90|80)\d{8}$', caseSensitive: false);
//// number not accept r"^[A-Za-z][A-Za-z0-9]{11}"
  ///r"^[A-Za-z][A-Za-z0-9]{11}(?:[0-11]{3})?$"
  static RegExp get japaneseMobileNumber =>
      RegExp(r'^0(70|90|80)\d{8}$', caseSensitive: false);
  static String? validateOtp(
    String? name,
  ) {
    return name?.length == 6 ? null : 'Invalid otp';
  }

  static String? isValidJpMobileNumber(String? mobile) {
    if ((mobile ?? '').isEmpty || !GetUtils.isPhoneNumber(mobile ?? '')) {
      return "Invalid Japanese mobile number.";
    }

    return null;
  }

  static String? isValidEmailOrMobilePhone(String? emailOrPhone) {
    String? mobileErrorText = Validator.isValidJpMobileNumber(emailOrPhone);
    String? emailErrorText = Validator.isValidEmail(emailOrPhone);

    bool emailError = emailErrorText != null;
    bool mobileError = mobileErrorText != null;

    if ((emailError && mobileError)) {
      return "Invalid email or phone";
    } else {
      return null;
    }
  }

  // static String? validateCard(String? value, {String? type}) {
  //   if (value!.isEmpty) {
  //     return 'Please enter valid card number';
  //   } else if (type == EkycConstants.cards[0]) {
  //     if (residentCardValidator.hasMatch(value)) return null;
  //     return 'Please enter valid card number';
  //   } else if (!cardValidator.hasMatch(value)) {
  //     return 'Please enter valid card number';
  //   }
  //   return null;
  // }

  static String? isJapanesMobile(String? value) {
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    } else if (!njapaneseMobileNumber.hasMatch(value.replaceAll('-', ''))) {
      return 'Please enter valid mobile number. \neg.80 4567 8901';
    }
    return null;
  }

  static String? isnJapanesMobile(String? value) {
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    } else if (!japaneseMobileNumber.hasMatch(value.replaceAll('-', ''))) {
      return 'Please enter valid mobile number. \neg.080 4567 8901';
    }
    return null;
  }

  static String? validateJapanesePhoneNumber(String? number) {
    // Regular expression for validating Japanese phone numbers
    final RegExp regExp = RegExp(
      r'^(0\d{1,4}-\d{1,4}-\d{4}|0\d{9,10}|[0-9]{3}-[0-9]{4}-[0-9]{4})$',
    );

    // Check if the input is empty
    if (number == null || number.isEmpty) {
      return 'Please enter a mobile number';
    }
    // Validate the number using the regex
    else if (!regExp.hasMatch(number)) {
      return 'Please enter a valid mobile number. \neg. 355-1234-5678 or 080-1234-5678';
    }

    return null; // Return null if the number is valid
  }

  static String? validateMobile(String? value, {bool isJapanese = false}) {
    String patttern = r'(^((70|90|80)?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    }
    // else if (isJapanese &&
    //     !japaneseMobileNumber.hasMatch(value.replaceAll('-', ''))) {
    //   return 'Please enter valid mobile number';
    // }
    else if (!regExp.hasMatch(value.replaceAll('-', ''))) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String? isNotEmpty(String? name,
      {String? placeholder, String? errorMsg}) {
    if (name == null || name.trim().isEmpty) {
      return "* Required";
      return errorMsg;
    }
    return null;
  }

  static String? isValidEmail(String? email, {String? errorMsg}) {
    if (email != null && email.isEmpty) {
      return "* Required";
      return errorMsg;
    }
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? "");

    if (emailValid) {
      return null;
    } else {
      return "Invalid Email";
    }
  }

  static String? isValidPassword(String? password, {String? errorMsg}) {
    RegExp lowerCaseLetters = RegExp(r'[a-z]');
    RegExp upperCaseLetters = RegExp(r'[A-Z]');
    RegExp numbers = RegExp(r'[0-9]');
    bool hasLowerCase = lowerCaseLetters.hasMatch(password ?? "");
    bool hasUpperCase = upperCaseLetters.hasMatch(password ?? "");
    bool hasNumbers = numbers.hasMatch(password ?? "");
    bool hasMinimumLength = password!.length >= 8;
    if (password == '') {
      return "* Required";
    }
    // Validate lowercase letters
    if (hasLowerCase) {
    } else {
      return "Invalid Password";
      return ('Lowercase letters invalid');
    }

    // Validate uppercase letters
    if (hasUpperCase) {
    } else {
      return "Invalid Password";
      return ('Uppercase letters invalid');
    }

    // Validate numbers
    if (hasNumbers) {
    } else {
      return "Invalid Password";
      return ('Numbers invalid');
    }

    // Validate length
    if (hasMinimumLength) {
    } else {
      return "Invalid Password";
      return ('Length invalid');
    }
    if (password.isEmpty) {
      return errorMsg;
    }
    return null;
  }

  static String? minLength(String? value, {String? errorMsg}) {
    if (value == null) return null;
    if (value.isEmpty) return null;
    // if (value.isEmpty) {
    //   return errorMsg ?? strings.required;
    // }
    return value.length >= 6 ? null : "Invalid phone";
  }

  static String? confirmPassword(
      {required String password, required String cPassword, String? value}) {
    if (cPassword.isEmpty) {
      return "Invalid Password";
    }
    if (password == cPassword) {
      return null;
    } else {
      return value;
    }
  }
}
