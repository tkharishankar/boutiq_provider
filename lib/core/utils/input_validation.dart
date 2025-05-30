import 'package:flutter/material.dart';

enum ValidateFailResult {
  empty,
  invalidEmail,
  invalidPassword,
  passwordNotMatch,
  invalidAtLeastEightCharacter,
  invalidPhoneNumber,
  invalidLength,
  invalidPasswordType,
  isNewPasswordMatchOldPassword,
  isNewPwdAndConfirmedPwdNotMatched,
}

typedef Validator = ValidateFailResult? Function(String?);
typedef ValidatorString = String? Function(String?);

mixin InputValidationMixin {
  final hasNumberRegEx = RegExp(r'[0-9]+');
  final hasCharacterRegEx = RegExp(r"[a-zA-Z]+");
  final isNumber = RegExp(r'[^0-9]{1,}');
  final isEmailRegEx = RegExp(
    r"^[a-zA-Z0-9.!#$%&'.*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?).*$",
  );
  final isPhoneNumber = RegExp(
    r'^([0-9]{10})$',
  );

  ValidateFailResult? isTextEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return ValidateFailResult.empty;
    }
    return null;
  }

  ValidateFailResult? isInvalidEmail(String? value) {
    if (value == null || !isEmailRegEx.hasMatch(value)) {
      return ValidateFailResult.invalidEmail;
    }
    return null;
  }

  ValidateFailResult? invalidPasswordType(bool? invalid) {
    if (invalid != null) {
      return ValidateFailResult.invalidPasswordType;
    }
    return null;
  }

  // at least 8 character (a-z)
  // at least 1 number (0-9)
  ValidateFailResult? isPasswordInvalid(String? value) {
    bool isInvalidLength = (value == null || value.length < 6);

    if (isInvalidLength) {
      return ValidateFailResult.invalidLength;
    }

    bool haveAtLeastOneNumber = hasNumberRegEx.hasMatch(value);
    // bool haveAtLeastOneCharacter = hasCharacterRegEx.hasMatch(value);

    if (!haveAtLeastOneNumber) {
      return ValidateFailResult.invalidPassword;
    }

    return null;
  }

  ValidateFailResult? isInvalidPhoneNumber(String? value) {
    String? isValidNumber = value?.replaceAll(isNumber, '');

    if (isValidNumber != null) {
      if (isValidNumber.length < 10) {
        return ValidateFailResult.invalidPhoneNumber;
      }
      if (!isPhoneNumber.hasMatch(isValidNumber)) {
        return ValidateFailResult.invalidPhoneNumber;
      }
    }

    return null;
  }

  ValidatorString combine(List<ValidatorString> validators) {
    return (String? str) {
      for (final validator in validators) {
        final result = validator(str);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  ValidatorString withMessage(String message, Validator validator) {
    return (String? str) {
      final result = validator(str);
      if (result != null) {
        return message;
      }
      return null;
    };
  }

  String? isValidTermsAndConditions(bool? value, String message) {
    if (value == false || value == null) {
      return message;
    }
    return null;
  }
}

void showAlertDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}

void showActionAlertDialog(
  BuildContext context,
  String title,
  String content,
  List<AlertAction> actions,
) {
  final hasContent = content.isNotEmpty;
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: hasContent ? Text(content) : null,
      actions: actions.map((action) {
        return TextButton(
          child: Text(action.label),
          onPressed: () {
            Navigator.of(context).pop();
            if (action.onTap != null) {
              action.onTap!();
            }
          },
        );
      }).toList(),
    ),
  );
}

class AlertAction {
  final String label;
  final void Function()? onTap;

  AlertAction({
    required this.label,
    this.onTap,
  });
}
