import 'package:boutiq_provider/core/network/api_error.dart';
import 'package:boutiq_provider/features/data/models/order/order_summary.dart';
import 'package:dartz/dartz.dart';

import '../../data/datasource/remote/order_remote_firebase.dart';

abstract class OrderRepo {

  Future<Either<ApiError, List<OrderSummary>>> getOrders(String providerID);
}

class OrderRepository implements OrderRepo {
  late OrderRemoteDataSource orderRemoteDataSource;

  OrderRepository({required this.orderRemoteDataSource});

  @override
  Future<Either<ApiError, List<OrderSummary>>> getOrders(String providerID) async {
    return await orderRemoteDataSource.getOrder(providerID);
  }
}
