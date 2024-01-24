import 'package:praise_app_flutter/ui/view/validation/message_ja.dart';
import 'package:praise_app_flutter/ui/view/validation/validator.dart';

class MinValidator implements Validator<String> {
  final int minLength;

  MinValidator(
    this.minLength
  );
  
  @override
  bool validate(String value) {
    return value.length >= minLength;
  }

  @override
  String getMessage() {
    return '$minLength${MessageJa.min}';
  }
}