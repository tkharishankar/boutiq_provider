// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dashboard_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDashboardRespImpl _$$OrderDashboardRespImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDashboardRespImpl(
      deliveredOrders: (json['deliveredOrders'] as num).toInt(),
      shippedOrders: (json['shippedOrders'] as num).toInt(),
      createdOrders: (json['createdOrders'] as num).toInt(),
      canceledOrders: (json['canceledOrders'] as num).toInt(),
      orders: (json['orders'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      productAmount: (json['productAmount'] as num).toInt(),
      deliveryAmount: (json['deliveryAmount'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderDashboardRespImplToJson(
        _$OrderDashboardRespImpl instance) =>
    <String, dynamic>{
      'deliveredOrders': instance.deliveredOrders,
      'shippedOrders': instance.shippedOrders,
      'createdOrders': instance.createdOrders,
      'canceledOrders': instance.canceledOrders,
      'orders': instance.orders,
      'amount': instance.amount,
      'productAmount': instance.productAmount,
      'deliveryAmount': instance.deliveryAmount,
    };
