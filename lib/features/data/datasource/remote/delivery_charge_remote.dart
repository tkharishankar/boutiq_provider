import 'dart:developer';

import 'package:boutiq_provider/features/data/models/deliverycharge/delivery_charge.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_service.dart';

abstract class DeliveryChargeDataSource {
  Future<Either<ApiError, List<Region>>> getRegions(String providerID);

  Future<Either<ApiError, bool>> updateDeliveryCharges(DeliveryChargeReq deliveryChargeReq);
}

class IDeliveryChargeDataSource implements DeliveryChargeDataSource {
  final ApiService? apiService;

  IDeliveryChargeDataSource({this.apiService});

  @override
  Future<Either<ApiError, List<Region>>> getRegions(String providerID) async {
    try {
      final response = await apiService!.getRegionList("2342024PROV0662");
      print('response: ${response.response}');
      if (response.response.statusCode == 200) {
        List<Map<String, dynamic>> jsonList =
            response.response.data.cast<Map<String, dynamic>>();
        List<Region> orders =
            jsonList.map((json) => Region.fromJson(json)).toList();
        return Right(orders);
      } else {
        print('response statusCode: ${response.response.statusCode}');
        return Left(ApiError(
            errorCode: response.response.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }
    } on DioException catch (error) {
      print('DioException: ${error}');
      if (error.response?.statusCode == 400) {
        log('Bad request: ${error.response?.data}');
        final errorMessage =
            error.response!.data['statusMessage'] ?? 'Unknown error';
        return Left(ApiError(errorCode: "400", errorMessage: errorMessage));
      } else {
        log('Dio error: $error');
        return Left(ApiError(
            errorCode: error.response!.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }
    }
  }

  @override
  Future<Either<ApiError, bool>> updateDeliveryCharges(DeliveryChargeReq deliveryChargeReq) async {
    try {
      final response = await apiService!.updateDeliveryCharges("2342024PROV0662", deliveryChargeReq);
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
    print(error);
    final errorMessage =
        error.response?.data['statusMessage'] ?? 'Unknown error';
    return Left(ApiError(
      errorCode: error.response?.statusCode.toString() ?? 'Unknown',
      errorMessage: errorMessage,
    ));
  }
}
