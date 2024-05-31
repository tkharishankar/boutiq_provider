import 'package:boutiq_provider/features/data/models/login/login_response.dart';
import 'package:boutiq_provider/features/data/models/provider/order_dashboard_resp.dart';
import 'package:dartz/dartz.dart';

import '../../../core/network/api_error.dart';
import '../../data/datasource/remote/provider_remote_firebase.dart';
import '../../presentation/bloc/provider/provider_bloc.dart';

abstract class ProviderRepo {
  Future<Either<ApiError, OrderDashboardResp>> getDashboardDetails();

  Future<Either<ApiError, Provider>> getGetProviderDetail();

  Future<Either<ApiError, bool>> updateProviderDetail(
      UpdateProviderDetail event);
}

class ProviderRepository implements ProviderRepo {
  late ProviderRemoteDataSource providerRemoteDataSource;

  ProviderRepository({required this.providerRemoteDataSource});

  @override
  Future<Either<ApiError, OrderDashboardResp>> getDashboardDetails() async {
    return await providerRemoteDataSource.getDashboardDetails();
  }

  @override
  Future<Either<ApiError, Provider>> getGetProviderDetail() async {
    return await providerRemoteDataSource.getGetProviderDetail();
  }

  @override
  Future<Either<ApiError, bool>> updateProviderDetail(
      UpdateProviderDetail event) async {
    return await providerRemoteDataSource.updateProviderDetail(event);
  }
}
