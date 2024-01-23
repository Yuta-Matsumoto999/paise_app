import 'package:praise_app_flutter/core/constants/message_ja.dart';

class NetworkErrorException implements Exception {
  @override
  String toString() {
    return MessageJa.networkError;
  }
}