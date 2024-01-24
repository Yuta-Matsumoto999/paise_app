import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/core/constants/custom_color.dart';
import 'package:praise_app_flutter/ui/controller/auth/register_conotroller.dart';
import 'package:praise_app_flutter/ui/controller/botton_controller.dart';
import 'package:praise_app_flutter/ui/controller/form_controller.dart';
import 'package:praise_app_flutter/ui/view/components/button/google_auth_button.dart';
import 'package:praise_app_flutter/ui/view/components/button/rounded_button.dart';
import 'package:praise_app_flutter/ui/view/components/form/auth_text_form.dart';
import 'package:praise_app_flutter/ui/view/components/snackBar/error_snack_bar.dart';
import 'package:praise_app_flutter/ui/view/router/app_router.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/email_validator.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/max_validator.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/min_validator.dart';
import 'package:praise_app_flutter/ui/view/validation/validator/required_validator.dart';

@RoutePage()
class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(CustomColor.titleText)
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Text(
                "Googleアカウント or メールアドレスでこのアプリのアカウントを作成することができます。",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Sign Up with Google",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Color(CustomColor.titleText)
                      )
                    )
                  ),
                  const GoogleAuthButton(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Column(
                      children: [
                        Center(
                          child: Text(
                            "or SignUp with",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 14
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "email",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 14
                            ),
                          ),
                        ),
                      ],
                    )
                    
                  )
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  AuthTextForm(
                    label: "name", 
                    hintText: "name",
                    isPassword: false, 
                    formController: ref.read(registerExecuteProvider.notifier).nameController, 
                    formErrorProvider: registerNameErrorMessage, 
                    validators: [
                      RequiredValidator()
                    ]
                  ),
                  AuthTextForm(
                    label: "email", 
                    hintText: "email",
                    isPassword: false, 
                    formController: ref.read(registerExecuteProvider.notifier).emailController, 
                    formErrorProvider: registerEmailErrorMessage, 
                    validators: [
                      RequiredValidator(),
                      EmailValidator()
                    ]
                  ),
                  AuthTextForm(
                    label: "password",
                    hintText: "password",
                    isPassword: true, 
                    formController: ref.read(registerExecuteProvider.notifier).passwordController, 
                    formErrorProvider: registerPasswordErrorMessage, 
                    validators: [
                      RequiredValidator(),
                      MinValidator(6),
                      MaxValidator(100)
                    ]
                  ),
                  RoundedButton(
                    text: "Sign Up", 
                    textColor: CustomColor.authButtonText, 
                    backgroundColor: CustomColor.mainColor,
                    onPressed: (ref, context) => _register(ref, context)
                  )
                ]
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "すでにアカウントをお持ちですか？",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).pushAndPopUntil(const LoginRoute(), predicate:(route) => false);
                    }, 
                    child: const Text(
                      "ログイン",
                      style: TextStyle(
                        fontWeight: FontWeight.w800
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showErrorSnackBar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      ErrorSnackBar(message: message, context: context)
    );
  }

  Future<void> _register(WidgetRef ref, BuildContext context) async {
    await ref.read(registerExecuteProvider.notifier).register();
    final registerProvider = ref.watch(registerExecuteProvider);

    registerProvider.when(
      data: (data) {
        ref.read(isFormEdit.notifier).state = true;
        ref.read(isButtonActive.notifier).state = true;
        ref.read(isButtonLoading.notifier).state = false;
        if(data.isAuth == true) {
          AutoRouter.of(context).pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        }
      },
      error: (error, stack) {
        ref.read(isFormEdit.notifier).state = true;
        ref.read(isButtonActive.notifier).state = true;
        ref.read(isButtonLoading.notifier).state = false;
        _showErrorSnackBar(context, error.toString());
      },
      loading: () {
        // 
      }
    );
  }
}