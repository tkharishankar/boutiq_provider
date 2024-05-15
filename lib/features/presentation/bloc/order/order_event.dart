part of 'order_bloc.dart';

class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class GetOrders extends OrderEvent {
  final String providerID;

  const GetOrders({required this.providerID});
}

