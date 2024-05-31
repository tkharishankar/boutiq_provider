import 'dart:typed_data';

import 'package:boutiq_provider/features/data/models/product/product_resp.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/common/error/exceptions.dart';
import '../../../../core/local_storage/app_cache.dart';
import '../../../../core/network/api_error.dart';
import '../../../../core/network/api_service.dart';
import '../../../presentation/bloc/product/product_bloc.dart';

abstract class ProductRemoteDataSource {
  Future<Either<ApiError, AddProductResp>> addProduct(AddProduct addProduct);

  Future<Either<ApiError, List<Product>>> getProduct();

  Future<Either<ApiError, ProductDetailResp>> getProductDetail(
      String productId);

  Future<Either<ApiError, AddProductResp>> addProductSize(
      AddProductSize addProductSize);

  Future<Either<ApiError, AddProductResp>> updateProduct(
      UpdateProduct updateProduct);
}

class IProductRemoteDataSource implements ProductRemoteDataSource {
  final ApiService? apiService;

  final AppCache? appCache;

  IProductRemoteDataSource({this.apiService, this.appCache});

  Future<List<String>> uploadImages(List<XFile> images) async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    final List<Future<String>> uploadFutures = [];
    try {
      for (var item in images) {
        final storageRef = firebaseStorage
            .ref('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        final Uint8List imageBytes = await item.readAsBytes();
        final uploadTask = storageRef.putData(imageBytes);
        // Add the future of getting download URL to the list
        uploadFutures.add(uploadTask.then((_) => storageRef.getDownloadURL()));
      }
      // Wait for all uploads to complete
      final List<String> fileUrls = await Future.wait(uploadFutures);
      return fileUrls;
    } catch (e) {
      throw ServerException(message: 'Server Error $e');
    }
  }

  Future<bool> deleteImages(List<String> deletedAvailableImages) async {
    try {
      final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      final storageRef = firebaseStorage.ref();
      for (var url in deletedAvailableImages) {
        Uri uri = Uri.parse(url);
        String path = uri.path;
        String fileName = Uri.decodeComponent(path.split('/').last);
        final desertRef = storageRef.child(fileName);
        await desertRef.delete();
      }
      return true;
    } catch (e) {
      throw ServerException(message: 'Server Error $e');
    }
  }

  @override
  Future<Either<ApiError, AddProductResp>> addProduct(
      AddProduct addProduct) async {
    try {
      final providerId = appCache?.getProviderId();
      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in adding product. Please re-login and try again.");
      }
      final fileUrl = await uploadImages(addProduct.images);
      final updatedReq = AddProductReq(
          name: addProduct.name,
          category: addProduct.identifier,
          description: addProduct.description,
          imageUrls: fileUrl);
      final response = await apiService!.addProduct(providerId, updatedReq);
      if (response.response.statusCode != 200) {
        return handleGeneralError(
            "Error in adding product. Please contact support team.");
      } else {
        final json = response.response.data as Map<String, dynamic>;
        final addProductResp = AddProductResp.fromJson(json);
        return Right(addProductResp);
      }
    } on DioException catch (error) {
      return handleError(error);
    } catch (error) {
      return handleGeneralError(
          "An unexpected error occurred. Please try again.");
    }
  }

  @override
  Future<Either<ApiError, AddProductResp>> addProductSize(
      AddProductSize addProductSize) async {
    try {
      final providerId = appCache?.getProviderId();
      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in adding product size. Please re-login and try again.");
      }
      final updatedReq =
          AddProductSizeReq(productSize: addProductSize.productSizes);
      final response = await apiService!.addProductSize(
          providerId, addProductSize.productId, addProductSize.productSizes);

      if (response.response.statusCode != 200) {
        return handleGeneralError(
            "Error in adding product size. Please contact support team.");
      } else {
        final json = response.response.data as Map<String, dynamic>;
        final addProductResp = AddProductResp.fromJson(json);
        return Right(addProductResp);
      }
    } on DioException catch (error) {
      return handleError(error);
    } catch (error) {
      return handleGeneralError(
          "An unexpected error occurred. Please try again.");
    }
  }

  @override
  Future<Either<ApiError, List<Product>>> getProduct() async {
    try {
      final providerId = appCache?.getProviderId();
      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in adding product size. Please re-login and try again.");
      }
      final response = await apiService!.getProviderProductsList(providerId);

      if (response.response.statusCode == 200) {
        final jsonList = response.response.data as List<dynamic>;
        // Map each element to Map<String, dynamic> and then to Product
        final products = jsonList
            .map((item) => Product.fromJson(item as Map<String, dynamic>))
            .toList();
        return Right(products);
      } else {
        return handleGeneralError("Error in getting details");
      }
    } on DioException catch (error) {
      return handleError(error);
    } catch (e) {
      return handleGeneralError(e.toString());
    }
  }

  @override
  Future<Either<ApiError, ProductDetailResp>> getProductDetail(
      String productId) async {
    try {
      final response = await apiService!.getProductDetail(productId);
      if (response.response.statusCode == 200) {
        final json = response.response.data as Map<String, dynamic>;
        final product = ProductDetailResp.fromJson(json);
        return Right(product);
      } else {
        return handleGeneralError("Error in getting details");
      }
    } on DioException catch (error) {
      return handleError(error);
    }
  }

  @override
  Future<Either<ApiError, AddProductResp>> updateProduct(
      UpdateProduct updateProduct) async {
    try {
      final providerId = appCache?.getProviderId();
      if (providerId == null || providerId.isEmpty) {
        return handleGeneralError(
            "Error in updating product detail. Please re-login and try again.");
      }
      final fileUrl = await uploadImages(updateProduct.newImages);
      final availableImages = updateProduct.availableImages;
      final result = await deleteImages(updateProduct.deletedAvailableImages);

      final updatedReq = AddProductReq(
          name: updateProduct.name,
          category: updateProduct.identifier,
          description: updateProduct.description,
          imageUrls: fileUrl + availableImages);

      final response = await apiService!
          .updateProduct(providerId, updateProduct.productId, updatedReq);
      if (response.response.statusCode != 200) {
        return handleGeneralError(
            "Error in update product detail. Please contact support team.");
      } else {
        final json = response.response.data as Map<String, dynamic>;
        final addProductResp = AddProductResp.fromJson(json);
        return Right(addProductResp);
      }
    } on DioException catch (error) {
      return handleError(error);
    } catch (error) {
      return handleGeneralError(
          "An unexpected error occurred. Please try again. ${error.toString()}");
    }
  }
}

Either<ApiError, T> handleError<T>(DioException error) {
  if (error.response?.statusCode == 4) {
    final errorMessage =
        error.response!.data['statusMessage'] ?? 'Unknown error';
    return Left(ApiError(errorCode: "400", errorMessage: errorMessage));
  } else {
    print(error.response);
    return Left(ApiError(
        errorCode: error.response!.statusCode.toString(),
        errorMessage: "Error in getting details"));
  }
}

Either<ApiError, T> handleGeneralError<T>(String message) {
  print(message);
  return Left(ApiError(errorCode: "400", errorMessage: message));
}
