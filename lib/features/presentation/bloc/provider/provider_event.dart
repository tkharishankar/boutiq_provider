part of 'provider_bloc.dart';

class ProviderEvent extends Equatable{
  const ProviderEvent();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class GetDashboardDetail extends ProviderEvent {

  const GetDashboardDetail();
}

class GetProviderDetail extends ProviderEvent {

  const GetProviderDetail();
}