import 'dart:developer';

import 'package:boutiq_provider/features/data/datasource/remote/product_remote_firebase.dart';
import 'package:boutiq_provider/features/data/models/deliverycharge/delivery_charge.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/local_storage/app_cache.dart';
import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_service.dart';

abstract class DeliveryChargeDataSource {
  Future<Either<ApiError, List<Region>>> getRegions();

  Future<Either<ApiError, bool>> updateDeliveryCharges(
      DeliveryChargeReq deliveryChargeReq);
}

class IDeliveryChargeDataSource implements DeliveryChargeDataSource {
  final ApiService? apiService;
  final AppCache? appCache;

  IDeliveryChargeDataSource({this.apiService, this.appCache});

  @override
  Future<Either<ApiError, List<Region>>> getRegions() async {
    try {
      final providerId = appCache?.getProviderId();
      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in adding product size. Please re-login and try again.");
      }

      final response = await apiService!.getRegionList(providerId);
      if (response.response.statusCode == 200) {
        List<Map<String, dynamic>> jsonList =
            response.response.data.cast<Map<String, dynamic>>();
        List<Region> orders =
            jsonList.map((json) => Region.fromJson(json)).toList();
        return Right(orders);
      } else {
        return Left(ApiError(
            errorCode: response.response.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        final errorMessage =
            error.response!.data['statusMessage'] ?? 'Unknown error';
        return Left(ApiError(errorCode: "400", errorMessage: errorMessage));
      } else {
        return Left(ApiError(
            errorCode: error.response!.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }
    }
  }

  @override
  Future<Either<ApiError, bool>> updateDeliveryCharges(
      DeliveryChargeReq deliveryChargeReq) async {
    try {
      final providerId = appCache?.getProviderId();
      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in adding product size. Please re-login and try again.");
      }

      final response = await apiService!
          .updateDeliveryCharges(providerId, deliveryChargeReq);

      if (response.response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(ApiError(
            errorCode: response.response.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }
    } on DioException catch (error) {
      return _handleDioException(error);
    }
  }

  Either<ApiError, bool> _handleDioException(DioException error) {
    final errorMessage =
        error.response?.data['statusMessage'] ?? 'Unknown error';
    return Left(ApiError(
      errorCode: error.response?.statusCode.toString() ?? 'Unknown',
      errorMessage: errorMessage,
    ));
  }
}
