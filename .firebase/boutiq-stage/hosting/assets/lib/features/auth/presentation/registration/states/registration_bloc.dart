import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/registration_usecase.dart';

part 'registration_bloc.freezed.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUsecase registerUsecase;

  RegistrationBloc({required this.registerUsecase}) : super(_Initial()) {
    on<RegisterUser>(_onRegisterUser);
  }

  Future<void> _onRegisterUser(
      RegisterUser event, Emitter<RegistrationState> emit) async {
    emit(const RegistrationState.loading());
    if (event.phoneNumber.isEmpty || event.username.isEmpty) {
      emit(const RegistrationState.registrationError(
          "Please enter the username & phone number!"));
      return;
    }
    if (event.password.isEmpty) {
      emit(const RegistrationState.registrationError(
          "Please enter the password or confirm password"));
    }
    final failureOrSuccess = await registerUsecase.call(Params(
        phoneNumber: event.phoneNumber,
        username: event.username,
        password: event.password));

    failureOrSuccess.fold((failure) {
      emit(RegistrationState.registrationError(failure.errorMessage));
    }, (success) {
      emit(RegistrationState.registrationSuccessful(success.message));
    });
  }
}
