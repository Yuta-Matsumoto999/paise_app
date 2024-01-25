import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/core/constants/message_ja.dart';
import 'package:praise_app_flutter/core/exception/auth/form_Is_valid_exception.dart';
import 'package:praise_app_flutter/domain/usecase/auth/register_account_usecase.dart';
import 'package:praise_app_flutter/ui/state/auth/is_auth_state.dart';
import 'package:praise_app_flutter/ui/view/validation/execute_validation.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/email_validator.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/max_validator.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/min_validator.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/required_validator.dart';

// validation Error Message
final registerNameErrorMessage = StateProvider.autoDispose<String>((ref) => '');
final registerEmailErrorMessage = StateProvider.autoDispose<String>((ref) => '');
final registerPasswordErrorMessage = StateProvider.autoDispose<String>((ref) => '');

// button
final registerButtonActive = StateProvider.autoDispose<bool>((ref) => true);
final registerButtonLoading = StateProvider.autoDispose<bool>((ref) => false);

// form
final registerFormActive = StateProvider.autoDispose<bool>((ref) => true);

// register実行
final registerExecuteProvider = StateNotifierProvider.autoDispose<RegisterExecuteNotifier, AsyncValue<IsAuthState>>(
  (ref) => RegisterExecuteNotifier(
    registerAccountUsecase: ref.read(registerAccountUsecaseProvider),
    ref: ref
  )
);

class RegisterExecuteNotifier extends StateNotifier<AsyncValue<IsAuthState>> {
  final RegisterAccountUsecase _registerAccountUsecase;
  final Ref ref;

  RegisterExecuteNotifier({
    required RegisterAccountUsecase registerAccountUsecase,
    required this.ref
  }) : _registerAccountUsecase = registerAccountUsecase,
  super(const AsyncLoading());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    var name = nameController.text;
    var email = emailController.text;
    var password = passwordController.text;

    final isValid = await validate(name, email, password, ref);
    if(isValid) {
      state = await AsyncValue.guard(() async {
        final res = await _registerAccountUsecase.execute(name, email, password);
        return IsAuthState.fromEntity(res);
      });
    } else {
      state = AsyncValue.error(FormIsValidException(MessageJa.authInValidValue), StackTrace.fromString(MessageJa.authInValidValue));
    }
  }

  Future<bool> validate(name, email, password, ref) async {
    // ここでvalidation
    final List<dynamic> nameIsValid = ExecuteValidation(validators:[RequiredValidator()]).execute(name);
    final List<dynamic> emailIsValid = ExecuteValidation(validators:[RequiredValidator(), EmailValidator()]).execute(email);
    final List<dynamic> passwordIsValid = ExecuteValidation(validators:[RequiredValidator(), MinValidator(6), MaxValidator(100)]).execute(password);

    if(nameIsValid[1] && emailIsValid[1] && passwordIsValid[1]) {
      return true;
    } else {  
      ref.read(registerNameErrorMessage.notifier).state = nameIsValid[0];
      ref.read(registerEmailErrorMessage.notifier).state = emailIsValid[0];
      ref.read(registerPasswordErrorMessage.notifier).state = passwordIsValid[0];
      return false;
    }
  }
}