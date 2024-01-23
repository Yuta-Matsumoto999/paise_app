import 'package:praise_app_flutter/ui/view/validation/validator.dart';

class ExecuteValidation<T> {
  final List<Validator> validators;
  
  ExecuteValidation({
    required this.validators
  });

  List<dynamic> execute(T value) {
    final result = validators.where((validator) => validator.validate(value) == false).toList();

    if(result.isNotEmpty) {
      var message =  result.first.getMessage();
      var isValid = false;
      
      return [
        message,
        isValid
      ];
    } else {
      return [
        "",
        true
      ];
    }
  }
}