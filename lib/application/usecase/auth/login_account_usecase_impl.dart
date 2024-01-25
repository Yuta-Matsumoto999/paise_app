import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/repository/auth/login_account_repository.dart';
import 'package:praise_app_flutter/domain/usecase/auth/login_account_usecase.dart';

class LoginAccountUsecaseImpl implements LoginAccountUsecase {
  final LoginAccountRepository _loginAccountRepository;

  LoginAccountUsecaseImpl({
    required LoginAccountRepository loginAccountRepository
  }) : _loginAccountRepository = loginAccountRepository;

  @override
  Future<Auth> execute(String email, String password) {
    final res = _loginAccountRepository.login(email, password);
    return res;
  }
}