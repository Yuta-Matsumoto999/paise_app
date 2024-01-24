import 'package:praise_app_flutter/ui/view/validation/message_ja.dart';
import 'package:praise_app_flutter/ui/view/validation/validator.dart';

class MaxValidator implements Validator<String> {
  final int maxLength;

  MaxValidator(
    this.maxLength
  );
  
  @override
  bool validate(String value) {
    return value.length <= maxLength;
  }

  @override
  String getMessage() {
    return '$maxLength${MessageJa.max}';
  }
}