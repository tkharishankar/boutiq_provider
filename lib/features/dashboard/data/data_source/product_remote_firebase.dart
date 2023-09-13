import 'dart:typed_data';

import 'package:boutiq_provider/features/dashboard/domain/entities/product_resp.dart';
import 'package:boutiq_provider/features/dashboard/presentation/states/product_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../core/common/error/exceptions.dart';
import '../../../../core/local_storage/app_cache.dart';
import '../../../../core/network/api_error.dart';
import '../../../../di/injector.dart';

abstract class ProductRemoteDataSource {
  Future<Either<ApiError, AddProductResp>> addProduct(
      AddProductReq addProductReq);

  Future<Either<ApiError, List<Product>>> getProduct();
}

class IProductRemoteDataSource implements ProductRemoteDataSource {
  final user = sl<AppCache>().getUserInfo();

  @override
  Future<Either<ApiError, AddProductResp>> addProduct(
      AddProductReq addProductReq) async {
    try {
      List<String> fileUrl = await uploadImages(addProductReq.images);
      int status = await addProductToFirebase(addProductReq, fileUrl);
      if (status != 200) {
        return Left(ApiError(
            errorCode: "400",
            errorMessage:
                "Error in adding product please contact support team"));
      } else {
        return const Right(AddProductResp(message: "Product Added successful"));
      }
    } on ApiError catch (error) {
      return Left(error);
    }
  }

  Future<int> addProductToFirebase(
      AddProductReq addProductReq, List<String> fileUrl) async {
    try {
      var db = FirebaseFirestore.instance;
      final productCollection = db.collection("product");
      await productCollection.add({
        "provider_id": user!.phoneNumber,
        "name": addProductReq.name,
        "identifier": addProductReq.identifier,
        "category": addProductReq.category,
        "subCategory": addProductReq.subCategory,
        "subCategoryType": addProductReq.subCategoryType,
        "price": addProductReq.price,
        "deliveryPrice": addProductReq.deliveryPrice,
        "description": addProductReq.description,
        "tags": addProductReq.tags,
        "imageUrls": fileUrl,
      });
      return 200;
    } catch (e) {
      print("uploadImages" + e.toString());
      throw ServerException(message: 'Server Error $e');
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

        // Add the future of getting download URL to the list
        uploadFutures.add(uploadTask.then((_) => storageRef.getDownloadURL()));
      }

      // Wait for all uploads to complete
      final List<String> fileUrls = await Future.wait(uploadFutures);

      return fileUrls;
    } catch (e) {
      print("uploadImages Error: $e");
      throw ServerException(message: 'Server Error $e');
    }
  }

  Future<Either<ApiError, List<Product>>> getProduct() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('product')
          .where('provider_id',
              isEqualTo: user!.phoneNumber)
          .get();

      final List<Product> products = querySnapshot.docs
          .map((DocumentSnapshot document) => Product.fromFirestore(document))
          .toList();

      if (products.isNotEmpty) {
        return Right<ApiError, List<Product>>(products);
      } else {
        return Left<ApiError, List<Product>>(
          ApiError(
            errorCode: "400",
            errorMessage: "Products not found",
          ),
        );
      }
    } catch (e) {
      print("Error fetching products: $e");
      throw ServerException(message: 'Server Error $e');
    }
  }
}
