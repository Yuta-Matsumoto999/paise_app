import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:praise_app_flutter/core/constants/custom_color.dart';
import 'package:praise_app_flutter/ui/view/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: navigator(context), 
      builder: (context, index) {
        return Container(
            width: size.width * 1,
            height: size.height * 1,
            decoration: const BoxDecoration(
              color: Color(CustomColor.mainColor)
            ),
            child: SizedBox()
          );
        }
      );
  }

  Future navigator(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final session = prefs.getString('session');

    if(session != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        AutoRouter.of(context).pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        AutoRouter.of(context).pushAndPopUntil(const WelcomeRoute(), predicate: (route) => false);
      });
    }
  }
}