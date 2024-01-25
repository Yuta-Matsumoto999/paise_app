import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/infrastructure/factory/auth/login_account_factory_impl.dart';
import 'package:praise_app_flutter/infrastructure/model/auth/auth_response_model.dart';

final loginAccountFactoryProvider = Provider<LoginAccountFactory>(
  (ref) => LoginAccountFactoryImpl()
);

abstract class LoginAccountFactory {
  Auth create({
    required bool isAuth,
    String message
  });

  Auth createFromModel(AuthResponseModel authResponseModel);
}