import 'package:boutiq_provider/di/delivery_charge_locator.dart';
import 'package:boutiq_provider/di/order_locator.dart';
import 'package:boutiq_provider/features/presentation/bloc/deliverycharge/region_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

import 'di/auth_service_locator.dart';
import 'di/injector.dart';
import 'di/product_locator.dart';
import 'di/provider_locator.dart';
import 'features/presentation/bloc/login/login_bloc.dart';
import 'features/presentation/bloc/order/order_bloc.dart';
import 'features/presentation/bloc/product/product_bloc.dart';
import 'features/presentation/bloc/provider/provider_bloc.dart';
import 'features/presentation/bloc/registration/registration_bloc.dart';
import 'firebase_options.dart';
import 'router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await injector();
  await GetStorage.init();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true);
    return MultiBlocProvider(
        providers: [
          BlocProvider<RegistrationBloc>(
            create: (context) => authLocator<RegistrationBloc>(),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => authLocator<LoginBloc>(),
          ),
          BlocProvider<ProductBloc>(
            create: (context) => productLocator<ProductBloc>(),
          ),
          BlocProvider<OrderBloc>(
            create: (context) => orderLocator<OrderBloc>(),
          ),
          BlocProvider<RegionBloc>(
            create: (context) => deliveryChargeLocator<RegionBloc>(),
          ),
          BlocProvider<ProviderBloc>(
            create: (context) => providerLocator<ProviderBloc>(),
          ),
        ],
        child: MaterialApp.router(
          title: 'BoutiQ',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: const Color(0xFFE21F4E), fontFamily: 'onest'),
          scrollBehavior: const _AppScrollBehavior(),
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
        ));
  }
}

class _AppScrollBehavior extends ScrollBehavior {
  const _AppScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
