import 'package:boutiq_provider/core/network/api_error.dart';
import 'package:dartz/dartz.dart';

import '../../data/datasource/remote/product_remote_firebase.dart';
import '../../data/models/product/product_resp.dart';
import '../../presentation/bloc/product/product_bloc.dart';

abstract class ProductRepo {
  Future<Either<ApiError, AddProductResp>> addProduct(AddProduct addProduct);

  Future<Either<ApiError, AddProductResp>> addProductSize(
      AddProductSize addProductSize);

  Future<Either<ApiError, List<Product>>> getProducts();

  Future<Either<ApiError, ProductDetailResp>> getProductDetail(
      String productId);
}

class ProductRepository implements ProductRepo {
  late ProductRemoteDataSource productRemoteDataSource;

  ProductRepository({required this.productRemoteDataSource});

  @override
  Future<Either<ApiError, AddProductResp>> addProduct(
      AddProduct addProduct) async {
    return await productRemoteDataSource.addProduct(addProduct);
  }

  @override
  Future<Either<ApiError, AddProductResp>> addProductSize(
      AddProductSize addProductSize) async {
    return await productRemoteDataSource.addProductSize(addProductSize);
  }

  @override
  Future<Either<ApiError, List<Product>>> getProducts() async {
    return await productRemoteDataSource.getProduct();
  }

  @override
  Future<Either<ApiError, ProductDetailResp>> getProductDetail(
      String productId) async {
    return await productRemoteDataSource.getProductDetail(productId);
  }
}
