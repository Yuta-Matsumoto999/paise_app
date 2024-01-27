import 'package:auto_route/auto_route.dart';
import 'package:praise_app_flutter/ui/view/animation/custom_page_route_animation.dart';
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
    CustomRoute(page: SplashRoute.page, transitionsBuilder: CustomPageRouteAnimation.animate(), initial: true),
    CustomRoute(page: WelcomeRoute.page, transitionsBuilder: CustomPageRouteAnimation.animate()),
    CustomRoute(page: RegisterRoute.page, transitionsBuilder: CustomPageRouteAnimation.animate()),
    CustomRoute(page: LoginRoute.page, transitionsBuilder: CustomPageRouteAnimation.animate()),
    CustomRoute(page: ForgetPasswordRoute.page, transitionsBuilder: CustomPageRouteAnimation.animate()),
    CustomRoute(page: CompleteSendPasswordResetLinkRoute.page, transitionsBuilder: CustomPageRouteAnimation.animate()),

    // authenticated route
    CustomRoute(page: HomeRoute.page, transitionsBuilder: CustomPageRouteAnimation.animate())
  ];
}

