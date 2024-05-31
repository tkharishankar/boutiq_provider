import 'package:boutiq_provider/features/data/datasource/remote/delivery_charge_remote.dart';
import 'package:boutiq_provider/features/presentation/bloc/deliverycharge/region_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/domain/repositories/delivery_charge_repo.dart';

final deliveryChargeLocator = GetIt.instance;

Future<void> registerDeliveryChargeDependencies() async {
  deliveryChargeLocator.registerFactory(
      () => RegionBloc(deliveryChargeRepo: deliveryChargeLocator()));

  deliveryChargeLocator.registerLazySingleton<DeliveryChargeRepo>(() =>
      DeliveryChargeRepository(
          deliveryChargeRemoteDataSource: deliveryChargeLocator()));

  deliveryChargeLocator.registerLazySingleton<DeliveryChargeDataSource>(() =>
      IDeliveryChargeDataSource(
          apiService: deliveryChargeLocator(),
          appCache: deliveryChargeLocator()));
}
