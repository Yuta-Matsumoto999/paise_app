import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/factory/auth/register_account_factory.dart';
import 'package:praise_app_flutter/infrastructure/model/auth/auth_response_model.dart';

class RegisterAccountFactoryImpl implements RegisterAccountFactory {
  @override
  Auth create({
    required bool isAuth,
    String? message, 
  }) {
    return Auth(
      isAuth: isAuth, 
      message: message, 
    );
  }
  
  @override
  Auth createFromModel(AuthResponseModel authResponseModel) {
    return Auth(
      isAuth: authResponseModel.isAuth,
      message: authResponseModel.message 
    );
  }
}