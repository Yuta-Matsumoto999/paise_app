import 'package:auto_route/auto_route.dart';
import 'package:praise_app_flutter/ui/view/pages/auth/complete_password_reset_page.dart';
import 'package:praise_app_flutter/ui/view/pages/auth/forget_password_page.dart';
import 'package:praise_app_flutter/ui/view/pages/auth/login_page.dart';
import 'package:praise_app_flutter/ui/view/pages/auth/register_page.dart';
import 'package:praise_app_flutter/ui/view/pages/home_page.dart';
import 'package:praise_app_flutter/ui/view/pages/splash_page.dart';
import 'package:praise_app_flutter/ui/view/pages/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    // ここにroutingを記載

    // auth
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: ForgetPasswordRoute.page),
    AutoRoute(page: CompleteSendPasswordResetLinkRoute.page),

    // home
    AutoRoute(page: HomeRoute.page)
  ];
} 