import 'dart:developer';
import 'dart:typed_data';

import 'package:boutiq_provider/features/data/models/product/product_resp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/common/error/exceptions.dart';
import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_service.dart';
import '../../../presentation/bloc/product/product_bloc.dart';
import '../../models/order/order_summary.dart';

abstract class OrderRemoteDataSource {
  Future<Either<ApiError, List<OrderSummary>>> getOrder(String providerID);

  Future<Either<ApiError, List<OrderStatusTrace>>> getOrderStatusTraces(String orderId);
}

class IOrderRemoteDataSource implements OrderRemoteDataSource {
  final ApiService? apiService;

  IOrderRemoteDataSource({this.apiService});


  @override
  Future<Either<ApiError, List<OrderSummary>>> getOrder(String providerID) async {
    try {
      final response = await apiService!.getProviderOrdersList(providerID);
      debugPrint("Provider Reg response ${response.response.data}");

      if (response.response.statusCode == 200) {
        List<Map<String, dynamic>> jsonList = response.response.data.cast<Map<String, dynamic>>();
        List<OrderSummary> orders = jsonList.map((json) => OrderSummary.fromJson(json)).toList();
        return Right(orders);
      } else {
        return Left(ApiError(
            errorCode: response.response.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }

    } on DioException catch (error) {

      if (error.response?.statusCode == 400) {
        log('Bad request: ${error.response?.data}');
        final errorMessage = error.response!.data['statusMessage'] ?? 'Unknown error';
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
  Future<Either<ApiError, List<OrderStatusTrace>>> getOrderStatusTraces(String orderId) async {
    try {
      final response = await apiService!.getOrderStatusTraces(orderId);
      if (response.response.statusCode == 200) {
        List<Map<String, dynamic>> jsonList = response.response.data.cast<Map<String, dynamic>>();
        List<OrderStatusTrace> orders = jsonList.map((json) => OrderStatusTrace.fromJson(json)).toList();
        return Right(orders);
      } else {
        return Left(ApiError(
            errorCode: response.response.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }

    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        log('Bad request: ${error.response?.data}');
        final errorMessage = error.response!.data['statusMessage'] ?? 'Unknown error';
        return Left(ApiError(errorCode: "400", errorMessage: errorMessage));
      } else {
        log('Dio error: $error');
        return Left(ApiError(
            errorCode: error.response!.statusCode.toString(),
            errorMessage: "Error in getting details"));
      }
    }
  }
}
