import 'package:boutiq_provider/features/data/datasource/remote/product_remote_firebase.dart';
import 'package:boutiq_provider/features/domain/repositories/product_repo.dart';
import 'package:get_it/get_it.dart';

import '../core/local_storage/app_cache.dart';
import '../features/presentation/bloc/product/product_bloc.dart';

final productLocator = GetIt.instance;

Future<void> registerProductDependencies() async {
  productLocator
      .registerFactory(() => ProductBloc(productRepo: productLocator()));

  productLocator.registerLazySingleton<ProductRepo>(
      () => ProductRepository(productRemoteDataSource: productLocator()));

  productLocator.registerLazySingleton<ProductRemoteDataSource>(() =>
      IProductRemoteDataSource(
          apiService: productLocator(), appCache: productLocator()));
}
