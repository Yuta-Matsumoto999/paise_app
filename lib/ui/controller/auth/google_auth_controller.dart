import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/domain/usecase/auth/google_auth_usecase.dart';
import 'package:praise_app_flutter/ui/state/auth/is_auth_state.dart';

final googleAuthExecuteProvider = StateNotifierProvider<GoogleAuthExecuteNotifier, AsyncValue<IsAuthState>>(
  (ref) => GoogleAuthExecuteNotifier(
    googleAuthUsecase: ref.read(googleAuthUsecaseProvider)
  )
);

class GoogleAuthExecuteNotifier extends StateNotifier<AsyncValue<IsAuthState>> {
  final GoogleAuthUsecase _googleAuthUsecase;

  GoogleAuthExecuteNotifier({
    required GoogleAuthUsecase googleAuthUsecase
  }) : _googleAuthUsecase = googleAuthUsecase,
  super(const AsyncLoading());
  
  Future<void> execute() async {
    state = await AsyncValue.guard(() async {
      final res = await _googleAuthUsecase.execute();
      return IsAuthState.fromEntity(res);
    });
  }
}