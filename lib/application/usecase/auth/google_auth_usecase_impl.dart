import 'package:praise_app_flutter/domain/entity/auth/auth.dart';
import 'package:praise_app_flutter/domain/repository/auth/google_auth_repository.dart';
import 'package:praise_app_flutter/domain/usecase/auth/google_auth_usecase.dart';

class GoogleAuthUsecaseImpl implements GoogleAuthUsecase {
  final GoogleAuthRepository _googleAuthRepository;

  GoogleAuthUsecaseImpl({
    required GoogleAuthRepository googleAuthRepository
  }) : _googleAuthRepository = googleAuthRepository;

  @override
  Future<Auth> execute() async {
    final res = await _googleAuthRepository.execute();
    return res;
  }
}