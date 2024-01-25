import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/core/constants/custom_color.dart';
import 'package:praise_app_flutter/ui/controller/auth/google_auth_controller.dart';
import 'package:praise_app_flutter/ui/view/components/snackBar/error_snack_bar.dart';
import 'package:praise_app_flutter/ui/view/router/app_router.dart';

class GoogleAuthButton extends ConsumerWidget {
  const GoogleAuthButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 26), 
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(CustomColor.authFormBoxShadow),
            offset: Offset(5, 5),
            blurRadius: 7.0, 
            spreadRadius: 1,
          )
        ]
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            execute(ref, context);
          }, 
          icon: Container(
            padding: const EdgeInsets.all(16),
            child: Image.asset('images/google_logo.png'),
          )
        )
      )
    );
  }

  void _showErrorSnackBar(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      ErrorSnackBar(message: message, context: context)
    );
  }

  Future<void> execute(WidgetRef ref, BuildContext context) async {
    await ref.read(googleAuthExecuteProvider.notifier).execute();
    final googleAuth = ref.watch(googleAuthExecuteProvider);

    googleAuth.when(
      data: (data) {
        if(data.isAuth == true) {
          AutoRouter.of(context).pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        }
      },
      error: (error, stack) {
        _showErrorSnackBar(context, error.toString());
      },
      loading: () {
        // 
      }
    );
  }
}