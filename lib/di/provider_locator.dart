import 'package:boutiq_provider/features/data/datasource/remote/product_remote_firebase.dart';
import 'package:boutiq_provider/features/data/datasource/remote/provider_remote_firebase.dart';
import 'package:boutiq_provider/features/domain/repositories/provider_repo.dart';
import 'package:get_it/get_it.dart';

import '../features/presentation/bloc/provider/provider_bloc.dart';

final providerLocator = GetIt.instance;

Future<void> registerProviderDependencies() async {
  providerLocator.registerFactory(() => ProviderBloc(providerRepo: providerLocator()));

  providerLocator.registerLazySingleton<ProviderRepo>(
          () => ProviderRepository(providerRemoteDataSource: providerLocator()));

  providerLocator.registerLazySingleton<ProviderRemoteDataSource>(() =>
      IProviderRemoteDataSource(
          apiService: providerLocator(),
          appCache: providerLocator()
      ));
}
