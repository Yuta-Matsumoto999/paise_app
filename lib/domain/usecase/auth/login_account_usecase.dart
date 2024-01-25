import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/application/usecase/auth/login_account_usecase_impl.dart';
import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/repository/auth/login_account_repository.dart';

final loginAccountUsecaseProvider = Provider(
  (ref) => LoginAccountUsecaseImpl(
    loginAccountRepository: ref.watch(loginAccountRepositoryProvider)
  )
);

abstract class LoginAccountUsecase {
  Future<Auth> execute(String email, String password);
}