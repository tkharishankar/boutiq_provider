import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/login/login_response.dart';
import '../../../domain/repositories/provider_repo.dart';
import '../../../data/models/provider/order_dashboard_resp.dart';

part 'provider_bloc.freezed.dart';
part 'provider_event.dart';
part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState>{
  final ProviderRepo providerRepo;

  ProviderBloc({required this.providerRepo}) : super(const ProviderState.initial()) {
    on<GetDashboardDetail>(_getDashboardDetail);
    on<GetProviderDetail>(_getGetProviderDetail);
  }

  Future<void> _getDashboardDetail(GetDashboardDetail event, Emitter<ProviderState> emit) async {
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

  Future<void> _getGetProviderDetail(GetProviderDetail event, Emitter<ProviderState> emit) async {
    emit(const ProviderState.loading());
    final failureOrSuccess = await providerRepo.getGetProviderDetail();
    failureOrSuccess.fold(
          (failure) {
        emit(ProviderState.onProviderDetailError(failure.errorMessage));
      },
          (success) {
        emit(ProviderState.onProviderDetail(success));
      },
    );
  }
}
