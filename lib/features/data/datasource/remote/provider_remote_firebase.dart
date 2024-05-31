import 'dart:typed_data';

import 'package:boutiq_provider/features/data/datasource/remote/product_remote_firebase.dart';
import 'package:boutiq_provider/features/data/models/login/login_response.dart';
import 'package:boutiq_provider/features/data/models/provider/order_dashboard_resp.dart';
import 'package:boutiq_provider/features/presentation/bloc/provider/provider_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/common/error/exceptions.dart';
import '../../../../core/local_storage/app_cache.dart';
import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_service.dart';

abstract class ProviderRemoteDataSource {
  Future<Either<ApiError, OrderDashboardResp>> getDashboardDetails();

  Future<Either<ApiError, Provider>> getGetProviderDetail();

  Future<Either<ApiError, bool>> updateProviderDetail(
      UpdateProviderDetail req);
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
      print("getGetProviderDetail $error");
      return handleError(error);
    } catch (e) {
      print("getGetProviderDetail $e");
      return handleGeneralError(
          "Error in fetching account detail. Please re-login and try again.");
    }
  }

  Future<List<String>> uploadImages(List<XFile> images) async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    final List<Future<String>> uploadFutures = [];
    try {
      for (var item in images) {
        final storageRef = firebaseStorage
            .ref('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        final Uint8List imageBytes = await item.readAsBytes();
        final uploadTask = storageRef.putData(imageBytes);
        uploadFutures.add(uploadTask.then((_) => storageRef.getDownloadURL()));
      }
      final List<String> fileUrls = await Future.wait(uploadFutures);
      return fileUrls;
    } catch (e) {
      throw ServerException(message: 'Server Error $e');
    }
  }

  @override
  Future<Either<ApiError, bool>> updateProviderDetail(
      UpdateProviderDetail req) async {
    try {
      final providerId = appCache?.getProviderId();

      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in updating provider detail. Please re-login and try again.");
      }

      var updatedReq = UpdateProviderReq(
          companyName: req.companyName,
          bannerImageUrl: req.bannerImageUrl,
          place: req.placeName,
          contactPerson: ContactPersonDetail(
              name: req.contactName, phoneNumber: req.contactNumber));

      if (req.isImageChanged) {
        final fileUrl = await uploadImages([req.file!]);
        updatedReq = updatedReq.copyWith.call(bannerImageUrl: fileUrl.first);
      }

      print(providerId);
      print(updatedReq);
      final response = await apiService!
          .updateProviderDetail(providerId, updatedReq);

      if (response.response.statusCode != 200) {
        return handleGeneralError(
            "Error in update product detail. Please contact support team.");
      } else {
        return const Right(true);
      }
    } on DioException catch (error) {
      return handleError(error);
    } catch (error) {
      return handleGeneralError(
          "An unexpected error occurred. Please try again. ${error.toString()}");
    }
  }
}
