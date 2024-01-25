import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/factory/auth/login_account_factory.dart';
import 'package:praise_app_flutter/domain/repository/auth/login_account_repository.dart';
import 'package:praise_app_flutter/infrastructure/datasource/auth/login_account_datasource.dart';

class LoginAccountRepositoryImpl implements LoginAccountRepository {
  final LoginAccountDatasource _loginAccountDatasource;
  final LoginAccountFactory _loginAccountFactory;

  LoginAccountRepositoryImpl({
    required LoginAccountDatasource loginAccountDatasource,
    required LoginAccountFactory loginAccountFactory
  }) : _loginAccountDatasource = loginAccountDatasource,
  _loginAccountFactory = loginAccountFactory;

  @override
  Future<Auth> login(String email, String password) async {
    final res = await _loginAccountDatasource.login(email, password);
    return _loginAccountFactory.createFromModel(res);
  }
}