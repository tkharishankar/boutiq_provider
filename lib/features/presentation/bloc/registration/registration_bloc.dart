import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecase/registration/registration_usecase.dart';

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
    final failureOrSuccess = await registerUsecase.call(Params(
       body: {
         'phoneNumber': event.phoneNumber,
         'companyName': event.companyName,
         'email': event.email,
         'password': event.password
       }));

    failureOrSuccess.fold((failure) {
      emit(RegistrationState.registrationError(failure.errorMessage));
    }, (success) {
      emit(RegistrationState.registrationSuccessful(success.message!));
    });
  }
}
