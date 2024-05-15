import 'package:boutiq_provider/core/network/api_error.dart';
import 'package:dartz/dartz.dart';

import '../../data/datasource/remote/product_remote_firebase.dart';
import '../../data/models/product/product_resp.dart';
import '../../presentation/bloc/product/product_bloc.dart';

abstract class ProductRepo {
  Future<Either<ApiError, AddProductResp>> addProduct(
      AddProductReq addProductReq);

  Future<Either<ApiError, List<Product>>> getProducts(String providerID);
}

class ProductRepository implements ProductRepo {
  late ProductRemoteDataSource productRemoteDataSource;

  ProductRepository({required this.productRemoteDataSource});

  @override
  Future<Either<ApiError, AddProductResp>> addProduct(
      AddProductReq addProductReq) async {
    return await productRemoteDataSource.addProduct(addProductReq);
  }

  @override
  Future<Either<ApiError, List<Product>>> getProducts(String providerID) async {
    return await productRemoteDataSource.getProduct(providerID);
  }
}
