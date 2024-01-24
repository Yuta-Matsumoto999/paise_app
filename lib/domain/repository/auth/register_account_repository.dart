import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/factory/auth/register_account_factory.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/register_account_datesource.dart';
import 'package:praise_app_flutter/infrastructure/repository/auth/register_account_repository_impl.dart';

final registerAccountRepositoryProvider = Provider<RegisterAccountRepository>(
  (ref) => RegisterAccountRepositoryImpl(
    registerAccountDatasource: ref.watch(registerAccountDatasourceprovider), 
    registerAccountFactory: ref.watch(registerAccountFactoryProvider)
  )
);

abstract class RegisterAccountRepository {
  Future<Auth> registerAccount(String name, String email, String password);
}