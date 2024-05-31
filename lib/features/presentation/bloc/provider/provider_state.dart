part of 'provider_bloc.dart';

@freezed
class ProviderState with _$ProviderState {
  const factory ProviderState.initial() = _Initial;

  const factory ProviderState.loading() = _Loading;

  const factory ProviderState.onOrderDashboardDetail(OrderDashboardResp resp) = _OnLoaded;

  const factory ProviderState.onProviderDetail(Provider provider) = _OnProviderDetailLoaded;

  const factory ProviderState.onOrderDashboardDetailError(String message) = _OnError;

  const factory ProviderState.onProviderDetailError(String message) = _OnProviderDetailError;
}