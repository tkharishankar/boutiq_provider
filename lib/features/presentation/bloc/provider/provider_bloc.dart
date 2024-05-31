import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cross_file/cross_file.dart';

import '../../../data/models/login/login_response.dart';
import '../../../domain/repositories/provider_repo.dart';
import '../../../data/models/provider/order_dashboard_resp.dart';

part 'provider_bloc.freezed.dart';

part 'provider_event.dart';

part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  final ProviderRepo providerRepo;

  ProviderBloc({required this.providerRepo})
      : super(const ProviderState.initial()) {
    on<GetDashboardDetail>(_getDashboardDetail);
    on<GetProviderDetail>(_getProviderDetail);
    on<UpdateProviderDetail>(_updateProviderDetail);
  }

  Future<void> _getDashboardDetail(
      GetDashboardDetail event, Emitter<ProviderState> emit) async {
    emit(const ProviderState.loading());
    final failureOrSuccess = await providerRepo.getDashboardDetails();
    failureOrSuccess.fold(
      (failure) {
        emit(ProviderState.onOrderDashboardDetailError(failure.errorMessage));
      },
      (success) {
        emit(ProviderState.onOrderDashboardDetail(success));
      },
    );
  }

  Future<void> _getProviderDetail(
      GetProviderDetail event, Emitter<ProviderState> emit) async {
    emit(const ProviderState.loading());
    final result = await providerRepo.getGetProviderDetail();
    await result.fold(
      (failure) async {
        emit(ProviderState.onProviderDetailError(failure.errorMessage));
      },
      (success) async {
        emit(ProviderState.onProviderDetail(success));
      },
    );
  }

  Future<void> _updateProviderDetail(
      UpdateProviderDetail event, Emitter<ProviderState> emit) async {
    emit(const ProviderState.loading());
    final result = await providerRepo.updateProviderDetail(event);
    await result.fold(
      (failure) async {
        emit(ProviderState.onProviderDetailError(failure.errorMessage));
      },
      (success) async {
        await _getProviderDetail(const GetProviderDetail(), emit);
      },
    );
  }
}
