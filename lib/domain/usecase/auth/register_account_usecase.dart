import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/application/usecase/auth/register_account_usecase_impl.dart';
import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/repository/auth/register_account_repository.dart';

final registerAccountUsecaseProvider = Provider(
  (ref) => RegisterAccountUsecaseImpl(
    registerAccountRepository: ref.watch(registerAccountRepositoryProvider)
  )
);

abstract class RegisterAccountUsecase {
  Future<Auth> execute(String name, String email, String password);
}