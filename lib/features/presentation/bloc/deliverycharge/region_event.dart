
part of 'region_bloc.dart';

abstract class RegionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchRegions extends RegionEvent {}

class UpdateDeliveryCharges extends RegionEvent {
  final DeliveryChargeReq deliveryChargeReq;

  UpdateDeliveryCharges({
    required this.deliveryChargeReq,
  });

  @override
  List<Object?> get props => [deliveryChargeReq];
}