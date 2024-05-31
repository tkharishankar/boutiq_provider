import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/deliverycharge/delivery_charge.dart';
import '../../../domain/repositories/delivery_charge_repo.dart';

part 'region_bloc.freezed.dart';

part 'region_event.dart';

part 'region_state.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  final DeliveryChargeRepo deliveryChargeRepo;

  RegionBloc({required this.deliveryChargeRepo}) : super(const RegionState.initial()) {
    on<FetchRegions>(_onFetchRegions);
    on<UpdateDeliveryCharges>(_onUpdateDeliveryCharges);
  }

  Future<void> _onFetchRegions(FetchRegions event, Emitter<RegionState> emit) async {
    emit(const RegionState.loading());
    final failureOrSuccess = await deliveryChargeRepo.regions();
    failureOrSuccess.fold(
          (failure) => emit(RegionState.error(failure.errorMessage)),
          (success) => emit(RegionState.loaded(success)),
    );
  }

  Future<void> _onUpdateDeliveryCharges(UpdateDeliveryCharges event, Emitter<RegionState> emit) async {
    emit(const RegionState.loading());
    final failureOrSuccess = await deliveryChargeRepo.updateDeliveryCharges(event.deliveryChargeReq);
    await failureOrSuccess.fold(
          (failure) async {
        emit(RegionState.error(failure.errorMessage));
      },
          (success) async {
        final updatedRegions = await deliveryChargeRepo.regions();
        updatedRegions.fold(
              (failure) => emit(RegionState.error(failure.errorMessage)),
              (regions) => emit(RegionState.loaded(regions)),
        );
      },
    );
  }
}


