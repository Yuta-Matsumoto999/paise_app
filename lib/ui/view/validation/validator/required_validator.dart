import 'package:praise_app_flutter/ui/view/validation/message_ja.dart';
import 'package:praise_app_flutter/ui/view/validation/validator.dart';

class RequiredValidator implements Validator<String?> {
  @override
  bool validate(String? value) {
    if(value == null) {
      return false;
    }

    return value.trim().isNotEmpty;
  }

  @override
  String getMessage() {
    return MessageJa.required;
  }
}