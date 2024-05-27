import 'package:boutiq_provider/features/data/datasource/remote/order_remote_firebase.dart';
import 'package:boutiq_provider/features/domain/repositories/order_repo.dart';
import 'package:boutiq_provider/features/presentation/bloc/order/order_bloc.dart';
import 'package:get_it/get_it.dart';

final orderLocator = GetIt.instance;

Future<void> registerOrderDependencies() async {
  orderLocator.registerFactory(() => OrderBloc(orderRepo: orderLocator()));

  orderLocator.registerLazySingleton<OrderRepo>(
      () => OrderRepository(orderRemoteDataSource: orderLocator()));

  orderLocator.registerLazySingleton<OrderRemoteDataSource>(() =>
      IOrderRemoteDataSource(
          apiService: orderLocator(), appCache: orderLocator()));
}
