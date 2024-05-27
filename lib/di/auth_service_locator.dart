import 'package:get_it/get_it.dart';

import '../features/data/datasource/remote/authentication_remote_firebase.dart';
import '../features/domain/repositories/authentication_repo.dart';
import '../features/domain/usecase/login/login_usecase.dart';
import '../features/domain/usecase/registration/registration_usecase.dart';
import '../features/presentation/bloc/login/login_bloc.dart';
import '../features/presentation/bloc/registration/registration_bloc.dart';

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
      () => IAuthenticationRemoteDataSource(apiService: authLocator(),appCache: authLocator()));
}
