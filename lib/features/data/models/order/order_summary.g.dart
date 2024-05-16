// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      addressName: json['addressName'] as String?,
      name: json['name'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      label: json['label'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'addressName': instance.addressName,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'label': instance.label,
      'address': instance.address,
    };

_$PaymentDataImpl _$$PaymentDataImplFromJson(Map<String, dynamic> json) =>
    _$PaymentDataImpl(
      transactionId: json['transactionId'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toInt(),
      deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
      subTotalAmount: (json['subTotalAmount'] as num?)?.toInt(),
      paymentState: json['paymentState'] as String?,
    );

Map<String, dynamic> _$$PaymentDataImplToJson(_$PaymentDataImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'totalAmount': instance.totalAmount,
      'deliveryFee': instance.deliveryFee,
      'subTotalAmount': instance.subTotalAmount,
      'paymentState': instance.paymentState,
    };

_$ProductItemImpl _$$ProductItemImplFromJson(Map<String, dynamic> json) =>
    _$ProductItemImpl(
      productId: json['productId'] as String?,
      providerId: json['providerId'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      productSize: json['productSize'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      totalAmount: (json['totalAmount'] as num?)?.toInt(),
      deliveryPrice: (json['deliveryPrice'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductItemImplToJson(_$ProductItemImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'providerId': instance.providerId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'quantity': instance.quantity,
      'productSize': instance.productSize,
      'price': instance.price,
      'totalAmount': instance.totalAmount,
      'deliveryPrice': instance.deliveryPrice,
    };

_$OrderSummaryImpl _$$OrderSummaryImplFromJson(Map<String, dynamic> json) =>
    _$OrderSummaryImpl(
      customerId: json['customerId'] as String?,
      orderId: json['orderId'] as String?,
      providerId: json['providerId'] as String?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      paymentData: json['paymentData'] == null
          ? null
          : PaymentData.fromJson(json['paymentData'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      productItems: (json['productItems'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OrderSummaryImplToJson(_$OrderSummaryImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'orderId': instance.orderId,
      'providerId': instance.providerId,
      'status': _$OrderStatusEnumMap[instance.status],
      'paymentData': instance.paymentData,
      'address': instance.address,
      'productItems': instance.productItems,
      'updatedAt': instance.updatedAt,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.CART: 'CART',
  OrderStatus.INITIATED: 'INITIATED',
  OrderStatus.CREATED: 'CREATED',
  OrderStatus.SHIPPED: 'SHIPPED',
  OrderStatus.DISPATCHED: 'DISPATCHED',
  OrderStatus.DELIVERED: 'DELIVERED',
  OrderStatus.CANCELED: 'CANCELED',
};

_$OrderStatusTraceImpl _$$OrderStatusTraceImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderStatusTraceImpl(
      orderId: json['orderId'] as String,
      orderStatus: $enumDecode(_$OrderStatusEnumMap, json['orderStatus']),
      timestamp: (json['timestamp'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderStatusTraceImplToJson(
        _$OrderStatusTraceImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderStatus': _$OrderStatusEnumMap[instance.orderStatus]!,
      'timestamp': instance.timestamp,
    };
