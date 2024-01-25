// error message
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/core/constants/message_ja.dart';
import 'package:praise_app_flutter/core/exception/auth/form_Is_valid_exception.dart';
import 'package:praise_app_flutter/domain/usecase/auth/login_account_usecase.dart';
import 'package:praise_app_flutter/ui/state/auth/is_auth_state.dart';
import 'package:praise_app_flutter/ui/view/validation/execute_validation.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/email_validator.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/max_validator.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/min_validator.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/required_validator.dart';

// error message
final loginEmailErrorMessage = StateProvider.autoDispose<String>((ref) => '');
final loginPasswordErrorMessage = StateProvider.autoDispose<String>((ref) => '');

// button
final loginButtonActive = StateProvider.autoDispose<bool>((ref) => true);
final loginButtonLoading = StateProvider.autoDispose<bool>((ref) => false);

// form
final loginFormActive = StateProvider.autoDispose<bool>((ref) => true);

// login実行
final loginExecuteProvider = StateNotifierProvider.autoDispose<LoginExecuteNotifier, AsyncValue<IsAuthState>>(
  (ref) => LoginExecuteNotifier(
    ref: ref,
    loginAccountUsecase: ref.read(loginAccountUsecaseProvider)
  )
);

class LoginExecuteNotifier extends StateNotifier<AsyncValue<IsAuthState>> {
  final Ref ref;
  final LoginAccountUsecase _loginAccountUsecase;

  LoginExecuteNotifier({
    required this.ref,
    required LoginAccountUsecase loginAccountUsecase
  }) : _loginAccountUsecase = loginAccountUsecase,
  super(const AsyncLoading());

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  Future<void> login() async {
    var email = loginEmailController.text;
    var password = loginPasswordController.text;

    final isValid = await validate(email, password, ref);
    if(isValid) {
      state = await AsyncValue.guard(() async {
        final res = await _loginAccountUsecase.execute(email, password);
        return IsAuthState.fromEntity(res);
      });
    } else {
      state = AsyncValue.error(FormIsValidException(MessageJa.authInValidValue), StackTrace.fromString(MessageJa.authInValidValue));
    }
  }


  Future<bool> validate(email, password, ref) async {
    final List<dynamic> emailIsValid = ExecuteValidation(validators: [RequiredValidator(), EmailValidator()]).execute(email);
    final List<dynamic> passwordIsValid = ExecuteValidation(validators: [RequiredValidator(), MinValidator(6), MaxValidator(100)]).execute(password);

    if(emailIsValid[1] && passwordIsValid[1]) {
      return true;
    } else {
      ref.read(loginEmailErrorMessage.notifier).state = emailIsValid[0];
      ref.read(loginPasswordErrorMessage.notifier).state = passwordIsValid[0];

      return false;
    }
  }

}