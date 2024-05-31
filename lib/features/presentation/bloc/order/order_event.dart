part of 'order_bloc.dart';

class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class GetOrders extends OrderEvent {

  const GetOrders();
}

class GetOrderStatusTraces extends OrderEvent {
  final String orderId;

  const GetOrderStatusTraces({required this.orderId});
}

class UpdateOrderStatus extends OrderEvent {
  final String orderId;
  final OrderStatus status;

  const UpdateOrderStatus({required this.orderId, required this.status});
}
