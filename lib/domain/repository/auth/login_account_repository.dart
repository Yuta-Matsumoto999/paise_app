import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/factory/auth/login_account_factory.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/login_account_datasource.dart';
import 'package:praise_app_flutter/infrastructure/repository/auth/login_account_repository_impl.dart';

final loginAccountRepositoryProvider = Provider<LoginAccountRepository>(
  (ref) => LoginAccountRepositoryImpl(
    loginAccountDatasource: ref.watch(loginAccountDatasourceProvider), 
    loginAccountFactory: ref.watch(loginAccountFactoryProvider)
  )
);

abstract class LoginAccountRepository {
  Future<Auth> login(String email, String password);
}