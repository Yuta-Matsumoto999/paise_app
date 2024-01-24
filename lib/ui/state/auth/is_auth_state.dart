import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:praise_app_flutter/domain/entity/auth/auth.dart';

part 'is_auth_state.freezed.dart';

@freezed
class IsAuthState with _$IsAuthState {
  factory IsAuthState({
    required bool isAuth,
    String? message
  }) = _IsAuthState;

  factory IsAuthState.fromEntity(Auth auth) {
    return IsAuthState(
      isAuth: auth.isAuth,
      message: auth.message
    );
  }
}