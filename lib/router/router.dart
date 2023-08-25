import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_tn_boutique/features/auth/presentation/login/login_screen.dart';
import 'package:mobile_tn_boutique/features/dashboard/dashboard_screen.dart';
import 'package:mobile_tn_boutique/features/onboarding_screen.dart';

import '../features/auth/presentation/otp/otp_screen.dart';
import '../features/auth/presentation/registration/registration_screen.dart';
import '../features/splash_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RouteConstants.initial,
      redirect: (context, state) async {},
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
            path: '/',
            name: RouteConstants.initial,
            builder: (context, state) => const SplashScreen(),
            routes: [
              GoRoute(
                path: 'boarding',
                name: RouteConstants.onboarding,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const OnBoardingScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Change the opacity of the screen using a Curve based on the the animation's
                      // value
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
              GoRoute(
                path: 'register',
                name: RouteConstants.register,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const RegistrationScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Change the opacity of the screen using a Curve based on the the animation's
                      // value
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
              GoRoute(
                path: 'login',
                name: RouteConstants.login,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const LoginScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Change the opacity of the screen using a Curve based on the the animation's
                      // value
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
              GoRoute(
                path: 'otp',
                name: RouteConstants.verifyOtp,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const OtpScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Change the opacity of the screen using a Curve based on the the animation's
                      // value
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
              GoRoute(
                path: 'home',
                name: RouteConstants.home,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const HomeScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // Change the opacity of the screen using a Curve based on the the animation's
                      // value
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ])
      ]);
}

class RouteConstants {
  static String initial = '/';
  static String onboarding = 'onboarding';
  static String login = 'login';
  static String register = 'register';
  static String verifyOtp = 'otp';
  static String home = 'home';
}
