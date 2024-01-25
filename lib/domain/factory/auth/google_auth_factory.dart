import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/infrastructure/factory/auth/google_auth_factory_impl.dart';
import 'package:praise_app_flutter/infrastructure/model/auth/auth_response_model.dart';

final googleAuthFactoryProvider = Provider<GoogleAuthFactory>(
  (ref) => GoogleAuthFactoryImpl()
);

abstract class GoogleAuthFactory {
  Auth create({
    required bool isAuth,
    String message
  });

  Auth createFromModel(AuthResponseModel authResponseModel);
}