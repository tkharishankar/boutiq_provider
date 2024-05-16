import 'package:boutiq_provider/features/data/models/order/order_summary.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repositories/order_repo.dart';

part 'order_bloc.freezed.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepo orderRepo;

  OrderBloc({required this.orderRepo}) : super(_Initial()) {
    on<GetOrders>(_getOrders);
    on<GetOrderStatusTraces>(_getOrderStatusTraces);
  }

  Future<void> _getOrders(GetOrders getOrders, Emitter<OrderState> emit) async {
    emit(const OrderState.loading());
    final failureOrSuccess = await orderRepo.getOrders(getOrders.providerID);
    failureOrSuccess.fold((failure) {
      emit(OrderState.onOrderListError(failure.errorMessage));
    }, (success) {
      emit(OrderState.onOrderList(success));
    });
  }

  Future<void> _getOrderStatusTraces(GetOrderStatusTraces getOrders, Emitter<OrderState> emit) async {
    emit(const OrderState.orderStatusTracesLoading());
    final failureOrSuccess = await orderRepo.getOrderStatusTraces(getOrders.orderId);
    failureOrSuccess.fold((failure) {
      emit(OrderState.onOrderListError(failure.errorMessage));
    }, (success) {
      emit(OrderState.orderStatusTracesList(success));
    });
  }
}
