import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/application/usecase/auth/google_auth_usecase_impl.dart';
import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/repository/auth/google_auth_repository.dart';

final googleAuthUsecaseProvider = Provider<GoogleAuthUsecase>(
  (ref) => GoogleAuthUsecaseImpl(
    googleAuthRepository: ref.watch(googleAuthRepositoryProvider))
);

abstract class GoogleAuthUsecase {
  Future<Auth> execute();
}