import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/register_account_datasource_impl.dart';
import 'package:praise_app_flutter/infrastructure/model/auth/auth_response_model.dart';

final registerAccountDatasourceprovider = Provider<RegisterAccountDatasource>(
  (ref) => RegisterAccountDatasourceImpl()
);

abstract class RegisterAccountDatasource {
  Future<AuthResponseModel> register(String name, String email, String password);
}