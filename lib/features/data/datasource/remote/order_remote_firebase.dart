import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_service.dart';
import '../../models/order/order_summary.dart';

abstract class OrderRemoteDataSource {
  Future<Either<ApiError, List<OrderSummary>>> getOrder(String providerID);

  Future<Either<ApiError, List<OrderStatusTrace>>> getOrderStatusTraces(
      String orderId);

  Future<Either<ApiError, String>> updateOrderStatus(
      String orderId, OrderStatusUpdateReq orderStatusUpdateReq);
}

class IOrderRemoteDataSource implements OrderRemoteDataSource {
  final ApiService? apiService;

  IOrderRemoteDataSource({this.apiService});

  @override
  Future<Either<ApiError, List<OrderSummary>>> getOrder(
      String providerID) async {
    try {
      final response = await apiService!.getProviderOrdersList(providerID);

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
      debugPrint("updateOrderStatus ${response?.response.statusCode}");
      debugPrint("updateOrderStatus response data: ${response?.response.data}");

      if (response != null && response.response.statusCode == 200) {
        return const Right("Success");
      } else {
        return Left(ApiError(
            errorCode: response?.response.statusCode.toString() ?? 'Unknown',
            errorMessage: "Error in getting details"));
      }
    } on DioException catch (error) {
      debugPrint("updateOrderStatus DioException: $error");
      debugPrint("updateOrderStatus response data: ${error.response?.data}");

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
      debugPrint("updateOrderStatus Exception: $e");
      return Left(ApiError(
          errorCode: 'Unknown', errorMessage: "Unexpected error occurred"));
    }
  }
}
