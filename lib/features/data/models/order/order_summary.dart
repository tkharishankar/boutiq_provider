import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_summary.freezed.dart';
part 'order_summary.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    String? addressName,
    String? name,
    String? mobileNumber,
    String? label,
    String? address,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class PaymentData with _$PaymentData {
  const factory PaymentData({
    String? transactionId,
    int? totalAmount,
    int? deliveryFee,
    int? subTotalAmount,
    String? paymentState,
  }) = _PaymentData;

  factory PaymentData.fromJson(Map<String, dynamic> json) => _$PaymentDataFromJson(json);
}

@freezed
class ProductItem with _$ProductItem {
  const factory ProductItem({
    String? productId,
    String? providerId,
    String? name,
    String? imageUrl,
    int? quantity,
    String? productSize,
    double? price,
    int? totalAmount,
    int? deliveryPrice,
  }) = _ProductItem;

  factory ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);
}

@freezed
class OrderSummary with _$OrderSummary {
  const factory OrderSummary({
    String? customerId,
    String? orderId,
    String? providerId,
    OrderStatus? status,
    PaymentData? paymentData,
    Address? address,
    List<ProductItem?>? productItems,
    int? updatedAt,
  }) = _OrderSummary;

  factory OrderSummary.fromJson(Map<String, dynamic> json) => _$OrderSummaryFromJson(json);
}

@freezed
class OrderStatusTrace with _$OrderStatusTrace {
  const factory OrderStatusTrace({
    required String orderId,
    required OrderStatus orderStatus,
    required int timestamp,
  }) = _OrderStatusTrace;

  factory OrderStatusTrace.fromJson(Map<String, dynamic> json) => _$OrderStatusTraceFromJson(json);
}

enum OrderStatus {
  CART, INITIATED, CREATED, SHIPPED, DISPATCHED, DELIVERED, CANCELED,
}