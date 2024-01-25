import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/core/constants/custom_color.dart';
import 'package:praise_app_flutter/ui/controller/auth/login_controller.dart';
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
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(CustomColor.titleText)
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Text(
                "Googleアカウント or メールアドレスでこのアプリにログインすることができます。",
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
                      "Login with Google",
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
                            "or Login with",
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
                    label: "email", 
                    hintText: "email",
                    isPassword: false, 
                    formController: ref.read(loginExecuteProvider.notifier).loginEmailController, 
                    formErrorProvider: loginEmailErrorMessage,
                    formActive: ref.watch(loginFormActive),
                    validators: [
                      RequiredValidator(),
                      EmailValidator()
                    ]
                  ),
                  AuthTextForm(
                    label: "password",
                    hintText: "password",
                    isPassword: true, 
                    formController: ref.read(loginExecuteProvider.notifier).loginPasswordController, 
                    formErrorProvider: loginPasswordErrorMessage,
                    formActive: ref.watch(loginFormActive),
                    validators: [
                      RequiredValidator(),
                      MinValidator(6),
                      MaxValidator(100)
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        child: TextButton(
                          child: const Text(
                            "パスワードをお忘れですか？",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Colors.black
                            ),
                          ),
                          onPressed: () {
                            AutoRouter.of(context).pushAndPopUntil(const ForgetPasswordRoute(), predicate: (route) => false);
                          }
                        ),
                      ),
                    ],
                  ),
                  RoundedButton(
                    text: "Login", 
                    textColor: CustomColor.authButtonText, 
                    backgroundColor: CustomColor.mainColor,
                    buttonActive: ref.watch(loginButtonActive),
                    buttonLoading: ref.watch(loginButtonLoading),
                    onPressed: (ref, context) => _login(ref, context)
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
                    "アカウントを作成しますか？",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).pushAndPopUntil(const RegisterRoute(), predicate:(route) => false);
                    }, 
                    child: const Text(
                      "サインアップ",
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

  Future<void> _login(WidgetRef ref, BuildContext context) async {
    // await ref.read(loginExecuteProvider.notifier).login();
    final loginProvider = ref.watch(loginExecuteProvider);

    loginProvider.when(
      data: (data) {
        ref.read(loginFormActive.notifier).state = true;
        ref.read(loginButtonActive.notifier).state = true;
        ref.read(loginButtonLoading.notifier).state = false;
        if(data.isAuth == true) {
          AutoRouter.of(context).pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        }
      },
      error: (error, stack) {
        ref.read(loginFormActive.notifier).state = true;
        ref.read(loginButtonActive.notifier).state = true;
        ref.read(loginButtonLoading.notifier).state = false;
        _showErrorSnackBar(context, error.toString());
      }, 
      loading: () {
        ref.read(loginFormActive.notifier).state = false;
        ref.read(loginButtonActive.notifier).state = false;
        ref.read(loginButtonLoading.notifier).state = true;
      }
    );
  }
}