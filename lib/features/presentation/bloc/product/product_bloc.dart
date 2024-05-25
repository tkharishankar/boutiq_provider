import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/product/product_resp.dart';
import '../../../domain/repositories/product_repo.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo productRepo;

  ProductBloc({required this.productRepo}) : super(_Initial()) {
    on<AddProductReq>(_onAddProduct);
    on<GetProducts>(_getProducts);
    on<GetProductDetail>(_getProductDetail);
  }

  Future<void> _onAddProduct(
      AddProductReq addProductReq, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());

    final failureOrSuccess = await productRepo.addProduct(addProductReq);

    failureOrSuccess.fold((failure) {
      emit(ProductState.addProductError(failure.errorMessage));
    }, (success) {
      emit(ProductState.addProductSuccessful(success.message));
    });
  }

  Future<void> _getProducts(
      GetProducts getProducts, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final failureOrSuccess =
        await productRepo.getProducts(getProducts.providerID);
    failureOrSuccess.fold((failure) {
      emit(ProductState.onProductListError(failure.errorMessage));
    }, (success) {
      emit(ProductState.onProductList(success));
    });
  }

  Future<void> _getProductDetail(
      GetProductDetail getProductDetail, Emitter<ProductState> emit) async {
    emit(const ProductState.onProductDetailLoading());
    print("_getProductDetail called");
    final failureOrSuccess =
        await productRepo.getProductDetail(getProductDetail.productId);
    failureOrSuccess.fold((failure) {
      emit(ProductState.onProductDetailError(failure.errorMessage));
    }, (success) {
      emit(ProductState.onProductDetail(success));
    });
  }

}
