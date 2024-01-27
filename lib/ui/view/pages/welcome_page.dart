import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/core/constants/custom_color.dart';
import 'package:praise_app_flutter/ui/view/components/button/google_auth_button.dart';
import 'package:praise_app_flutter/ui/view/components/button/rounded_button.dart';
import 'package:praise_app_flutter/ui/view/router/app_router.dart';

@RoutePage()
class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(CustomColor.titleText)
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Text(
                "Googleアカウント or メールアドレスでこのアプリの利用を開始できます。",
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
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: RoundedButton(
                      text: "Sign Up", 
                      textColor: CustomColor.authButtonText, 
                      backgroundColor: CustomColor.mainColor,
                      buttonActive: true,
                      buttonLoading: false,
                      onPressed: (ref, context) => _fowardTo(ref, context)
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
              )
            ),
          ],
        )
      )
    );
  }

  Future<void> _fowardTo(ref, context) async {
    AutoRouter.of(context).push(const RegisterRoute());
  }
}