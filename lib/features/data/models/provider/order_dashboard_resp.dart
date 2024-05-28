import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_dashboard_resp.freezed.dart';
part 'order_dashboard_resp.g.dart';

@freezed
class OrderDashboardResp with _$OrderDashboardResp {
  const factory OrderDashboardResp({
    required int deliveredOrders,
    required int shippedOrders,
    required int createdOrders,
    required int canceledOrders,
    required int orders,
    required int amount,
    required int productAmount,
    required int deliveryAmount,
  }) = _OrderDashboardResp;

  factory OrderDashboardResp.fromJson(Map<String, dynamic> json) =>
      _$OrderDashboardRespFromJson(json);
}