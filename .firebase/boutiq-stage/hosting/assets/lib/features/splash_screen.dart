import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/local_storage/app_cache.dart';
import '../di/injector.dart';
import '../router/router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final user = sl<AppCache>().getUserInfo();

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      final introState = sl<AppCache>().getIntroState();
      if (introState) {
        GoRouter.of(context).pushReplacementNamed(RouteConstants.login);
      } else {
        GoRouter.of(context).pushReplacementNamed(RouteConstants.onboarding);
      }
    } else {
      GoRouter.of(context).pushReplacementNamed(RouteConstants.home);
    }
    return const Scaffold(
      body: Center(child: Text("This is the screen after splash screen")),
    );
  }
}
