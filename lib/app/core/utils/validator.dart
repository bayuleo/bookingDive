enum ValidatorResult { empty, invalid, valid, other }

class ValidatorHelper {
  static const emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const phoneNumberRegex = r"^[0-9\-\+]{7,14}$";
  static const numberRegex = r"^[0-9\-\+]{5,16}$";
  static const positiveNumber = r"[1-9][0-9]*";
  static const onlyAlphabet = r"^[a-zA-Z| ]+$";
  static const justAlphabetAndNumber = r'^[a-zA-Z0-9| ]+$';
  static const alphanumericCapital = r'^[A-Z0-9]+$';
  static const passwordRegex =
      r'(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|])(?=.*[0-9])(?=.*[a-z]).{8,15}$';
  static const otpRegex = r"^[0-9\-\+]{6}$";

  static ValidatorResult validateEmail(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    return RegExp(emailRegex).hasMatch(input)
        ? ValidatorResult.valid
        : ValidatorResult.invalid;
  }

  static ValidatorResult validatePhoneNumber(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    return RegExp(phoneNumberRegex).hasMatch(input)
        ? ValidatorResult.valid
        : ValidatorResult.invalid;
  }

  static ValidatorResult validateNumber(String? input) {
    if (input == null || input.isEmpty) {
      return ValidatorResult.empty;
    }
    return RegExp(numberRegex).hasMatch(input)
        ? ValidatorResult.valid
        : ValidatorResult.invalid;
  }

  static ValidatorResult validateCurrency(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    if (input.contains('-') || input == '0') {
      return ValidatorResult.invalid;
    }
    return ValidatorResult.valid;
  }

  static ValidatorResult validatePassword(String? input,
      [int minLength = 6, int maxLength = 20]) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    if (input.length < minLength) return ValidatorResult.invalid;
    return ValidatorResult.valid;
    // return RegExp(passwordRegex).hasMatch(input)
    //     ? ValidatorResult.valid
    //     : ValidatorResult.invalid;
  }

  static ValidatorResult validateNewPassword(
      String? oldPassword, String? newPassword) {
    if (oldPassword == null ||
        oldPassword.trim().isEmpty ||
        newPassword == null ||
        newPassword.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    if (!RegExp(passwordRegex).hasMatch(newPassword)) {
      return ValidatorResult.invalid;
    }
    if (oldPassword == newPassword) {
      return ValidatorResult.other;
    }
    return ValidatorResult.valid;
  }

  static ValidatorResult validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (password == null ||
        password.trim().isEmpty ||
        confirmPassword == null ||
        confirmPassword.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    // if (!RegExp(passwordRegex).hasMatch(confirmPassword)) {
    //   return ValidatorResult.invalid;
    // }
    if (password == confirmPassword) {
      return ValidatorResult.valid;
    }
    return ValidatorResult.other;
  }

  static ValidatorResult validateCommon(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    return ValidatorResult.valid;
  }

  static ValidatorResult validateStringOnlyAlphabet(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    if (!RegExp(onlyAlphabet).hasMatch(input)) {
      return ValidatorResult.invalid;
    }
    return ValidatorResult.valid;
  }

  static ValidatorResult validateOTP(String? input) {
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    }
    if (!RegExp(otpRegex).hasMatch(input)) {
      return ValidatorResult.invalid;
    }
    return ValidatorResult.valid;
  }

  static ValidatorResult validateTransactionLimit(String? input) {
    final value = input != null && input.isNotEmpty
        ? int.parse(input.split(",").join(''))
        : 0;
    if (input == null || input.trim().isEmpty) {
      return ValidatorResult.empty;
    } else if (int.parse(input.split(",").join('')) > 999999999 || value == 0) {
      return ValidatorResult.invalid;
    }
    return ValidatorResult.valid;
  }
}

class TextFieldValidatorHelper {
  static validateRequired(value) {
    final validatorResult = ValidatorHelper.validateCommon(value);
    if (validatorResult == ValidatorResult.empty) return "Required";
    return null;
  }

  static validateName(value) {
    final validatorResult = ValidatorHelper.validateStringOnlyAlphabet(value);
    if (validatorResult == ValidatorResult.empty ||
        validatorResult == ValidatorResult.invalid) {
      return "Name required";
    }
    return null;
  }

  static validatePhoneNumber(value) {
    final validatorResult = ValidatorHelper.validatePhoneNumber(value);
    if (validatorResult == ValidatorResult.empty) {
      return "Phone number required";
    }
    if (validatorResult == ValidatorResult.invalid) {
      return "Phone number invalid";
    }
    return null;
  }

  static validateEmail(value) {
    final validatorResult = ValidatorHelper.validateEmail(value);
    if (validatorResult == ValidatorResult.empty) {
      return "Required";
    }
    if (validatorResult == ValidatorResult.invalid) {
      return "Email invalid";
    }
    return null;
  }

  static validatePassword(value) {
    final validatorResult = ValidatorHelper.validatePassword(value);
    if (validatorResult == ValidatorResult.empty) {
      return "Required";
    }
    if (validatorResult == ValidatorResult.invalid) {
      return "Minimum 6 characters";
    }
    return null;
  }

  static validateConfirmPassword(password, confirmPassword) {
    final validatorResult =
        ValidatorHelper.validateConfirmPassword(password, confirmPassword);
    if (validatorResult == ValidatorResult.empty) {
      return "Required";
    }
    if (validatorResult == ValidatorResult.invalid) {
      return "Confirm password invalid";
    }
    if (validatorResult == ValidatorResult.other) {
      return "Confirm password not match";
    }
    return null;
  }
}
