import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:praise_app_flutter/ui/view/router/app_router.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "THIS IS SPLASH PAGE", 
              style: TextStyle(fontWeight: FontWeight.w900),
            )
          ),
          ElevatedButton(
            onPressed: () => {
              AutoRouter.of(context).push(const WelcomeRoute())
            }, 
            child:  const Text("画面遷移")
          )
        ],
      )
    );
  }
}