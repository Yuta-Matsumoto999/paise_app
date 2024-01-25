import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/login_account_datasource_impl.dart';
import 'package:praise_app_flutter/infrastructure/model/auth/auth_response_model.dart';

final loginAccountDatasourceProvider = Provider<LoginAccountDatasource>(
    (ref) => LoginAccountDatasourceImpl()
);

abstract class LoginAccountDatasource {
  Future<AuthResponseModel> login(String email, String password);
}