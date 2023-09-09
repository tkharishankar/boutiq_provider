import 'package:boutiq_provider/core/network/api_error.dart';
import 'package:boutiq_provider/features/dashboard/presentation/states/product_bloc.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/product_resp.dart';
import '../data_source/product_remote_firebase.dart';

abstract class ProductRepo {
  Future<Either<ApiError, AddProductResp>> addProduct(
      AddProductReq addProductReq);

  // Future<Either<ApiError, List<Product>>> getProducts();
}

class ProductRepository implements ProductRepo {
  late ProductRemoteDataSource productRemoteDataSource;

  ProductRepository({required this.productRemoteDataSource});

  @override
  Future<Either<ApiError, AddProductResp>> addProduct(
      AddProductReq addProductReq) async {
    return await productRemoteDataSource.addProduct(addProductReq);
  }

  // @override
  // Future<Either<ApiError, List<Product>>> getProducts() {
  //   return await productRemoteDataSource.getProduct();
  // }
}
