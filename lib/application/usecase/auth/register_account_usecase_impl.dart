import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/repository/auth/register_account_repository.dart';
import 'package:praise_app_flutter/domain/usecase/auth/register_account_usecase.dart';

class RegisterAccountUsecaseImpl implements RegisterAccountUsecase {
  final RegisterAccountRepository _registerAccountRepository;

  RegisterAccountUsecaseImpl({
    required RegisterAccountRepository registerAccountRepository
  }) : _registerAccountRepository = registerAccountRepository;

  @override
  Future<Auth> execute(String name, String email, String password) async {
    final res = await _registerAccountRepository.registerAccount(name, email, password);
    return res;
  }
}