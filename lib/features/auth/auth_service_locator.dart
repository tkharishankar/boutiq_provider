import 'package:get_it/get_it.dart';

import 'data/data_source/authentication_remote_firebase.dart';
import 'data/repositories/authentication_repo.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/registration_usecase.dart';
import 'presentation/login/states/login_bloc.dart';
import 'presentation/registration/states/registration_bloc.dart';

final authLocator = GetIt.instance;

Future<void> registerAuthDependencies() async {
  authLocator
      .registerFactory(() => RegistrationBloc(registerUsecase: authLocator()));

  authLocator.registerFactory(() => LoginBloc(loginUsecase: authLocator()));

  authLocator.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(authLocator()));

  authLocator
      .registerLazySingleton<LoginUsecase>(() => LoginUsecase(authLocator()));

  authLocator.registerLazySingleton<AuthenticationRepo>(() =>
      AuthenticationRepository(authenticationRemoteDataSource: authLocator()));

  authLocator.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => IAuthenticationRemoteDataSource(apiService: authLocator()));
}
