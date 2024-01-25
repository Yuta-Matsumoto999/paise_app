import 'package:praise_app_flutter/core/constants/message_ja.dart';

class GoogleAuthErrorException implements Exception{
  @override
  String toString() {
    return MessageJa.googleAuthError;
  }
}