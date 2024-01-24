import 'package:praise_app_flutter/core/constants/message_ja.dart';

class AuthErrorException implements Exception {
  final String? statusCode;

  AuthErrorException(
    this.statusCode
  );

  @override
  String toString() {
    switch(statusCode) {
      case '500':
        return MessageJa.internalServerError;
      case '400':
        return MessageJa.authAccountAlreadyExists;
      case '422':
        return MessageJa.authInValidValue;
      default:
        return MessageJa.exceitopnError;
    }      
  }
}