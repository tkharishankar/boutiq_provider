part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;

  const factory OrderState.loading() = _Loading;

  const factory OrderState.onOrderList(List<OrderSummary> products) = _OnLoaded;

  const factory OrderState.onOrderListError(String message) = _OnOrderListError;

}
