import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/google_auth_datasource_impl.dart';
import 'package:praise_app_flutter/infrastructure/model/auth/auth_response_model.dart';

final googleAuthDatasourceProvider = Provider<GoogleAuthDatasource>(
  (ref) => GoogleAuthDatasourceImpl()
);

abstract class GoogleAuthDatasource {
  Future<AuthResponseModel> execute();
}