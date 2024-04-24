import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/login_usecase.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(_Initial()) {
    on<LoginUser>(_onLogin);
  }

  Future<void> _onLogin(LoginUser event, Emitter<LoginState> emit) async {
    emit(const LoginState.loading());
    if (event.phoneNumber.isEmpty) {
      emit(const LoginState.loginError("Please enter the phone number!"));
      return;
    }
    final failureOrSuccess =
        await loginUsecase.call(Params(phoneNumber: event.phoneNumber,password: event.password));

    failureOrSuccess.fold((failure) {
      emit(LoginState.loginError(failure.errorMessage));
    }, (success) {
      emit(LoginState.loginSuccessful('Logged In succesfully'));
    });
  }
}
