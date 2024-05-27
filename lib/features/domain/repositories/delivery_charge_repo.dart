
import 'package:boutiq_provider/features/data/models/deliverycharge/delivery_charge.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/api_error.dart';
import '../../data/datasource/remote/delivery_charge_remote.dart';

abstract class DeliveryChargeRepo {
  Future<Either<ApiError, List<Region>>> regions();

  Future<Either<ApiError, bool>> updateDeliveryCharges(
      DeliveryChargeReq deliveryChargeReq);
}

class DeliveryChargeRepository implements DeliveryChargeRepo {
  late DeliveryChargeDataSource deliveryChargeRemoteDataSource;

  DeliveryChargeRepository({required this.deliveryChargeRemoteDataSource});

  @override
  Future<Either<ApiError, List<Region>>> regions() async {
    try {
      return await deliveryChargeRemoteDataSource.getRegions();
    } on ApiError catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<ApiError, bool>> updateDeliveryCharges(DeliveryChargeReq deliveryChargeReq) async {
    try {
      return await deliveryChargeRemoteDataSource.updateDeliveryCharges(deliveryChargeReq);
    } on ApiError catch (error) {
      return Left(error);
    }
  }
}
