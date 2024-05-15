import 'package:boutiq_provider/di/order_locator.dart';
import 'package:boutiq_provider/di/product_locator.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/local_storage/app_cache.dart';
import '../core/network/api_service.dart';
import '../core/network/network_info.dart';
import 'auth_service_locator.dart';

final sl = GetIt.I;

Future<void> injector() async {

  final Dio dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';
  final ApiService apiService = ApiService(dio);
  sl.registerSingleton<ApiService>(apiService);

  await registerAuthDependencies();
  await registerProductDependencies();
  await registerOrderDependencies();

  sl
    ..registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(InternetConnectionChecker()))
    ..registerLazySingleton<AppCache>(() => AppCacheImpl());
}
