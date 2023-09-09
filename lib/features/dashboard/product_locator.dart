import 'package:boutiq_provider/features/dashboard/data/data_source/product_remote_firebase.dart';
import 'package:boutiq_provider/features/dashboard/data/repositories/product_repo.dart';
import 'package:boutiq_provider/features/dashboard/presentation/states/product_bloc.dart';
import 'package:get_it/get_it.dart';

final productLocator = GetIt.instance;

Future<void> registerProductDependencies() async {
  productLocator
      .registerFactory(() => ProductBloc(productRepo: productLocator()));

  productLocator.registerLazySingleton<ProductRepo>(
      () => ProductRepository(productRemoteDataSource: productLocator()));

  productLocator.registerLazySingleton<ProductRemoteDataSource>(
      () => IProductRemoteDataSource());
}
