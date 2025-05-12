import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium_finance/features/authenitcation/forgot_password.dart';
import 'package:pretium_finance/features/authenitcation/login.dart';
import 'package:pretium_finance/features/authenitcation/registration.dart';
import 'package:pretium_finance/features/onboarding/onboarding_screens.dart';
import 'package:pretium_finance/splash_screen.dart';

// Reusable fade transition page builder
Page<dynamic> fadeTransitionPageBuilder(BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: animation,
        child: child,
      );
    },
  );
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  redirect: (BuildContext context, GoRouterState state) async{
    // Replace this method depends on how you are managing your user's
    // Sign in status, then return the appropriate route you want to redirect to,
    // make sure your login/authentication bloc is provided at the top level
    // of your app
    // state.
    return;
  },
  initialLocation: '/splash',
  // * Passing a navigatorKey causes an issue on hot reload:
  // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
  // * However it's still necessary otherwise the navigator pops back to
  // * root on hot reload
  navigatorKey: rootNavigatorKey,

  // debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: "/splash",
      name: SplashScreen.routeName,
      pageBuilder: (context, state) => fadeTransitionPageBuilder(context, state, const SplashScreen()),
    ),

    GoRoute(
      path: "/onboarding",
      name: OnboardingScreens.routeName,
      pageBuilder: (context, state) => fadeTransitionPageBuilder(context, state, const OnboardingScreens()),
    ),

    GoRoute(
      path: "/login",
      name: LoginScreen.routeName,
      pageBuilder: (context, state) => fadeTransitionPageBuilder(context, state, const LoginScreen()),
    ),

    GoRoute(
      path: "/registration",
      name: RegistrationScreen.routeName,
      pageBuilder: (context, state) => fadeTransitionPageBuilder(context, state, const RegistrationScreen()),
    ),

    GoRoute(
      path: "/forgot_password",
      name: ForgotPasswordScreen.routeName,
      pageBuilder: (context, state) => fadeTransitionPageBuilder(context, state, const ForgotPasswordScreen()),
    ),
  

  ],
);
