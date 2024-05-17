import 'package:boutiq_provider/core/network/api_error.dart';
import 'package:boutiq_provider/features/data/models/order/order_summary.dart';
import 'package:dartz/dartz.dart';

import '../../data/datasource/remote/order_remote_firebase.dart';

abstract class OrderRepo {
  Future<Either<ApiError, List<OrderSummary>>> getOrders(String providerID);

  Future<Either<ApiError, List<OrderStatusTrace>>> getOrderStatusTraces(
      String orderId);

  Future<Either<ApiError, String>> updateOrderStatus(
      String orderId, OrderStatusUpdateReq orderStatusUpdateReq);
}

class OrderRepository implements OrderRepo {
  late OrderRemoteDataSource orderRemoteDataSource;

  OrderRepository({required this.orderRemoteDataSource});

  @override
  Future<Either<ApiError, List<OrderSummary>>> getOrders(
      String providerID) async {
    return await orderRemoteDataSource.getOrder(providerID);
  }

  @override
  Future<Either<ApiError, List<OrderStatusTrace>>> getOrderStatusTraces(
      String orderId) async {
    return await orderRemoteDataSource.getOrderStatusTraces(orderId);
  }

  @override
  Future<Either<ApiError, String>> updateOrderStatus(
      String orderId, OrderStatusUpdateReq orderStatusUpdateReq) async {
    return await orderRemoteDataSource.updateOrderStatus(orderId, orderStatusUpdateReq);
  }
}
