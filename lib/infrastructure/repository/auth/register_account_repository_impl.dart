import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/factory/auth/register_account_factory.dart';
import 'package:praise_app_flutter/domain/repository/auth/register_account_repository.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/register_account_datesource.dart';

class RegisterAccountRepositoryImpl implements RegisterAccountRepository {
  final RegisterAccountDatasource _registerAccountDatasource;
  final RegisterAccountFactory _registerAccountFactory;

  RegisterAccountRepositoryImpl({
    required RegisterAccountDatasource registerAccountDatasource,
    required RegisterAccountFactory registerAccountFactory
  }) : _registerAccountDatasource = registerAccountDatasource,
  _registerAccountFactory = registerAccountFactory;

  @override
  Future<Auth> registerAccount(String name, String email, String password) async {
    final res = await _registerAccountDatasource.register(name, email, password);
    return _registerAccountFactory.createFromModel(res);
  }
}