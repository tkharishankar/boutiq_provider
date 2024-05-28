import 'dart:developer';

import 'package:boutiq_provider/features/data/datasource/remote/product_remote_firebase.dart';
import 'package:boutiq_provider/features/data/models/login/login_response.dart';
import 'package:boutiq_provider/features/data/models/provider/order_dashboard_resp.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/local_storage/app_cache.dart';
import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_service.dart';
import '../../models/order/order_summary.dart';

abstract class ProviderRemoteDataSource {
  Future<Either<ApiError, OrderDashboardResp>> getDashboardDetails();

  Future<Either<ApiError, Provider>> getGetProviderDetail();
}

class IProviderRemoteDataSource implements ProviderRemoteDataSource {
  final ApiService? apiService;
  final AppCache? appCache;

  IProviderRemoteDataSource({this.apiService, this.appCache});

  @override
  Future<Either<ApiError, OrderDashboardResp>> getDashboardDetails() async {
    try {
      final providerId = appCache?.getProviderId();
      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in fetching dashboard details. Please re-login and try again.");
      }
      final response = await apiService!.getDashboardDetails(providerId);
      if (response.response.statusCode == 200) {
        final json = response.response.data as Map<String, dynamic>;
        final product = OrderDashboardResp.fromJson(json);
        return Right(product);
      } else {
        return handleGeneralError("Error in getting details");
      }
    } on DioException catch (error) {
      return handleError(error);
    } catch (e) {
      print(e);
      return handleGeneralError(
          "Error in fetching dashboard details. Please re-login and try again.");
    }
  }

  @override
  Future<Either<ApiError, Provider>> getGetProviderDetail() async {
    try {
      final providerId = appCache?.getProviderId();
      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in fetching account details. Please re-login and try again.");
      }
      final response = await apiService!.getGetProviderDetail(providerId);
      print(response.response.data);
      if (response.response.statusCode == 200) {
        print(response.response.data);
        final json = response.response.data as Map<String, dynamic>;
        final product = Provider.fromJson(json);
        return Right(product);
      } else {
        return handleGeneralError("Error in getting details");
      }
    } on DioException catch (error) {
      return handleError(error);
    } catch (e) {
      print("getGetProviderDetail $e");
      return handleGeneralError(
          "Error in fetching account detail. Please re-login and try again.");
    }
  }
}
