import 'dart:developer';

import 'package:boutiq_provider/features/data/datasource/remote/product_remote_firebase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/local_storage/app_cache.dart';
import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_service.dart';
import '../../models/order/order_summary.dart';

abstract class OrderRemoteDataSource {
  Future<Either<ApiError, List<OrderSummary>>> getOrder();

  Future<Either<ApiError, List<OrderStatusTrace>>> getOrderStatusTraces(
      String orderId);

  Future<Either<ApiError, String>> updateOrderStatus(
      String orderId, OrderStatusUpdateReq orderStatusUpdateReq);
}

class IOrderRemoteDataSource implements OrderRemoteDataSource {
  final ApiService? apiService;
  final AppCache? appCache;

  IOrderRemoteDataSource({this.apiService, this.appCache});

  @override
  Future<Either<ApiError, List<OrderSummary>>> getOrder() async {
    try {
      final providerId = appCache?.getProviderId();
      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in adding product size. Please re-login and try again.");
      }

      final response = await apiService!.getProviderOrdersList(providerId);

      if (response.response.statusCode == 200) {
        List<Map<String, dynamic>> jsonList =
            response.response.data.cast<Map<String, dynamic>>();
        List<OrderSummary> orders =
            jsonList.map((json) => OrderSummary.fromJson(json)).toList();
        return Right(orders);
      } else {
        return Left(ApiError(
            errorCode: response.response.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }
    } on DioException catch (error) {
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
  Future<Either<ApiError, List<OrderStatusTrace>>> getOrderStatusTraces(
      String orderId) async {
    try {
      final response = await apiService!.getOrderStatusTraces(orderId);
      if (response.response.statusCode == 200) {
        List<Map<String, dynamic>> jsonList =
            response.response.data.cast<Map<String, dynamic>>();
        List<OrderStatusTrace> orders =
            jsonList.map((json) => OrderStatusTrace.fromJson(json)).toList();
        return Right(orders);
      } else {
        return Left(ApiError(
            errorCode: response.response.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }
    } on DioException catch (error) {
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
  Future<Either<ApiError, String>> updateOrderStatus(
      String orderId, OrderStatusUpdateReq orderStatusUpdateReq) async {
    try {
      final response = await apiService?.updateOrderStatus(orderId, orderStatusUpdateReq);
      if (response != null && response.response.statusCode == 200) {
        return const Right("Success");
      } else {
        return Left(ApiError(
            errorCode: response?.response.statusCode.toString() ?? 'Unknown',
            errorMessage: "Error in getting details"));
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        log('Bad request: ${error.response?.data}');
        final responseData = error.response?.data;
        final errorMessage = responseData is Map<String, dynamic> && responseData['statusMessage'] is String
            ? responseData['statusMessage']
            : 'Unknown error';
        return Left(ApiError(errorCode: "400", errorMessage: errorMessage));
      } else {
        return Left(ApiError(
            errorCode: error.response?.statusCode.toString() ?? 'Unknown',
            errorMessage: "Error in getting details"));
      }
    } catch (e) {
      return Left(ApiError(
          errorCode: 'Unknown', errorMessage: "Unexpected error occurred"));
    }
  }
}
