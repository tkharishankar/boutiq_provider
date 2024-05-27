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
    on<AddProduct>(_onAddProduct);
    on<AddProductSize>(_onAddProductSizes);
    on<GetProducts>(_getProducts);
    on<GetProductDetail>(_getProductDetail);
  }

  Future<void> _onAddProductSizes(AddProductSize addProductSize, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final result = await productRepo.addProductSize(addProductSize);
    await result.fold(
          (failure) async {
        emit(ProductState.addProductError(failure.errorMessage));
      },
          (success) async {
        emit(ProductState.addProductSuccessful(success.message));
        await _handleGetProductDetail(success.productId, emit);
      },
    );
  }

  Future<void> _onAddProduct(AddProduct addProduct, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final result = await productRepo.addProduct(addProduct);
    await result.fold(
          (failure) async {
        emit(ProductState.addProductError(failure.errorMessage));
      },
          (success) async {
        emit(ProductState.addProductSuccessful(success.message));
        await _handleGetProductDetail(success.productId, emit);
      },
    );
  }

  Future<void> _getProductDetail(GetProductDetail getProductDetail, Emitter<ProductState> emit) async {
    emit(const ProductState.onProductDetailLoading());
    final result = await productRepo.getProductDetail(getProductDetail.productId);
    await result.fold(
          (failure) async {
        emit(ProductState.onProductDetailError(failure.errorMessage));
      },
          (success) async {
        emit(ProductState.onProductDetail(success));
      },
    );
  }

  Future<void> _handleGetProductDetail(String productId, Emitter<ProductState> emit) async {
    final result = await productRepo.getProductDetail(productId);
    await result.fold(
          (failure) async {
        emit(ProductState.onProductDetailError(failure.errorMessage));
      },
          (success) async {
        emit(ProductState.onProductDetail(success));
      },
    );
  }

  Future<void> _getProducts(
      GetProducts getProducts, Emitter<ProductState> emit) async {
    emit(const ProductState.loading());
    final failureOrSuccess =
        await productRepo.getProducts();
    failureOrSuccess.fold((failure) {
      emit(ProductState.onProductListError(failure.errorMessage));
    }, (success) {
      emit(ProductState.onProductList(success));
    });
  }
}
