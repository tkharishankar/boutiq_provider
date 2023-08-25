import 'package:get_it/get_it.dart';
import 'package:mobile_tn_boutique/features/auth/auth_service_locator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/local_storage/app_cache.dart';
import '../core/network/network_info.dart';

final sl = GetIt.I;

Future<void> injector() async {
  await registerAuthDependencies();

  sl
    ..registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(InternetConnectionChecker()))
    ..registerLazySingleton<AppCache>(() => AppCacheImpl());
}
